import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:studentms_app/Models/responses/studentDetails_response.dart';
import 'package:studentms_app/api/api_provider.dart';

class ApiRepository {
  final ApiProvider apiProvider;
  final logger = Logger();

  ApiRepository({required this.apiProvider});

  Future<StudentsResponse?> getStudentDetails() async {
    const url = 'http://46.101.198.244:7001/api/students/getstudents';
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
}
