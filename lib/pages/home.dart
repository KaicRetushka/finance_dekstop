import 'package:finance_dekstop/postgres_query.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String login = '';

  Future<void> init() async {
    login = await PostgresQuery.selectLogin();
    setState(() {
      login;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: SizedBox(),
        actions: [
          TextButton(onPressed: (){}, child: Text(login))
        ],
      ),
    );
  }
}
