import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/module_product_info/state_manager/product_info_state_manager.dart';
import 'package:injectable/injectable.dart';

import '../../../core/abstracts/states/state.dart';

@injectable
class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen(this.cubit);
  final ProductsInfoCubit cubit;
  @override
  ProductInfoScreenState createState() => ProductInfoScreenState();
}

class ProductInfoScreenState extends State<ProductInfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool flag = true;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is int && flag) {
      var progId = args;
      setState(() {
        flag = false;
      });
      widget.cubit.getProductInfo(
        this,
        progId,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title:const  Text(
          'Product Info',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon:const  Icon(Icons.arrow_back_rounded,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<ProductsInfoCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return state.getUI(context);
          }),
    );
  }
}
