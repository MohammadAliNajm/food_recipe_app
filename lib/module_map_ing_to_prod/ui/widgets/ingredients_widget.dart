import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/constants/Colors.dart';

import '../screens/map_ingredients_screen.dart';

List<String> ingredientsToSend = [];

class IngredientsWidget extends StatefulWidget {
  const IngredientsWidget({Key? key, required this.ingredient, required this.state})
      : super(key: key);
 final  MapIngredientsScreenState state;
  final String ingredient;

  @override
  State<IngredientsWidget> createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: greenColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text(
              widget.ingredient,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
            )),
            InkWell(
                onTap: () {
                  setState(() {
                    ingredientsToSend.remove(widget.ingredient);
                  });
                  widget.state.setState(() {
                    
                  });
                  print(ingredientsToSend);
                },
                child: Icon(
                  Icons.cancel,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
