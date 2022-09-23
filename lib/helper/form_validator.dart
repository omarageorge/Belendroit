class FormValidator {
  static validateUsername(String? value) {
    if (value == null || value.isEmpty || (value.length < 3)) {
      return 'Username should contain at least 3 characters.';
    }
    return null;
  }
}
