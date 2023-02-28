import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipe_app/module_products/ui/screen/products_screen.dart';
import 'package:food_recipe_app/module_products/ui/widgets/product_card.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/abstracts/states/state.dart';
import '../../../core/constants/Colors.dart';
import '../../../core/utils/custom_loading_button.dart';
import '../../../module_auth/sign_in/ui/widgets/form_textfield.dart';
import '../../response/products_response.dart';

class ProductState extends States {
  final ProductResponse response;
  final ProductsScreenState state;

  ProductState(this.response, this.state);
  @override
  Widget getUI(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return SafeArea(
      child: SingleChildScrollView(
        child: ResponsiveRowColumn(
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
          
              ResponsiveRowColumnItem(
                  child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: response.products.length,
                itemBuilder: (context, index) {
                  return Hero(
                    tag:response.products[index].id,
                    child: ProductCard(
                      imageUrl: response.products[index].image,
                      productTitle: response.products[index].title,
                      onTap: () {
                        Navigator.pushNamed(context, '/productInfo',arguments: response.products[index].id);
                      },
                    ),
                  );
                },
              )),
              ResponsiveRowColumnItem(
                  child: CustomLoadingButton(
                bgColor: greenColor,
                text: 'Sign out',
                buttonTab: () {
                  FirebaseAuth.instance.signOut();
                },
                textColor: Colors.white,
                loading: false,
              )),
            ]),
      ),
    );
  }
}
