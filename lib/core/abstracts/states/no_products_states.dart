import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'state.dart';

//import 'package:lottie/lottie.dart';





class NoProductsState extends States {
  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Center(
        child:Text('No Products Here!'),
      ),
    );
  }
  
 
}