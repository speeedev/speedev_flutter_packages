enum FirebaseAuthErrorCode {
  userNotFound(code: "user_not_found"),
  wrongPassword(code: "wrong_password"),
  emailAlreadyInUse(code: "email_already_in_use"),
  weakPassword(code: "weak_password"),
  invalidEmail(code: "invalid_email"),
  networkError(code: "network_error"),
  unknown(code: "unknown");

  const FirebaseAuthErrorCode({required this.code});
  final String code;
}