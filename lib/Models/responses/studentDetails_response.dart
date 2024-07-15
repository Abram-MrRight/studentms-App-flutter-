import 'dart:convert';

class StudentsResponse {
  StudentsResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.numberOfStudents,
    required this.studentsStatus,
    required this.totalOutstandingBalances,
    required this.totalPayments,
    required this.totalExpectedFees,
  });

  String status;
  int statusCode;
  String message;
  int numberOfStudents;
  List<StudentStatus> studentsStatus;
  int totalOutstandingBalances;
  int totalPayments;
  int totalExpectedFees;

  factory StudentsResponse.fromRawJson(String str) =>
      StudentsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentsResponse.fromJson(Map<String, dynamic> json) => StudentsResponse(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
        numberOfStudents: json["number_of_students"],
        studentsStatus: List<StudentStatus>.from(json["studentsStatus"].map((x) => StudentStatus.fromJson(x))),
        totalOutstandingBalances: json["totalOutstandingBalances"],
        totalPayments: json["totalPayments"],
        totalExpectedFees: json["totalExpectedFees"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
        "number_of_students": numberOfStudents,
        "studentsStatus": List<dynamic>.from(studentsStatus.map((x) => x.toJson())),
        "totalOutstandingBalances": totalOutstandingBalances,
        "totalPayments": totalPayments,
        "totalExpectedFees": totalExpectedFees,
      };
}

class StudentStatus {
  StudentStatus({
    required this.studentId,
    required this.firstName,
    required this.gender,
    required this.age,
    required this.studentClass,
    required this.physicalAddress,
    required this.parentPhoneNumber,
    required this.payments,
    required this.status,
  });

  int studentId;
  String firstName;
  String gender;
  int age;
  String studentClass;
  String physicalAddress;
  String parentPhoneNumber;
  List<Payment> payments;
  Status status;

  factory StudentStatus.fromRawJson(String str) => StudentStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentStatus.fromJson(Map<String, dynamic> json) => StudentStatus(
        studentId: json["student_id"],
        firstName: json["first_name"],
        gender: json["gender"],
        age: json["age"],
        studentClass: json["class"],
        physicalAddress: json["physical_address"],
        parentPhoneNumber: json["parent_phone_number"],
        payments: List<Payment>.from(json["payments"].map((x) => Payment.fromJson(x))),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "first_name": firstName,
        "gender": gender,
        "age": age,
        "class": studentClass,
        "physical_address": physicalAddress,
        "parent_phone_number": parentPhoneNumber,
        "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
        "status": status.toJson(),
      };
}

class Payment {
  Payment({
    required this.amount,
    required this.date,
  });

  int amount;
  String date;

  factory Payment.fromRawJson(String str) => Payment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        amount: json["amount"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "date": date,
      };
}

class Status {
  Status({
    required this.expectedFees,
    required this.paidAmount,
    required this.outstandingBalance,
  });

  int expectedFees;
  int paidAmount;
  int outstandingBalance;

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        expectedFees: json["expected_fees"],
        paidAmount: json["paid_amount"],
        outstandingBalance: json["outstanding_balance"],
      );

  Map<String, dynamic> toJson() => {
        "expected_fees": expectedFees,
        "paid_amount": paidAmount,
        "outstanding_balance": outstandingBalance,
      };
}
