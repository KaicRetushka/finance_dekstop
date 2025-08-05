import 'package:finance_dekstop/widgets/btn_auth.dart';
import 'package:finance_dekstop/widgets/err_text_auth.dart';
import 'package:finance_dekstop/widgets/mini_btn_auth.dart';
import 'package:finance_dekstop/widgets/text_header_auth.dart';
import 'package:flutter/material.dart';

import 'package:finance_dekstop/widgets/text_field_auth.dart';
import 'package:finance_dekstop/postgres_query.dart';

class Reg extends StatefulWidget {
  const Reg({super.key});

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  TextEditingController controllerLogin = TextEditingController();
  TextEditingController controllerPWD = TextEditingController();
  TextEditingController controllerRepeatPWD = TextEditingController();
  String errLogin = '';
  String errPWD = '';
  String errRepeatPWD = '';

  Future<void> init() async {
    bool isAuth = await PostgresQuery.checkAuth();
    if (isAuth){
      Navigator.pushNamed(context, '/home');
    }
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
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Card(
          color: Colors.white,
          child: Container(
            width: 560,
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextHeaderAuth(text: 'Регистрация'),
                TextFieldAuth(
                  labelText: 'Логин',
                  controller: controllerLogin,
                  obscureText: false,
                ),
                ErrTextAuth(text: errLogin),
                TextFieldAuth(
                  labelText: 'Пароль',
                  controller: controllerPWD,
                  obscureText: true,
                ),
                ErrTextAuth(text: errPWD),
                TextFieldAuth(
                  labelText: 'Повторный пароль',
                  controller: controllerRepeatPWD,
                  obscureText: true,
                ),
                ErrTextAuth(text: errRepeatPWD),
                BtnAuth(
                  fun: () async {
                    if (controllerLogin.text == '' ||
                        controllerPWD.text == '' ||
                        controllerRepeatPWD.text == '' ||
                        controllerPWD.text != controllerRepeatPWD.text) {
                      setState(() {
                        errLogin = controllerLogin.text == ''
                            ? 'Это поле обязательное'
                            : '';
                        errPWD = controllerPWD.text == ''
                            ? 'Это поле обязательное'
                            : '';
                      });
                      if (controllerRepeatPWD.text == ''){
                        setState(() {
                          errRepeatPWD = 'Это поле обязательное';
                        });
                      }
                      else if (controllerPWD.text != controllerRepeatPWD.text) {
                        setState(() {
                          errRepeatPWD = 'Пароли не совпадают';
                        });
                      }
                    }
                    else {
                      setState(() {
                        errLogin = '';
                        errPWD = '';
                        errRepeatPWD = '';
                      });
                      bool response = await PostgresQuery.insertUser(
                        controllerLogin.text,
                        controllerPWD.text,
                      );
                      if (response){
                        Navigator.pushNamed(context, '/home');
                      }
                      else {
                        setState(() {
                          errLogin = 'Такой логин уже занят';
                        });
                      }
                    }
                  },
                  text: 'Зарегистрироваться',
                ),
                MiniBtnAuth(text: 'Войти', routeName: '/entrance'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
