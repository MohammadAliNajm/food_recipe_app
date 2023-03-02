import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'state.dart';

//import 'package:lottie/lottie.dart';





class NoProductsState extends States {
  @override
  Widget getUI(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
          child:Text('No Products Here!'),
        ),]
      ),
    );
  }
  
 
}