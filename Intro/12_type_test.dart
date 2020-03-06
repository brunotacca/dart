main() {

  var x;
  x = 100;
  if(x is int) print('int');
  if(x is double) print('double');
  x = 100.0;

  print(x.runtimeType);

}