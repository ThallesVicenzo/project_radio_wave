import 'dart:io';

enum AppImage {
  errorImage('error-image.jpg'),
  logo('logo.gif'),
  backgroundImage('background.gif'),
  backgroundImage2('background-2.png'),
  appIcon('radio_synthwave.jpg'),
  homeBackground('home-background.png');

  const AppImage(this.name);

  final String name;

  String get _defaultPath => 'assets/images/';

  String get path => '$_defaultPath$name';

  File get file => File(path);
}
