import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key,required this.buttonfun,required this.buttontext});
  final String buttontext;
  VoidCallback buttonfun;

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(onPressed: buttonfun, child: Text(buttontext),color: Colors.yellow,);
  }
}