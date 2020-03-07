
main() {
  var s1 = 'Test string';
  var s2 = "Teste string";
  var s3 = 'Test\'s strings';
  var s4 = "Test's strings";
  var s5 = 'Testing "stonks"';
  
  print(s1);
  print(s2);
  print(s3);
  print(s4);
  print(s5);
  print('');

  var s = r'Raw string with special chars \n 读写汉字 - 学中文 ouch... It doesn`t evaluate';
  print(s);

  var multiline = '''
  hello line
  two
  ''';

  print(multiline);

}
