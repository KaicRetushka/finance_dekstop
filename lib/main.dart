import 'package:finance_dekstop/pages/home.dart';
import 'package:flutter/material.dart';

import 'package:finance_dekstop/pages/reg.dart';
import 'package:finance_dekstop/postgres_query.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PostgresQuery.openConnection();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    PostgresQuery.closeConnection();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
