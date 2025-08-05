import 'package:finance_dekstop/postgres_query.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String login = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // PostgresQuery.selectName(login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: SizedBox(),
      ),
      body: Text(login),
    );
  }
}
