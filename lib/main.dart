/*
Don't forget to add these 2 lines at the beggining of windows\runner\main.cpp

#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
auto bdw = bitsdojo_window_configure(BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP);

*/

// import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monilet/ui/view/home_page.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));

  // doWhenWindowReady(() {
  //   final win = appWindow;
  //   const initialSize = Size(300, 720);
  //   win.minSize = initialSize;
  //   win.size = initialSize;
  //   win.alignment = Alignment.topLeft;
  //   win.title = "Custom window with Flutter";
  //   win.show();
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
