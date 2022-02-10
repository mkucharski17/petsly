class PasswordValidator {
  static bool isValid(String? password) =>
      password != null && password.isNotEmpty && password.length >= 6;
}
