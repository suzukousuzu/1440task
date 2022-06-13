import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ringrin_1440task/model/repository/main_repository.dart';
import 'package:ringrin_1440task/views/screens/base_view_model.dart';
import 'package:uuid/uuid.dart';

final mainViewModelProvider =
ChangeNotifierProvider((ref) {
  // Reader を渡しています（不要なら省略可能）
  return MainViewModel(ref.read);
});

class MainViewModel extends BaseViewModel {
  final Reader _read;
  MainViewModel(this._read);

  late final mainRepository = _read(mainRepositoryProvider);

  ///userId
  //getterでどこからでも取得できるようにする
  static String userId = '';

  @override
  Future<void> init() async {
    //userIdを取得
    userId = await mainRepository.fetchUserId();
    if (userId == "") {
      final uuId = const Uuid().v1();
      userId = uuId;
      await mainRepository.setUserId(userId);
    }

  }

  Future<void>skipIntro() async{
    await mainRepository.skipIntro();
  }

  Future<bool>isSkipIntroScreen() async{
    return await mainRepository.isSkipIntroScreen();
  }

}