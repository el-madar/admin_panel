  final RegExp _emailRegExp = RegExp(
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
);
  final RegExp _passwordRegExp = RegExp(
  r'^.{8,50}$',
);

  final RegExp _nameUser = RegExp(
  r'.[a-zA-Z0-9-].{2,15}',
);

  final RegExp _characters = RegExp(
  r'[a-zA-Z]',
);
  final RegExp _phone = RegExp(
  r'(^(?:[+0]9)?[0-9]{10,12}$)',
);
  bool isValidEmail(String email) {
  return _emailRegExp.hasMatch(email);
}

  bool isValidPassword(String password) {
  return _passwordRegExp.hasMatch(password);
}

  bool isValidConfirmPassword(String password,String confirmPassword) {
    return password==confirmPassword;
  }

  bool isValidCharacters(String char) {
  return _characters.hasMatch(char);
}

  bool isValidPhone(String char) {
  return _phone.hasMatch(char);
}

 bool isValidNameUser(String char) {
  return _nameUser.hasMatch(char);
}

