String validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password cannot be blank';
  } else if (value.length < 6) {
    return 'Password must contain at least 6 symbols';
  }
  return null;
}
