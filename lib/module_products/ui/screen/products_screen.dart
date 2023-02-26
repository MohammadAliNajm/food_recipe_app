import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/module_products/state_manager/products_state_manager.dart';
import 'package:injectable/injectable.dart';

import '../../../core/abstracts/states/state.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
        return state.getUI(context);
      }),
    );
  }
}
