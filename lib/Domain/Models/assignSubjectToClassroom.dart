import 'dart:convert';

SubjectToClassroomModel subjectToClassroomModelFromJson(String str) => SubjectToClassroomModel.fromJson(json.decode(str));

String subjectToClassroomModelToJson(SubjectToClassroomModel data) => json.encode(data.toJson());

class SubjectToClassroomModel {
  int id;
  String layout;
  String name;
  int size;
  int subject;

  SubjectToClassroomModel({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
    required this.subject,
  });

  factory SubjectToClassroomModel.fromJson(Map<String, dynamic> json) => SubjectToClassroomModel(
        id: json["id"],
        layout: json["layout"],
        name: json["name"],
        size: json["size"],
        subject: json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "layout": layout,
        "name": name,
        "size": size,
        "subject": subject,
      };
}
