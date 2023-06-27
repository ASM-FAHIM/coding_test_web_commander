import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_commander_code_test/constant/colors.dart';
import 'package:web_commander_code_test/module/controller/login_controller.dart';
import 'package:web_commander_code_test/widget/ReusableTextField.dart';
import 'package:web_commander_code_test/widget/ReusableTextfieldPassword.dart';
import 'package:web_commander_code_test/widget/big_text.dart';
import 'package:web_commander_code_test/widget/global_button.dart';
import 'package:web_commander_code_test/widget/small_text.dart';

import '../../constant/dimensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: Dimensions.height120),
                child: Container(
                  width: Dimensions.height50,
                  height: Dimensions.height50,
                  decoration: const BoxDecoration(
                      // color: Colors.white,
                      ),
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              BigText(text: 'Log in to WebCommander'),
              SizedBox(
                height: Dimensions.height10,
              ),
              SmallText(
                text: 'A complete eCommerce platform',
                size: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: Dimensions.height420,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                          ])),
                  child: Form(
                    key: loginController.loginKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableEmailField(
                          labelText: 'Email Address',
                          hintText: 'Enter email address',
                          textEditingController: loginController.email,
                          onSaved: (value) {
                            loginController.emailText = value!;
                          },
                          validator: (value) {
                            return loginController.validateUserName(value!);
                          },
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Obx(() {
                          return ReusablePassField(
                            labelText: 'Password',
                            hintText: 'Enter password',
                            textEditingController: loginController.password,
                            obscureText: loginController.obscureText.value,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                loginController.toggle();
                              },
                              child: Icon(loginController.obscureText.value
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility_off),
                            ),
                            onSaved: (value) {
                              loginController.passwordText = value!;
                            },
                            validator: (value) {
                              return loginController.validatePassword(value!);
                            },
                          );
                        }),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        GlobalButton(
                          onPressed: () {
                            loginController.loginMethod();
                          },
                          buttonText: 'Login',
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        BigText(
                          text: 'Forgot Password?',
                          color: AppColor.commonColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
