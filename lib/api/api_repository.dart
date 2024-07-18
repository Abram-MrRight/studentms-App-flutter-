import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:studentms_app/Models/responses/studentDetails_response.dart';
import 'package:studentms_app/api/api_provider.dart';

import '../pages/studentsList/students_controller.dart';

class ApiRepository {
  final ApiProvider apiProvider;
  final logger = Logger();

  ApiRepository({required this.apiProvider});

  Future<StudentsResponse?> getStudentDetails() async {
    const url = 'http://46.101.198.244:4040/api/students/getstudents';
    logger.i('Url: get $url');

    try {
      final response = await http.get(Uri.parse(url));
      logger.i('Response status: ${response.statusCode}');
      logger.i('Response body: ${response.body}');
      if (response.statusCode == 200) {
        return StudentsResponse.fromRawJson(response.body);
      } else {
        logger.e('Failed to fetch student details: ${response.statusCode}');
        return null;
      }
    } on SocketException catch (e) {
      logger.e('SocketException: ${e.message}');
      logger.e('Stack trace: ${e}');
      return null;
    } catch (e) {
      logger.e('Error fetching student details: $e');
      logger.e('Stack trace: ${e}');
      return null;
    }

  }
  Future<void> deleteStudent(int studentId) async {
    final response = await http.delete(Uri.parse('http://46.101.198.244:4040/api/students/deleteStudent/$studentId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete student');
    }
  }
  Future<void> updateStudent(Student student) async {
    final response = await http.put(
      Uri.parse('http://46.101.198.244:4040/api/students/updateStudent/${student.id}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': student.name,
        'studentClass': student.studentClass,
        // Add other student fields here
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update student');
    }
  }

  Future<void> addStudent(Student student) async {
    final response = await http.post(
      Uri.parse('http://46.101.198.244:4040/api/students/addStudent'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'first_name': student.name,
        'gender': student.gender,
        'age': student.age,
        'class': student.studentClass,
        'physical_address': student.physicalAddress,
        'parent_phone_number': student.parentPhoneNumber,
        'expected_fees': student.expectedFees,
      }),
    );

    if (response.statusCode != 200) {
      logger.e('Failed to add student: ${response.statusCode}');
      logger.e('Response body: ${response.body}');
      throw Exception('Failed to add student');
    }
  }

  Future<Map<String, dynamic>> getPayments() async {
    final response = await http.get(Uri.parse('http://46.101.198.244:4040/api/students/getPayments'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load payments');
    }
  }
  Future<List<Payment>> getPaymentsByStudentId(int studentId) async {
    final response = await http.get(Uri.parse('http://46.101.198.244:4040/api/students/getPayments/$studentId'));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      if (body['status_code'] == 1005 && body['payments'] != null) {
        List<Payment> payments = List<Payment>.from(
          body['payments'].map((payment) => Payment.fromJson(payment)),
        );
        return payments;
      } else {
        throw Exception('Failed to load payments');
      }
    } else {
      throw Exception('Failed to load payments');
    }
  }
  Future<void> addPayment(int studentId, double amount, DateTime paymentDate) async {
    final response = await http.post(
      Uri.parse('http://46.101.198.244:4040/api/students/addPayment/$studentId'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'amount': amount,
        'payment_date': paymentDate.toIso8601String(),
      }),
    );

    if (response.statusCode != 200) {
      logger.e('Failed to add payment: ${response.statusCode}');
      logger.e('Response body: ${response.body}');
      throw Exception('Failed to add payment');
    }
  }
}

class Payment {
  final int paymentId;
  final int amount;
  final DateTime paymentDate;
  final int studentId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Payment({
    required this.paymentId,
    required this.amount,
    required this.paymentDate,
    required this.studentId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentId: json['payment_id'],
      amount: json['amount'],
      paymentDate: DateTime.parse(json['payment_date']),
      studentId: json['student_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

