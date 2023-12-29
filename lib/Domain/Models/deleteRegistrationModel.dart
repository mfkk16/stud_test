import 'dart:convert';

DeleteRegistrationModel deleteRegistrationModelFromJson(String str) => DeleteRegistrationModel.fromJson(json.decode(str));

String deleteRegistrationModelToJson(DeleteRegistrationModel data) => json.encode(data.toJson());

class DeleteRegistrationModel {
  String? error;
  String? message;

  DeleteRegistrationModel({
    this.error,
    this.message,
  });

  factory DeleteRegistrationModel.fromJson(Map<String, dynamic> json) => DeleteRegistrationModel(
    error: json["error"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
  };
}
