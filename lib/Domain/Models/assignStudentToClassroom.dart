import 'dart:convert';

AssignStudentToClassroomModel assignStudentToClassroomModelFromJson(String str) => AssignStudentToClassroomModel.fromJson(json.decode(str));

String assignStudentToClassroomModelToJson(AssignStudentToClassroomModel data) => json.encode(data.toJson());

class AssignStudentToClassroomModel {
  String? error;
  Registration? registration;

  AssignStudentToClassroomModel({
    this.error,
    this.registration,
  });

  factory AssignStudentToClassroomModel.fromJson(Map<String, dynamic> json) => AssignStudentToClassroomModel(
        error: json["error"],
        registration: json["registration"] == null ? null : Registration.fromJson(json["registration"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "registration": registration?.toJson(),
      };
}

class Registration {
  int id;
  int student;
  int subject;

  Registration({
    required this.id,
    required this.student,
    required this.subject,
  });

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        id: json["id"],
        student: json["student"],
        subject: json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student": student,
        "subject": subject,
      };
}
