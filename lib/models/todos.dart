/* 
{
 "todoId": 1,
 "headings": "helw",
 "details" : "jkhfjkshfkj",
 "dueDate": "02/02/2020",
 "createdAt": "02/02/2020",
 
}
*/
// To parse this JSON data, do
//
//     final todos = todosFromJson(jsonString);
import 'dart:convert';

import 'package:equatable/equatable.dart';

Todos todosFromJson(String str) => Todos.fromMap(json.decode(str));

String todosToJson(Todos data) => json.encode(data.toMap());

class Todos extends Equatable {
  final int? todoId;
  final String headings;
  final String details;
  final String dueDate;
  final String createdAt;

  Todos({
    this.todoId,
    required this.headings,
    required this.details,
    required this.dueDate,
    required this.createdAt,
  });

  factory Todos.fromMap(Map<String, dynamic> json) => Todos(
        todoId: json["todoId"],
        headings: json["headings"],
        details: json["details"],
        dueDate: json["dueDate"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toMap() => {
        "todoId": todoId,
        "headings": headings,
        "details": details,
        "dueDate": dueDate,
        "createdAt": createdAt,
      };

  @override
  List<Object?> get props => [todoId, headings, details, dueDate, createdAt];
}
