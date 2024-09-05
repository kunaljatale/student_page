// To parse this JSON data, do
//
//     final studentData = studentDataFromJson(jsonString);

import 'dart:convert';

List<StudentData> studentDataFromJson(String str) => List<StudentData>.from(json.decode(str).map((x) => StudentData.fromJson(x)));

String studentDataToJson(List<StudentData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentData {
    int userId;
    int id;
    String title;
    String body;

    StudentData({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
