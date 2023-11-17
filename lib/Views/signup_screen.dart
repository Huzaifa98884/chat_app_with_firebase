import 'package:chat_appwith_firebase/constants%20and%20widgets/contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants and widgets/custom_appbar.dart';
import '../constants and widgets/underlined_textfield.dart';
import '../constants and widgets/validator_functions.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomSizedBox.heightBox(0.1),
          Image.asset('assets/soccer.png' ,
          color: primary,
            height: MediaQuery.sizeOf(context).height * 0.1,
            fit: BoxFit.fill,
          ),
          CustomSizedBox.heightBox(0.03),
          Text(
            "CHAT APP",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: MediaQuery.of(context).size.width * 0.1,
              fontWeight: FontWeight.w400,
              color: primary,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
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
                          label: 'Name',
                          controller: nameController,
                          textInputType: TextInputType.emailAddress,
                          validator: ValidatorFunctions.validateName,
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
                                    'SignUp',
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
                            Get.offAllNamed('/login');
                          }, child: Text(
                          "Login", style: TextStyle(
                            fontSize: 20,
                            color: primary,
                            decoration: TextDecoration.underline,
                            decorationColor: primary
                        ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
