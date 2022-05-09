import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monilet/ffi.dart';

class HomeViewModel extends ChangeNotifier {
  double used = 0;
  int frequency = 0;

  void initialise() {
    Timer.periodic(const Duration(seconds: 1), (_) async {
      used = await api.getCpuUsed();
      frequency = await api.getCpuFrequency();
      notifyListeners();
    });
  }
}
