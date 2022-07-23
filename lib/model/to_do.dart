import 'dart:convert';

ReminderModel reminderModelFromJson(String str) => ReminderModel.fromJson(json.decode(str));

String reminderModelToJson(ReminderModel data) => json.encode(data.toJson());

class ReminderModel {
  ReminderModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum> data;

  factory ReminderModel.fromJson(Map<String, dynamic> json) => ReminderModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.alertText,
    required this.reminderDate,
    required this.reminderTime,
  });

  int id;
  String alertText;
  DateTime reminderDate;
  String reminderTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    alertText: json["alert_text"],
    reminderDate: DateTime.parse(json["reminder_date"]),
    reminderTime: json["reminder_time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "alert_text": alertText,
    "reminder_date": "${reminderDate.year.toString().padLeft(4, '0')}-${reminderDate.month.toString().padLeft(2, '0')}-${reminderDate.day.toString().padLeft(2, '0')}",
    "reminder_time": reminderTime,
  };
}
