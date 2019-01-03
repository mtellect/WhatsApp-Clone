class Validator {
  static bool isEmpty(String value) {
    return value == null || value.length < 1 || value.toLowerCase == "null";
  }

  static bool isPassMatch(String value, String value2) {
    return value.contains(value2);
  }

  static bool isValidEmail(String email) {
    String p = r"[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  ///  Method to nullify an empty String.
  ///  [value] - A string we want to be sure to keep null if empty
  ///  Returns null if a value is empty or null, otherwise, returns the value
  static String nullify(String value) {
    if (isEmpty(value)) {
      return null;
    }
    return value;
  }

  static String validateAmount(String value) {
    if (isEmpty(value)) {
      return 'Amount to fund cannot be empty!';
    }
    return null;
  }

  static String validateEmail(String value) {
    if (!isValidEmail(value)) {
      return 'Email is invalid';
    }
    return null;
  }

  static String validateName(String value) {
    if (isEmpty(value)) {
      return 'Name is invalid';
    }
    return null;
  }

  static String validateAcctNo(String value) {
    if (isEmpty(value)) {
      return 'Account number is invalid';
    }
    return null;
  }

  static String validateBank(String value) {
    if (isEmpty(value)) {
      return 'Bank is invalid';
    }
    return null;
  }

  static String validatePass(String value) {
    if (isEmpty(value)) {
      return 'Password cannot be empty!';
    }
    return null;
  }

  static String validatePhone(String value) {
    if (isEmpty(value)) {
      return 'Phone number cannot be empty!';
    }
    return null;
  }

  static String validateFname(String value) {
    if (isEmpty(value)) {
      return 'First name cannot be empty!';
    }
    return null;
  }

  static String validateLname(String value) {
    if (isEmpty(value)) {
      return 'Last name cannot be empty!';
    }
    return null;
  }

  static String validateField(String value) {
    if (isEmpty(value)) {
      return 'Field cannot be empty.';
    }
    return null;
  }
}
