import 'package:flutter/material.dart';

class NutritionFactsWidget extends StatefulWidget {
  const NutritionFactsWidget({Key? key, required this.percentageFat,  required this.fat, required this.amountFat, required this.percentageProteins, required this.amountProteins, required this.proteins, required this.percentageCarbs, required this.amountCarbs, required this.carbs})
      : super(key: key);
  final String percentageFat;
  final String amountFat;
  final String fat;

   final String percentageProteins;
  final String amountProteins;
  final String proteins;
  final String percentageCarbs;
  final String amountCarbs;
  final String carbs;
  @override
  _NutritionFactsWidgetState createState() => _NutritionFactsWidgetState();
}

class _NutritionFactsWidgetState extends State<NutritionFactsWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
          Text('${widget.percentageFat}%'), 
          Text(widget.amountFat),
          Text(widget.fat)
          ]
          ),
           Column(
            children: [
          Text('${widget.percentageProteins}%'), 
          Text(widget.amountProteins),
          Text(widget.proteins)
          ]
          ),
            Column(
            children: [
          Text('${widget.percentageCarbs}%'), 
          Text(widget.amountCarbs),
          Text(widget.carbs)
          ]
          ),
        ],
      ),
    );
  }
}
