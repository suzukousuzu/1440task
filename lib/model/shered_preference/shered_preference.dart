import 'package:flutter/src/material/time.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sheredPreferenceProvider =
Provider<SheredPreference>((ref) => SheredPreference());

class SheredPreference {

  Future<void> setBedTime(TimeOfDay selectedTime) async{
    final pref = await SharedPreferences.getInstance();
    //時間の保存
    pref.setInt('settingBedTimeHour', selectedTime.hour);
    //分の保存
    pref.setInt('settingBedTimeMinute', selectedTime.minute);

    //就寝時間を設定したかの保存
    pref.setBool("settingIsBedTime", true);
  }

  Future<TimeOfDay> fetchBedTime() async{
    final pref = await SharedPreferences.getInstance();
    int settingBedTimeHour = pref.getInt("settingBedTimeHour") ?? 0;
    int settingBedTimeMinute = pref.getInt("settingBedTimeMinute") ?? 0;
    TimeOfDay selectedTime =
    TimeOfDay(hour: settingBedTimeHour, minute: settingBedTimeMinute);
    print(selectedTime);
    return selectedTime;
  }

  Future<String> fetchUserId() async{
    final pref = await SharedPreferences.getInstance();
    return pref.getString("userId") ?? "";
  }

  Future<void>setUserId(String userId) async{
    final pref = await SharedPreferences.getInstance();
    pref.setString("userId", userId);
  }

  Future<void>skipIntro() async{
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isSkipIntro", true);
  }

  Future<bool>isSkipIntroScreen() async{
    final pref = await SharedPreferences.getInstance();
    return pref.getBool("isSkipIntro") ?? false;
  }


}