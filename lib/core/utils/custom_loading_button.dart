import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({super.key, 
    required this.bgColor,
    required this.text,
    required this.textColor,
    required this.loading,
    required this.buttonTab,
  });

  final Color bgColor;
  final Color textColor;
  final String text;
  final bool loading;
  final VoidCallback buttonTab;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Material(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: (){
                buttonTab();
              },
              child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox(
                    height: 35,
                    child: loading
                        ?const  Center(
                        child:  LoadingIndicator(
                          indicatorType:
                          Indicator.ballBeat,
                          colors: [Colors.white],
                        ))
                        : Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: textColor,
                            fontSize: 18),
                      ),
                    ),
                  )),
            ),
          ),
        )
      ],
    );
  }
}