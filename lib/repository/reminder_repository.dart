import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';
import 'package:reminder/model/to_do.dart';
const baseUrl = "https://dev.boq.wireandswitch.com/api/create_reminder";
const token = "51|CpCTPXzm2B3E09qZ5vJ3SLqja1EnQlPxR0aC9tBC";
const addApi = "/create_reminder";
const viewApi = "/edit_reminder";


class ReminderRepository {
  Future addReminder(text, date, time) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
              '$baseUrl?alert_text=$text&reminder_date=$date&reminder_time=$time'),
          headers: {
            "Authorization": "Bearer $token",
            "accept": "application/json"
          });
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("result is $data");
        return reminderModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
