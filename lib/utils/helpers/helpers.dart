class Helpers {
  static bool isEmptyString(String? value) {
    if (value == null) return true;

    return (value == '' || value.trim() == '' || value == 'null');
  }

  static bool isNumberString(String value) {
    String pattern = r'^(^\+62|62|^08)(\d{3,4}-?){2}\d{3,4}$';
    RegExp regex = new RegExp(pattern);

    return regex.hasMatch(value);
  }

  static bool isEmailString(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    return regex.hasMatch(value);
  }
}
