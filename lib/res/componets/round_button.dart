import 'package:flutter/material.dart';
import 'package:mvvm/res/Colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const RoundButton({super.key,required this.title, this.loading= false,required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(

          color: appColor.ButtonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(title,style: TextStyle(color: Colors.white),)),

      ),
    );
  }
}
