import 'package:tasksmanager/generated/l10n.dart';

class AppValidator {
  final int maxLength;
  final int minLength;
  List<InputValidator> validators;

  AppValidator(
      {required this.validators, this.maxLength = 20, this.minLength = 8});

  String? validate(String? input) {
    String trimmedInput = input!.trim();
    if (validators.contains(InputValidator.requiredField)) {
      if (trimmedInput.isEmpty) {
        return S.current.requiredField;
      }
    } else if (input.isEmpty) {
      return null;
    }

    if (validators.contains(InputValidator.email)) {
      if (!RegExp(r'^[A-Z0-9._%+-]+@[A-Z0-9._]+\.[A-Z]{2,4}$',
          caseSensitive: false)
          .hasMatch(input ?? '')) {
        return S.current.emailIsNotValid;
      }
    }
    if (validators.contains(InputValidator.minLength)) {
      if (trimmedInput.length < minLength) {
        return S.current.minLengthValidator(minLength);
        //return S.current.valueIsNotValid;
      }
    }

    if (validators.contains(InputValidator.login_minlength)) {
      if (trimmedInput.length < minLength) {
        return S.current.invalidPhoneNumber;
        //return S.current.valueIsNotValid;
      }
    }

    if (validators.contains(InputValidator.maxLength)) {
      if (trimmedInput.length > maxLength) {
        // return S.current.minLengthValidator(maxLength);
        return S.current.valueIsNotValid;
      }
    }
    if (validators.contains(InputValidator.mobile)) {
      if (!RegExp(r'0[0-9]{0,14}').hasMatch(input ?? '')) {
        return S.current.mobileIsNotValid;
      }
    }

    if (validators.contains(InputValidator.login_mobile)) {
      if (!RegExp(r'^(09|\+?9639|\+?009639)\d{8}$').hasMatch(input ?? '')) {
        return '${S.current.mobileIsNotValid} 09xxxxxxxx';
      }
    }

    if (validators.contains(InputValidator.url)) {
      if (!RegExp(r"[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?").hasMatch(trimmedInput)) {
        return S.current.urlIsNotValid;
      }
    }
    if (validators.contains(InputValidator.positiveValue)) {
      if (!RegExp(r"^[+]?\d+([.]\d+)?").hasMatch(trimmedInput)) {
        return S.current.valueMustBePositive;
      }
    }


    if (validators.contains(InputValidator.noSpaces)) {
      if (!RegExp(r'^\S+$').hasMatch(input ?? '')) {
        return S.current.shouldntHaveSpaces;
      }
    }

    return null;
  }

  static String? validateIntegerDropDown(int? value) {
    if (value == -1) {
      return S.current.requiredField;
    }
    return null;
  }

  static String? validateStringDropDown(String? value) {
    if (value == '-1') {
      return S.current.requiredField;
    }
    return null;
  }
}

enum InputValidator { email, requiredField, minLength, maxLength, mobile,url,positiveValue, login_mobile, login_minlength, noSpaces}
