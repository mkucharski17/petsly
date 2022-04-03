class NameValidator {
  static bool isValid(String? name) {
    return name != null && name.isNotEmpty;
  }
}
