import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/constants/Colors.dart';

List<String> ingredientsToSend = [];

class IngredientsWidget extends StatefulWidget {
  const IngredientsWidget({Key? key, required this.ingredient})
      : super(key: key);

  final String ingredient;

  @override
  State<IngredientsWidget> createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
         isPressed ?  ingredientsToSend.add(widget.ingredient): ingredientsToSend.remove(widget.ingredient);
        });
        print(ingredientsToSend);
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            color: isPressed ? greenColor : Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: greenColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.ingredient,style: TextStyle(color: isPressed ? Colors.white : Colors.black),),
              Icon(isPressed ? Icons.check : Icons.add,color: isPressed ? Colors.white : Colors.black ,)
            ],
          ),
        ),
      ),
    );
  }
}
