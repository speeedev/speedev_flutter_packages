class SDValidatorHelper {
  static RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static RegExp phoneRegex = RegExp(r'^(\+?[0-9]{1,3})?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?$');
  static RegExp urlRegex = RegExp(r'^https?://(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$');

  static bool isEmail(String email) {
    return emailRegex.hasMatch(email);
  }

  static bool isPhone(String phone) {
    return phoneRegex.hasMatch(phone);
  }

  static bool isUrl(String url) {
    return urlRegex.hasMatch(url);
  }
}
