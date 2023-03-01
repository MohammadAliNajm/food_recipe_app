import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipe_app/core/constants/Colors.dart';
import 'package:responsive_framework/responsive_row_column.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      children: [
        ResponsiveRowColumnItem(child:Column(
          children: [
            SvgPicture.asset('assets/images/kiwi.svg', height: MediaQuery.of(context).size.height * 0.2,),
            Text('Kiwi',style: TextStyle(color: greenColor,fontSize: 24,fontWeight: FontWeight.bold),)
          ],
        )),
        ResponsiveRowColumnItem(child: SizedBox(height: 30,)),
          ResponsiveRowColumnItem(child:Text(text,style: TextStyle(fontWeight: FontWeight.bold),))

      ],
      );
  }
}
