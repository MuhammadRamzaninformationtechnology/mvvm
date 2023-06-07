import 'package:another_flushbar/flushbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar_route.dart';
class Utils{

  static void fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode nextFocus
      ){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }




 static toastMassage(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 90,
    );


  }

  static void flushBarErrorMessage(String message,BuildContext context){
   
showFlushbar(
    context: context,
    flushbar: Flushbar(
      message: message,
     forwardAnimationCurve: Curves.decelerate,
     positionOffset: 20,
     flushbarPosition: FlushbarPosition.TOP,
     padding: EdgeInsets.all(5),
     margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      backgroundColor: Colors.cyanAccent,
      icon: Icon(Icons.error ,size: 20,),
      borderRadius: BorderRadius.circular(20),
      duration: Duration(seconds: 3),
      reverseAnimationCurve: Curves.easeInOut,
      )..show(context),

);
 // showFlushbar(contaxt:context,flushbar:Flushbar( message:message)
// );
  }
  static snackBar(String message, BuildContext context){
   return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         backgroundColor: Colors.green,
           content: Text('my name is muhammad Ramzan')
       )
   );

  }
}

