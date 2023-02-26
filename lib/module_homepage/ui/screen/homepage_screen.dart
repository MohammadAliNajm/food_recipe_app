import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipe_app/core/constants/Colors.dart';
import 'package:food_recipe_app/core/utils/custom_loading_button.dart';
import 'package:food_recipe_app/module_auth/sign_in/ui/widgets/form_textfield.dart';
import 'package:food_recipe_app/module_products/ui/screen/products_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/di/di_config.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  TextEditingController searchController = TextEditingController();
  final screens = [
    getIt<ProductsScreen>()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: screens[0]
      // ResponsiveRowColumn(
      //     layout: ResponsiveRowColumnType.COLUMN,
      //     children: [
      //       ResponsiveRowColumnItem(
      //           child: Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: Card(
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10)),
      //           child: FormTextField(
      //               controller: searchController,
      //               validator: false,
      //               email: false),
      //         ),
      //       )),
      //       ResponsiveRowColumnItem(
      //           child: CustomLoadingButton(
      //         bgColor: greenColor,
      //         text: 'Sign out',
      //         buttonTab: () {
      //           FirebaseAuth.instance.signOut();
      //         },
      //         textColor: Colors.white,
      //         loading: false,
      //       ))
      //     ]),
    
    );
  }
}
