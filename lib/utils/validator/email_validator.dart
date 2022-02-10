class EmailValidator {
  static bool isValid(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }

    return emailRegExp.hasMatch(email);
  }
}

final emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
