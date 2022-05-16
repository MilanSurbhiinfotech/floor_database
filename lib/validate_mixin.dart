mixin Validate {
  bool isPasswordValid(String password) => password.length == 6;

  bool isStringEmpty(String value) {
    return value.isEmpty;
  }

  bool isValidateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  bool equalsCase(String string1, String string2) {
    return string1 == string2;
  }

  bool validNumber(String string) {
    return string.length == 10;
  }

  bool equalsIgnoreCase(String string1, String string2) {
    return string1.toLowerCase() == string2.toLowerCase();
  }

  bool validOTP(String string1) {
    return string1.length == 4;;
  }
}
