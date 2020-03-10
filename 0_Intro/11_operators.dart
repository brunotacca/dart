main() {

  int num = 10+22;
  num = num - 2;
  print(num);

  num = num % 5;
  print(num);

  // relational ==, !=, >=, <=
  if(num==0) print('Zero');

  num = 100;
  num += 2;
  print(num); // 102

  print(++num); // 103
  print(num++); // 103
  print(num+=1); // 105
  print(num-=1); // 104

  print(num); // 104

  if(num > 200 && num < 203) print('201 to 202');

  if(num != 100) print('not 100');

  var n1 = Num();
  int number;
  if(n1!=null) number = n1.numb;
  print(number);

  var n2;
  if(n2!=null) number = n2.numb; // doesn't enter here.
  print(number);

  // number = n2.num; -->> NoSuchMethodError: The getter 'num' was called on null.
  //print(number);

  number = n2?.numb;
  print(number);

  var n3 = Num();
  number = n3?.numb;
  print(number);

  var n4;
  int n5;

  n5 = n4?.num ?? 0; // default to 0 instead of null if n4 is null
  print(n5);
  
  print(n4); // null
  print(n4 ??= 100); // default-assign 100 if n4 is null.
  print(n4);

  // if null operator. `expr1 ?? expr2` evaluates to `expr1` if not `null`, otherwise `expr2`.
  print(null ?? 'New in Dart 1.12');

  // null-aware assignment
  // null-aware assignment. `v ??= expr` causes `v` to be assigned `expr` only if `v` is `null`.
  var x = null;
  x ??= 'are the null-aware operators, friendly to';
  print(x);

  // null-aware access. `x?.p` evaluates to `x.p` if `x` is not `null`, otherwise evaluates to `null`.

  // null-aware method invocation
  // null-aware method invocation. `x?.m()` invokes `m` only if `x` is not `null`.
  var isNull = null;
  print(isNull?.foo()); // null (does not throw exception)

}

class Num {
  int numb = 10;
}