import 'package:flutter/material.dart';

abstract class HomeStates {
  Widget getUI(BuildContext context);
  Widget buildTabBar(BuildContext context,double height,Color color);
}
