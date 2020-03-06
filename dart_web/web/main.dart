import 'dart:html';

void clickExample(MouseEvent event) {
  event.preventDefault();
  var ul = querySelector('ul');

  var liCake = Element.html('<li class="blue">CakePHP</li>');
  ul.children.add(liCake);
}

void main() {
  querySelector('#output').text = 'Dart Web - Stagehand example';

  var ul = querySelector('ul');
  var cursos = [
    'Dart',
    'Flutter',
    'PHP',
    'Slim Framework',
    'Laravel',
  ];

  for(var i=0; i<cursos.length; i++) {
    var li = LIElement();
    li.text = cursos[i];
    ul.children.add(li);
  }

  var liCake = Element.html('<li class="red">CakePHP</li>');
  ul.children.add(liCake);

  var link = Element.a();
  link.setAttribute('href', 'https://github.com/dart-lang/stagehand');
  link.setAttribute('target', 'blank');
  link.text = 'Go to the website';
  link.onClick.listen(clickExample);

  querySelector('footer').children.add(link);
}
