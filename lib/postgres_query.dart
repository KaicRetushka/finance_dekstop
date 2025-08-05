import 'package:postgres/postgres.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostgresQuery {
  static Future<bool> insertUser(String login, String password) async {
    final conn = await Connection.open(
      Endpoint(
        host: '77.91.87.201',
        database: 'finance_db',
        password: 'pashka2007',
        username: 'postgres',
      ),
    );
    var response = await conn.execute(
      Sql.named('SELECT * FROM users WHERE login=@login'),
      parameters: {'login': login},
    );
    print(response.runtimeType);
    if (response.length > 0) {
      conn.close();
      return false;
    } else {
      var response = await conn.execute(
        Sql.named(
          'INSERT INTO users(login, password) '
          'VALUES(@login, crypt(@password, gen_salt(\'bf\'))) RETURNING id',
        ),
        parameters: {'login': login, 'password': password},
      );
      int id = response[0][0] as int;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('id', id!);
      conn.close();
      return true;
    }
  }

  static Future<String> selectLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('id');
    final conn = await Connection.open(
      Endpoint(
        host: '77.91.87.201',
        database: 'finance_db',
        password: 'pashka2007',
        username: 'postgres',
      ),
    );
    var response = await conn.execute(
      Sql.named('SELECT login FROM users WHERE id=@id'),
      parameters: {'id': id},
    );
    conn.close();
    return response[0][0].toString();
  }

  static Future<bool> checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('id');
    if (id != null){
      return true;
    }
    return false;
  }
}
