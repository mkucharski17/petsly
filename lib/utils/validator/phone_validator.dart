class PhoneValidator {
  static bool isValid(String? phone) {
    if (phone == null || phone.isEmpty) {
      return false;
    }

    return phone.length == 9;
  }
}
