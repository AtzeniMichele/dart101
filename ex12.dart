// Write a password generator in Dart. Be creative with how you generate passwords - strong passwords have a mix of lowercase letters,
//uppercase letters, numbers, and symbols. The passwords should be random, generating a new password every time.
// Include your run-time code in a main method

import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  // we want to generate a weak passowrd
  String type = 'weak';
  print('I am generating a $type password');
  String pw = passwordGenerator(type);
  print(pw);

  // we want to generate a medium passowrd
  type = 'medium';
  print('I am generating a $type password');
  String pw2 = passwordGenerator(type);
  print(pw2);

// we want to generate a strong passowrd
  type = 'strong';
  print('I am generating a $type password');
  String pw3 = passwordGenerator(type);
  print(pw3);

  // what if we give as input a wrong word?
  type = 'easy';
  print('I am generating a $type password');
  String pw4 = passwordGenerator(type);
  print(pw4);
}

// generator of pw
String shuffleGenerator(int strength) {
  // cryptographically secure random number generator
  final random = Random.secure();
  List<int> intList = List.generate(strength, (_) => random.nextInt(255));
  // convert bytes into ASCII characters
  List<String> charList = base64UrlEncode(intList).split('').toList();
  // be even more random
  charList.shuffle();
  return charList.join('');
}

// controller of what type of pw has been requested
String passwordGenerator(String strength) {
  final String pw;
  switch (strength.toLowerCase()) {
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
