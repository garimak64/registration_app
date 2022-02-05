class FieldValidatorMixin {
  final _validGenders = const ['male', 'female', 'transgender', 'na'];

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return "Email is required";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "Invalid email";
    }
  }

  String? validateName(String name) {
    if (name.isEmpty) {
      return 'Please enter name';
    }
  }

  String? validatePassword(pwd) {
    if (pwd!.length < 6) {
      return "Minimum length = 6";
    }
  }

  String? validateGender(String gender) {
    if (!_validGenders.contains(gender.toLowerCase())) {
      return 'Not a valid gender';
    }
  }

  String? validatePhone(String phone) {
    if (phone.length < 10) {
      return "Invalid Phone number";
    }
  }
}
