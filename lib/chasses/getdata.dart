import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Allcountris {
  final String flag;
  final String countryname;
  final String link;

  Allcountris(
      {required this.flag, required this.countryname, required this.link});

  late bool isdaytime;
  late String timenow;
  late String country;

  getdata() async {
    Response getmydata =
        await get(Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
    Map receiveddata = jsonDecode(getmydata.body);
    DateTime timeget = DateTime.parse(receiveddata["utc_datetime"]);
    int timegetplus = int.parse(receiveddata["utc_offset"].substring(0, 3));
    DateTime realtime = timeget.add(Duration(hours: timegetplus));

    if (realtime.hour > 5 && realtime.hour < 18) {
      isdaytime = true;
    } else {
      isdaytime = false;
    }

    timenow = DateFormat('hh:mm a').format(realtime);
    country = receiveddata["timezone"];
  }
}
