
import 'package:flutter/material.dart';




import '../../utils/custom_loading_button.dart';
import 'state.dart';








class ErrorState extends States {
  final String errMsg;
  final VoidCallback retry;

  ErrorState({required this.errMsg,required this.retry});

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      //    Lottie.asset(LottieAsset.CONNECTION_ERROR),
         const  SizedBox(
            height: 10,
          ),
          Text(
            errMsg,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),

        const   SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 50,end: 50),
            child: CustomLoadingButton(bgColor: Theme.of(context).errorColor,buttonTab: retry,loading: false,text: 'Retry',textColor: Colors.white,),
          )
        ],
      ),
    );
  }
  
 
}
