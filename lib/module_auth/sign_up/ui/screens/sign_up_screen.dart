import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipe_app/core/utils/helpers/custom_flushbar.dart';
import 'package:food_recipe_app/module_auth/sign_up/ui/widgets/logo_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/constants/Colors.dart';
import '../../../../core/utils/custom_loading_button.dart';
import '../../../sign_in/ui/widgets/form_textfield.dart';
import '../../repository/signup_repo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.toggle});
  final VoidCallback toggle;
  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController confirmController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController ageController = TextEditingController();
class SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
                key: _signupKey,
                child: ResponsiveRowColumn(
                  layout: ResponsiveRowColumnType.COLUMN,
                  children: [
                 const   ResponsiveRowColumnItem(
                      child: LogoWidget(text: 'Sign up for free')
                     
                      
                    ),
                    ResponsiveRowColumnItem(
                      child: FormTextField(
                        padding: 14,
                        controller: emailController,
                        validator: true,
                        hint: 'Email',
                         email: true,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: FormTextField(
                        padding: 14,
                        controller: passController,
                        validator: true,
                        password: true,
                        hint: 'Password', email: false,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: FormTextField(
                        padding: 14,
                        controller: confirmController,
                        validator: true,
                        password: true,
                        hint: 'Confirm Password', email: false,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomLoadingButton(
                            
                      bgColor: greenColor,
                      textColor: Colors.white,
                      loading: false,
                      text: 'Sign up',
                      buttonTab: () {
                          if (_signupKey.currentState!.validate()) {
                            if (passController.text != confirmController.text) {
                              CustomFlushBarHelper.createError(
                                  title: "title",
                                  message: 'Passwords are unidentical').show(context);
                            }else {
                                SignupRepo(this).signUp(emailController.text.trim(),
                                passController.text.trim(),20,'');
                            }
                          
                          }
                      },
                    ),
                        )),
                    ResponsiveRowColumnItem(
                        child: ResponsiveRowColumn(
                      layout: ResponsiveRowColumnType.ROW,
                      rowMainAxisAlignment:MainAxisAlignment.center ,
                      children: [
                        ResponsiveRowColumnItem(
                          child: Text("Already have an account?"),
                        ),
                        ResponsiveRowColumnItem(
                          child: TextButton(
                              onPressed: widget.toggle, child: Text('Sign In')),
                        )
                      ],
                    ))
                  ],
                ))),
      ),
    );
  }
}
