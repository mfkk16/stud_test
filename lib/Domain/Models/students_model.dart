// To parse this JSON data, do
//
//     final studentsModel = studentsModelFromJson(jsonString);

import 'dart:convert';

StudentsModel studentsModelFromJson(String str) => StudentsModel.fromJson(json.decode(str));

String studentsModelToJson(StudentsModel data) => json.encode(data.toJson());

class StudentsModel {
  List<Student> students;

  StudentsModel({
    required this.students,
  });

  factory StudentsModel.fromJson(Map<String, dynamic> json) => StudentsModel(
    students: List<Student>.from(json["students"].map((x) => Student.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "students": List<dynamic>.from(students.map((x) => x.toJson())),
  };
}

class Student {
  int age;
  String email;
  int id;
  String name;

  Student({
    required this.age,
    required this.email,
    required this.id,
    required this.name,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    age: json["age"],
    email: json["email"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "email": email,
    "id": id,
    "name": name,
  };
}
