import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipe_app/core/constants/Colors.dart';
import 'package:food_recipe_app/core/utils/custom_loading_button.dart';
import 'package:food_recipe_app/core/utils/helpers/custom_flushbar.dart';
import 'package:food_recipe_app/module_homepage/ui/screen/homepage_screen.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  Timer? timer;
  bool canResend = false;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();

      Timer.periodic(Duration(seconds: 3), (_) => checkisEmailVerified());
    }
  }

  Future checkisEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  @override
  void dispose() {
    if (isEmailVerified) timer?.cancel();

    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
     
    } catch (e) {
      CustomFlushBarHelper.createError(title: 'title', message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? HomePageScreen()
        : Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('We have sent a verification link to your email'),
                CustomLoadingButton(
                    bgColor: greenColor,
                    text: "Resend Link",
                    textColor: Colors.white,
                    loading: false,
                    buttonTab: () {
                      sendVerificationEmail();
                    }),
                CustomLoadingButton(
                    bgColor: Colors.grey.shade50,
                    text: "Cancel",
                    textColor: greenColor,
                    loading: false,
                    buttonTab: () {
                      FirebaseAuth.instance.signOut();
                    }),
              ],
            ),
          );
  }
}
