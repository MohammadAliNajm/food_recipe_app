import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipe_app/core/constants/Colors.dart';
import 'package:food_recipe_app/core/utils/custom_loading_button.dart';
import 'package:food_recipe_app/module_auth/sign_in/ui/widgets/form_textfield.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/ui/screens/map_ingredients_screen.dart';
import 'package:food_recipe_app/module_map_ing_to_prod/ui/widgets/ingredients_widget.dart';
import 'package:food_recipe_app/module_products/ui/screen/products_screen.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/di/di_config.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  
  TextEditingController searchController = TextEditingController();
  final screens = [getIt<ProductsScreen>(), getIt<MapIngredientsScreen>()];
  int selectedindex = 0;
  
  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        bottomNavigationBar: isKeyboardOpen? null : MoltenBottomNavigationBar(
          onTabChange: (index) {
            setState(() {
              selectedindex = index;
              ingredientsToSend.clear();
            });
          },
          selectedIndex: selectedindex,
          tabs: [
            MoltenTab(icon: Icon(Icons.local_grocery_store)),
            MoltenTab(icon: Icon(Icons.egg)),
          ],
        ),
        body: IndexedStack(
          index: selectedindex,
          children: screens)
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
