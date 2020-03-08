import 'package:args/args.dart';
import 'package:dart_mysql/connection.dart';

/**
 *  1. Configure connection
 *  2. Create the database on mysql 
 *  3. run with args: --mode create-table
 *  4. run with args: --mode insert --first_name John --last_name Doe
 *  5. run with args: --mode select
 *  6. run with args: --mode insert --first_name Mary --last_name Monroe
 *  7. run with args: --mode select-all
 *  8. run with args: --mode update --first_name Hommer --id 1
 *  9. run with args: --mode select-all
 * 10. run with args: --mode delete --id 1
 * 11. run with args: --mode select-all
 * 
 * PS: This is a trifling example. There are better ways to do this. Search for ORM Frameworks.
*/
main(List<String> arguments) async {
  var parser = new ArgParser();

  parser.addOption(
    'mode',
    defaultsTo: 'select-all',
    allowed: ['select-all', 'select', 'insert', 'update', 'delete', 'create-table']
  );

  parser.addOption('id');
  parser.addOption('first_name');
  parser.addOption('last_name');

  var args = parser.parse(arguments);

  print('Executing in mode: ' + args['mode']);

  var conn = await MySql.connect(host: 'localhost', user: 'root', password: 'root', db: 'dart_mysql');

  if (args['mode'] == 'select' || (args['mode'] == 'select-all' && args['id'] != null)) {
    String sql = 'SELECT * FROM users';
    List data = [];

    if (args['id'] != null) {
      sql += ' WHERE id=?';
      data.add(args['id']);
    }

    sql += ' LIMIT 1;';

    var results = await conn.query(sql, data);
    var row = results.first;
    
    print('');
    print('---');

    print('id: ' + row['id'].toString());
    print('first_name: ' + row['first_name']);
    print('last_name: ' + row['last_name']);
  }

  if (args['mode'] == 'select-all') {
    String sql = 'SELECT * FROM users;';
    List data = [];

    var results = await conn.query(sql, data);
    
    print('');
    print('---');

    for(var row in results) {
      print('id: ' + row['id'].toString());
      print('first_name: ' + row['first_name']);
      print('last_name: ' + row['last_name']);
      print('---');
    }

    print('');
    print('Total: ' + results.length.toString());
  }

  if (args['mode'] == 'insert') { 
    var sql = 'INSERT INTO users (first_name, last_name) VALUES (?, ?)';
    await conn.query(sql, [
      args['first_name'],
      args['last_name']
    ]);
    print('done');
  }

  if (args['mode'] == 'update') {
    String sql = 'UPDATE users SET';
    List data = [];

    if (args['first_name'] != null) {
      sql += ' first_name=?';
      data.add(args['first_name']);
    }
    
    if (args['first_name'] != null && args['last_name'] != null) {
      sql += ',';
    }

    if (args['last_name'] != null) {
      sql += ' last_name=?';
      data.add(args['last_name']);
    }

    if (args['id'] != null) {
      sql += ' WHERE id=?';
      data.add(args['id']);
    }

    await conn.query(sql, data);
    print('done');
  }

  if (args['mode'] == 'delete') {
    String sql = 'DELETE FROM users';
    List data = [];

    if (args['id'] != null) {
      sql += ' WHERE id=?';
      data.add(args['id']);
    }

    await conn.query(sql, data);
    print('done');
  }

  if (args['mode'] == 'create-table') {
    var sql = """
      CREATE TABLE `users` (
        `id` int NOT NULL AUTO_INCREMENT,
        `first_name` varchar(100) NOT NULL,
        `last_name` varchar(100) NOT NULL,
        PRIMARY KEY (`id`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    """;
    await conn.query(sql);
    print('done');
  }

  conn.close();
}