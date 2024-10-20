import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_care_vendor/core/config/routes/app_routes.dart';
import '../../../main.dart';

class SplashNotifier extends StateNotifier<void> {
  Timer? timer;

  SplashNotifier() : super(null) {
    init();
  }

  Future<void> init() async {
    timer = Timer(const Duration(seconds: 1), () {
      goNext();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void goNext() {
    Navigator.of(appContext).pushNamedAndRemoveUntil(RouteName.home, (route) => false);
  }
}

final splashNotifierProvider = StateNotifierProvider<SplashNotifier, void>((ref) {
  return SplashNotifier();
});
