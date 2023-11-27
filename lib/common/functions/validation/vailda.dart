abstract class Validation {
  static isEmpty(String value) {
    if (value.isEmpty) return "This Filed is empty";
  }

  static emailFormat(String value) {
    if (value.isEmpty) return "This Filed is empty";
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return 'You should enter valid email';
    }
    return null;
  }
}
