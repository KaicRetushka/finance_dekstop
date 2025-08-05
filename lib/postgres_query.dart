import 'package:flutter/cupertino.dart';
import 'package:postgres/postgres.dart';

class PostgresQuery {
  // static final storage = FlutterSecureStorage();
  static var _conn;

  static Future<void> openConnection() async {
    _conn = await Connection.open(
        Endpoint(
          host: '77.91.87.201',
          database: 'finance_db',
          password: 'pashka2007',
          username: 'postgres',
        ));
  }

  static void closeConnection() {
    _conn.close();
  }

  static Future<bool> insertUser(String login, String password) async {
    var response = await _conn.execute(
      Sql.named('SELECT * FROM users WHERE login=@login'),
      parameters: {'login': login},
    );
    print(response.runtimeType);
    if (response.length > 0){
      return false;
    }
    else {
      var response = await _conn.execute(
        Sql.named(
          'INSERT INTO users(login, password) '
              'VALUES(@login, crypt(@password, gen_salt(\'bf\'))) RETURNING id',
        ),
        parameters: {'login': login, 'password': password},
      );
      // var id = response[0][0];
      // storage.write(key: 'id', value: id.toString());
      return true;
    }
  }
  // static Future<void> selectLogin(String name) async{
  //   var response = await _conn.execute(
  //     Sq
  //   )
  // }
}
