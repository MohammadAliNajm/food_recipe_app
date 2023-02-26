import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipe_app/core/constants/Colors.dart';
import 'package:food_recipe_app/core/utils/custom_loading_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveRowColumn(
          layout: ResponsiveRowColumnType.COLUMN,
          children: [
            ResponsiveRowColumnItem(
                child: Text(
                    'Welcome to homepage: ${user.displayName} with Id:${user.uid}')),
            ResponsiveRowColumnItem(
                child: CustomLoadingButton(
              bgColor: greenColor,
              text: 'Sign out',
              buttonTab: () {
                FirebaseAuth.instance.signOut();
              },
              textColor: Colors.white,
              loading: false,
            ))
          ]),
    );
  }
}
