// To parse this JSON data, do
//
//     final classroomsModel = classroomsModelFromJson(jsonString);

import 'dart:convert';

ClassroomsModel classroomsModelFromJson(String str) => ClassroomsModel.fromJson(json.decode(str));

String classroomsModelToJson(ClassroomsModel data) => json.encode(data.toJson());

class ClassroomsModel {
  List<Classroom> classrooms;

  ClassroomsModel({
    required this.classrooms,
  });

  factory ClassroomsModel.fromJson(Map<String, dynamic> json) => ClassroomsModel(
    classrooms: List<Classroom>.from(json["classrooms"].map((x) => Classroom.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classrooms": List<dynamic>.from(classrooms.map((x) => x.toJson())),
  };
}

class Classroom {
  int id;
  String layout;
  String name;
  int size;

  Classroom({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
    id: json["id"],
    layout: json["layout"],
    name: json["name"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "layout": layout,
    "name": name,
    "size": size,
  };
}
