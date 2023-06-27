import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_commander_code_test/routes/route_helper.dart';

class LoginController extends GetxController {
  late TextEditingController email, password;

  final GlobalKey<FormState> loginKey = GlobalKey();
  RxBool flag1 = false.obs;
  RxBool flag2 = false.obs;

  var emailText = '';
  var passwordText = '';
  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
  }

  //validation of textField
  String? validateUserName(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid user name";
    } else {
      flag1.value = true;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    } else {
      flag2.value = true;
    }
    return null;
  }

  void checkValidation() {
    final isValid = loginKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginKey.currentState!.save();
  }

  //for toggling eye
  RxBool obscureText = true.obs;
  void toggle() {
    obscureText.value = !obscureText.value;
  }

  //login and routing
  RxBool isLoading1 = false.obs;
  void loginMethod() async {
    try {
      isLoading1(true);
      if (email.text.isEmpty || password.text.isEmpty) {
        checkValidation();
      } else {
        //api calling, authentication,

        Get.snackbar('Success', 'login Successful',
            backgroundColor: Colors.white,
            duration: const Duration(seconds: 1));
        Get.toNamed(RouteHelper.home);
        clear();
      }
    } finally {
      isLoading1(false);
    }
  }

  void clear() {
    email.clear();
    password.clear();
  }
}
