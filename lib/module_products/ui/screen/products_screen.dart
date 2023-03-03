import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipe_app/core/constants/Colors.dart';
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
    widget.cubit.getProducts(this, ' ');
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async{
                        widget.cubit.getProducts(this, ' ');
                      },
            child: SingleChildScrollView(
              child: Column(
                  
                  children: [
                    SizedBox(
                      height: 175,
                      child:  Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Container(
                          color: greenColor,
                          child: SvgPicture.asset('assets/images/foodPattern.svg',fit: BoxFit.fill,color: Colors.green.shade400, )),
                        Positioned(
                      bottom: 100,
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                                              Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Search Groceries',
                            style: TextStyle(fontSize: 20,color: Colors.white),
                          ),
                                              ),
                          ],
                                              ),
                        ), 
                        
                          Positioned(
                                     
                            child: Card(
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                              child: FormTextField(
                            icon: Icon(Icons.search),
                              hasOnChanged: (val) {
                                widget.cubit.getProducts(this, val);
                              },
                              controller: searchController,
                              validator: false,
                              email: false),
                            ),
                          ),
                                    ] 
                    ),
                 ),
                   
                    BlocBuilder<ProductsCubit, States>(
                        bloc: widget.cubit,
                        builder: (context, state) {
                          return state.getUI(context);
                        }),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
