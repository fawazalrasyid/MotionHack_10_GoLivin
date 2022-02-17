import '../helpers/helpers.dart';

class FormValidator {
  static String? validateName(String value) {
    return Helpers.isEmptyString(value) ? 'Name field must be filled' : null;
  }

  static String? validatePhoneNumber(String value) {
    return Helpers.isEmptyString(value)
        ? 'Password field must be filled'
        : null;
  }

  static String? validateEmail(String value) {
    if (Helpers.isEmptyString(value)) {
      return 'Email field must be filled';
    }

    if (!Helpers.isEmailString(value)) {
      return 'Must be a valid email';
    }

    return null;
  }

  static String? validatePassword(String value) {
    return Helpers.isEmptyString(value)
        ? 'Password field must be filled'
        : null;
  }
}
