import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/module_auth/forgot_pass/repository/forgot_pass_repo.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/constants/Colors.dart';
import '../../../../core/utils/custom_loading_button.dart';
import '../../../sign_in/ui/widgets/form_textfield.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

final GlobalKey<FormState> _forgotKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();

class _ForgotScreenState extends State<ForgotScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _forgotKey,
            child: ResponsiveRowColumn(
              layout: ResponsiveRowColumnType.COLUMN,
              children: [
                 ResponsiveRowColumnItem(
                  child: Text('Write your email to send a link to change the password')
                ),
              
                ResponsiveRowColumnItem(
                  child: FormTextField(
                    controller: emailController,
                    validator: true,
                    hint: 'Email',
                     email: true,
                  ),
                ),
              
                ResponsiveRowColumnItem(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomLoadingButton(
                  bgColor: greenColor,
                  textColor: Colors.white,
                  loading: false,
                  text: 'Send reset password link',
                  buttonTab: () {
                      if (_forgotKey.currentState!.validate()) {
                        ForgotPassRepo().forgotPass(emailController.text.trim());
                      }
                  },
                ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
