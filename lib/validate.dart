class Validate {
  static String? emailValidate(String value) {
    if (value!.isEmpty) {
      return 'Email is required';
    }
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    if(!emailValid){
      return 'Enter valid email';
    }
  }

  static String? passValidate(String value) {
    if (value!.isEmpty) {
      return 'Email is required';
    }
    bool emailValid = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value);
    if(!emailValid){
      return 'Enter valid email';
    }
    return "";
  }
}