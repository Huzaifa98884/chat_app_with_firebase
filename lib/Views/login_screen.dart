import 'package:flutter/material.dart';
import '../constants and widgets/contants.dart';
import '../constants and widgets/underlined_textfield.dart';
import '../constants and widgets/validator_functions.dart';
import 'package:get/get.dart';

import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    emailController.text = "abc@gmail.com";
    passwordController.text = '12345678';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(color: primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBox.heightBox(0.2),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "CHAT",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: MediaQuery.of(context).size.width * 0.1,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text: "APP",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: MediaQuery.of(context).size.width * 0.1,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomSizedBox.heightBox(0.09),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.02),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontFamily: "SF Pro Display",
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomSizedBox.heightBox(0.03),
                      UnderlinedTextField(
                        label: 'Email',
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        validator: ValidatorFunctions.validateEmail,
                      ),
                      CustomSizedBox.heightBox(0.03),
                      UnderlinedTextField(
                        label: 'Password',
                        controller: passwordController,
                        textInputType: TextInputType.text,
                        obscureText: true,
                        validator: ValidatorFunctions.validatePassword,
                      ),
                      CustomSizedBox.heightBox(0.03),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextButton(
                                onPressed: (){
                                  if (_formKey.currentState!.validate()) {
                                    Get.toNamed('/main');
                                  }
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: primary,
                                  padding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: MediaQuery.of(context).size.width * 0.05,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    height: MediaQuery.of(context).size.width * 0.0025,
                                  ),
                                ),
                              ),
                            ),
                            // if (_isLoading)
                            //   Positioned.fill(
                            //     child: Center(
                            //       child: CircularProgressIndicator(
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //   ),
                          ],
                        ),
                      ),
                      CustomSizedBox.heightBox(0.01),
                      TextButton(
                        onPressed: (){
                          Get.offAllNamed('/signup');
                      }, child: Text(
                        "Signup", style: TextStyle(
                          fontSize: 20,
                          color: primary,
                          decoration: TextDecoration.underline,
                          decorationColor: primary
                      ),
                      ),
                      ),
                      CustomSizedBox.heightBox(0.02),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
