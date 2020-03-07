void main() {
  var name = 'Tacca';
  if (name != 'Tacca') {
    print('inside if');
  }
  print('terminou');

  var age = 9;
  if (age > 18) {
    print('age above 18');
  } else if (age >= 10) {
    print('age above or equal 10');
  } else {
    print('age below 10');
  }

  String action = 'PENDING';

  switch (action) {
    case 'OPEN':
      print('I open');
      break;
    case 'CLOSE':
      print('I close');
      break;
    case 'PENDING':
      print('In progress');
      break;
    case 'FINISHED':
      print('Done');
      break;
    default:
      print('Unknown action');
  }
}
