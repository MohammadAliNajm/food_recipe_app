import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipe_app/core/constants/Colors.dart';
import 'package:food_recipe_app/core/utils/custom_loading_button.dart';
import 'package:food_recipe_app/module_auth/forgot_pass/ui/screen/forgot_pass_screen.dart';
import 'package:food_recipe_app/module_auth/sign_in/repository/sign_in_repo.dart';
import 'package:food_recipe_app/module_auth/sign_in/ui/widgets/form_textfield.dart';
import 'package:food_recipe_app/module_auth/sign_up/ui/widgets/logo_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, required this.toggle});
  final VoidCallback toggle;
  @override
  State<SignInScreen> createState() => SignInScreenState();
}

final GlobalKey<FormState> _signinKey = GlobalKey<FormState>();

class SignInScreenState extends State<SignInScreen> {
  late AsyncSnapshot loadingSnapshot;
  late StreamSubscription streamSubscription;
  @override
  void initState() {
    loadingSnapshot = AsyncSnapshot.nothing();
    SignInRepo(this).loadingStream.listen((event) {
      setState(() {
        loadingSnapshot = event;
      });
      
    });
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _signinKey,
            child: ResponsiveRowColumn(
              layout: ResponsiveRowColumnType.COLUMN,
              children: [
                ResponsiveRowColumnItem(child: LogoWidget(text: 'Sign in to your account')),
                ResponsiveRowColumnItem(
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: FormTextField(
                      controller: emailController,
                      validator: true,
                      hint: 'Email', email: false,
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: FormTextField(
                      controller: passController,
                      validator: true,
                      password: true,
                      hint: 'Password',
                     email: false,
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumn(
                    rowMainAxisAlignment: MainAxisAlignment.end,
                    layout: ResponsiveRowColumnType.ROW,
                    children: [
                      ResponsiveRowColumnItem(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ForgotScreen()));
                            },
                            child: const Text('Forgot password?')),
                      )
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomLoadingButton(
                  bgColor: greenColor,
                  textColor: Colors.white,
                  loading: loadingSnapshot.connectionState ==
                          ConnectionState.waiting,
                  text: 'Sign in',
                  buttonTab: () {
                      if (_signinKey.currentState!.validate()) {
                        SignInRepo(this).SignIn(
                            emailController.text.trim(), passController.text.trim());
                      }
                  },
                ),
                    )),
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumn(
                    layout: ResponsiveRowColumnType.ROW,
                    rowMainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ResponsiveRowColumnItem(
                        child: Text("Don't have an account?"),
                      ),
                      ResponsiveRowColumnItem(
                        child: TextButton(
                            onPressed: widget.toggle, child: Text('Sign Up')),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
