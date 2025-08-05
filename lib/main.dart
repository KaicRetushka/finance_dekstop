import 'package:finance_dekstop/pages/home.dart';
import 'package:flutter/material.dart';

import 'package:finance_dekstop/pages/reg.dart';

void main() {
  runApp(MaterialApp(
    onGenerateRoute: (settings) {
      if (settings.name == '/') {
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => Reg(),
          transitionDuration: Duration.zero,
        );
      } else if (settings.name == '/home') {
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => Home(),
          transitionDuration: Duration.zero,
        );
      }
    },
  ));
}
