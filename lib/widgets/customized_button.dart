import 'package:flutter/material.dart';

class Customized_button extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback? onPressed;

  const Customized_button({super.key, this.buttonText, this.buttonColor, this.textColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 55,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(width: 1, color: Color.fromRGBO(14, 70, 163, 5),),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text(
            buttonText!,
            style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w500),)),
        ),
      ),
    );
  }
}
