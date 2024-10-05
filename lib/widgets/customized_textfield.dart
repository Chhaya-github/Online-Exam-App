import 'package:flutter/material.dart';

class Customized_textfield extends StatelessWidget {
  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;
  const Customized_textfield({super.key, required this.myController, this.hintText, this.isPassword});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        keyboardType: isPassword! ? TextInputType.visiblePassword : TextInputType.emailAddress,
        autocorrect: isPassword! ? false : true,
        enableSuggestions: isPassword! ? false : true,
        obscureText: isPassword ?? true,
        controller: myController,
        decoration: InputDecoration(
          suffixIcon: isPassword!
              ? IconButton(
            icon: const Icon(Icons.remove_red_eye, color: Colors.grey,),
            onPressed: (){}
          ): null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(10)
          ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 1),
                borderRadius: BorderRadius.circular(10)
            ),
            fillColor: Colors.grey.shade300,
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black87, width: 4),
              borderRadius: BorderRadius.circular(10),
            )
        ),
      ),
    );
  }
}
