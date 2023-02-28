import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
          SizedBox(
            height: 60,
            child: PieChart(
              legendOptions: LegendOptions(showLegends: false),
              chartType: ChartType.ring,
              colorList: [
                Colors.orange,
                Colors.green,
                Colors.purple
              ],
              dataMap: {
              'fat': double.parse(widget.percentageFat),
              'carbs': double.parse(widget.percentageCarbs),
              'proteins': double.parse(widget.percentageProteins)
            }),
          ),
          Column(
            children: [
          Text('${widget.percentageFat}%',style: TextStyle(color: Colors.orange),), 
          Text(widget.amountFat),
          Text(widget.fat)
          ]
          ),
           Column(
            children: [
          Text('${widget.percentageProteins}%',style: TextStyle(color: Colors.purple)), 
          Text(widget.amountProteins),
          Text(widget.proteins)
          ]
          ),
            Column(
            children: [
          Text('${widget.percentageCarbs}%',style: TextStyle(color: Colors.green)), 
          Text(widget.amountCarbs),
          Text(widget.carbs)
          ]
          ),
        ],
      ),
    );
  }
}
