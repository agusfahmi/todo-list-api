// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  TodoModel({
    this.title,
    this.id,
  });

  String? title;
  String? id;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    title: json["title"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "id": id,
  };
}
