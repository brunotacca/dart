import 'dart:html';

void main() {
  querySelector('#output').text = 'Dart Web - Stagehand example';
  var divs = querySelectorAll('ul li');
  var cursos = [
    'Dart',
    'Flutter',
    'PHP',
    'Slim Framework',
  ];

  for (var i=0; i < divs.length; i++) {
    divs[i].text = cursos[i];
  }
}
