import 'package:dart_mysql/connection.dart';

main() async {
  var conn = await MySql.connect(host: 'localhost', user: 'root', password: 'root', db: 'dart_mysql');

  await conn.queryMulti(
    'INSERT INTO users (first_name, last_name) VALUES (?, ?)',
    [
      ['Billy', 'Nibs'],
      ['Joe', 'Bloggs'],
      ['Tom', 'Doe'],
      ['John', 'Minnie'],
      ['Jack', 'Adams'],
    ]
  );

  conn.close();
}