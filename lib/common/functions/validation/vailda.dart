abstract class Validation {
  static isEmpty(String value) {
    if (value.isEmpty) return "This Filed is empty";
  }

  static emailFormat(String value) {
    isEmpty(value);
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return 'You should enter valid email';
    }
    if (!value.endsWith('.com')) {
      return 'Invalid email , Must end with ".com"';
    }
    return null;
  }

  static checkConformation(
      {required String value, required String compareWith}) {
    if (value.isEmpty) return "This Filed is empty";
    if (value != compareWith) {
      return 'Invaild Password';
    }
    return null;
  }
}
