
import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/constants/Colors.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'state.dart';

//import 'package:lottie/lottie.dart';





class LoadingState extends States {
  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Center(
        child: LoadingAnimationWidget.threeRotatingDots(
            color: greenColor, size: 30),
      ),
    );
  }
  
 
}
