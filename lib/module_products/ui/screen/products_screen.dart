import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/module_products/state_manager/products_state_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/abstracts/states/state.dart';
import '../../../module_auth/sign_in/ui/widgets/form_textfield.dart';

@injectable
class ProductsScreen extends StatefulWidget {
  const ProductsScreen(this.cubit);
  final ProductsCubit cubit;
  @override
  State<ProductsScreen> createState() => ProductsScreenState();
}

class ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getProducts(this, 'greek');
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveRowColumn(
          layout: ResponsiveRowColumnType.COLUMN,
          children: [
            ResponsiveRowColumnItem(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Search Products',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )),
            ResponsiveRowColumnItem(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: FormTextField(
                      hasOnChanged: (val) {
                        widget.cubit.getProducts(this, val);
                      },
                      controller: searchController,
                      validator: false,
                      email: false),
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              child: BlocBuilder<ProductsCubit, States>(
                  bloc: widget.cubit,
                  builder: (context, state) {
                    return state.getUI(context);
                  }),
            ),
          ]),
    );
  }
}
