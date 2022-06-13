
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ringrin_1440task/views/main_view_model.dart';
import 'package:ringrin_1440task/views/screens/intro/intro.dart';
import 'package:ringrin_1440task/views/screens/task_list/task_list_screen.dart';

import '../firebase_options.dart';
import 'constants/fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainViewModel = ref.watch(mainViewModelProvider);
    return MaterialApp(
        title: '1440task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: regular
        ),
        localizationsDelegates: [
          // S.delegate,
          // JapaneseCupertinoLocalizations.delegate,
          // GlobalMaterialLocalizations.delegate,
          // GlobalCupertinoLocalizations.delegate,
          // GlobalWidgetsLocalizations.delegate
        ],
        // supportedLocales: [
        //   const Locale("ja"),
        // ],
        home: FutureBuilder(
          future : mainViewModel.isSkipIntroScreen(),
          initialData: true,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return const TaskListScreen();
            } else {
              return const IntroScreen();
            }
          }
        )
    );
  }
}
