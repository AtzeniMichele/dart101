import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  String type = 'weak';
  print('I am generating a $type password');
  String pw = passwordGenerator(type);
  print(pw);

  type = 'medium';
  print('I am generating a $type password');
  String pw2 = passwordGenerator(type);
  print(pw2);

  type = 'strong';
  print('I am generating a $type password');
  String pw3 = passwordGenerator(type);
  print(pw3);

  type = 'easy';
  print('I am generating a $type password');
  String pw4 = passwordGenerator(type);
  print(pw4);
}

// generator of pw
String shuffleGenerator(int strength) {
  final random = Random.secure();
  List<int> intList = List.generate(strength, (_) => random.nextInt(255));
  List<String> charList = base64UrlEncode(intList).split('').toList();
  charList.shuffle();
  return charList.join('');
}

// controller of what type of pw has been requested
String passwordGenerator(String strength) {
  final String pw;
  switch (strength) {
    case 'weak':
      pw = shuffleGenerator(5);
      break;
    case 'medium':
      pw = shuffleGenerator(15);
      break;
    case 'strong':
      pw = shuffleGenerator(25);
      break;
    default:
      pw =
          'No pw generated, word $strength needs to be either weak, medium, strong.';
      break;
  }
  return pw;
}
