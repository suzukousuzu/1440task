import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ringrin_1440task/model/manager/db_manager.dart';
import 'package:ringrin_1440task/model/repository/task_list_repository.dart';

import '../shered_preference/shered_preference.dart';

final  mainRepositoryProvider =
Provider<MainRepository>((ref) => MainRepository(ref.read));

class MainRepository {
  final Reader _read;
  MainRepository(this._read);

  late final dbManager = _read(dbManagerProvider);
  late final sheredPreference = _read(sheredPreferenceProvider);

  Future<String>fetchUserId() async{
    return await sheredPreference.fetchUserId();
  }

  Future<void>setUserId(String userId) async{
    await sheredPreference.setUserId(userId);
  }

  Future<void>skipIntro() async{
    await sheredPreference.skipIntro();
  }

  Future<bool>isSkipIntroScreen() async{
    return await sheredPreference.isSkipIntroScreen();
  }


}