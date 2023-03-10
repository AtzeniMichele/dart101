//Write a function that given a string provided by the main function containing
//brackets [], braces {}, parentheses (), or any combination thereof that follows the
//math expression rules, returns a boolean that is true if any and all pairs are matched and nested correctly.
//Then print the result in the main function.
//Example:
//This is ok: {this[is(o)]}k
//This is not ok: T{hi[(sis)not}ok]
//This is not ok: {{this[is(notok)]}}

void main(List<String> args) {
  //Set the string to be checked
  String str = '{this[is(o)]}k';

  //Get and print the results
  print('Checking ' + str);
  print(checkParentheses(str));

  //Another example
  str = 'T{hi[(sis)not}ok]';

  //Get and print the results
  print('Checking ' + str);
  print(checkParentheses(str));

  //Another example
  str = '{{this[is(notok)]}}';

  //Get and print the results
  print('Checking ' + str);
  print(checkParentheses(str));
}

bool checkParentheses(String str) {
  // init some variables
  bool ret = true;

  // flag for each type of parentheses
  bool flagBrackets = false;
  bool flagBraces = false;
  bool flagPar = false;

  // counter for each couple of parentrheses
  int countBtrckets = 0;
  int countBraces = 0;
  int countPar = 0;

  for (var i = 0; i < str.length; i++) {
    // open
    if (str[i] == '{') {
      if (!flagBraces && !flagBrackets && !flagPar && countBraces == 0) {
        flagBraces = true; // opened
        print('Opened {');
      } else {
        // something not following the order of brackets
        ret = false;
        break;
      }
    }

    if (str[i] == '[') {
      if (!flagBrackets && !flagPar && countBtrckets == 0) {
        flagBrackets = true; // opened
        print('Opened [');
      } else {
        // something not following the order of brackets
        ret = false;
        break;
      }
    }

    if (str[i] == '(') {
      if (!flagPar && countPar == 0) {
        flagPar = true; // opened
        print('Opened (');
      } else {
        // something not following the order of brackets
        ret = false;
        break;
      }
    }

    // closing
    if (str[i] == ')') {
      if (flagPar && countBraces == 0 && countBtrckets == 0) {
        flagPar = false; // closed
        countPar++;
        print('Closed )');
      } else {
        // something not following the order of brackets
        ret = false;
        break;
      }
    }

    if (str[i] == ']') {
      if (flagBrackets && countBraces == 0) {
        flagBrackets = false; // closed
        countBtrckets++;
        print('Closed ]');
      } else {
        // something not following the order of brackets
        ret = false;
        break;
      }
    }

    if (str[i] == '}') {
      if (flagBraces) {
        flagBraces = false; // closed
        countBraces++;
        print('Closed }');
      } else {
        // something not following the order of brackets
        ret = false;
        break;
      }
    }
  }
  return ret;
}
