import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_row_column.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      children: [
        ResponsiveRowColumnItem(child:Image.asset('assets/images/food_logo.png')),
        ResponsiveRowColumnItem(child: SizedBox(height: 40,)),
          ResponsiveRowColumnItem(child:Text(text,style: TextStyle(fontWeight: FontWeight.bold),))

      ],
      );
  }
}
