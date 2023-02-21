import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


@injectable
abstract class RoutModule {

  static Map<String, WidgetBuilder> routesMap = {};

  
}
