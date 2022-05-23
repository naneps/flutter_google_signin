import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String? hintText;
  String? labelText;
  Widget? suffixIcon;
  TextEditingController? controller;
  IconData? icon;
  bool? showPass;
  TextInputType? keyboardType = TextInputType.text;
  MyTextField(
      {this.controller,
      this.suffixIcon,
      this.icon,
      this.hintText,
      this.labelText,
      this.keyboardType,
      this.showPass,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      // create form login
      obscureText: showPass ?? false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        focusColor: Color.fromARGB(255, 4, 195, 125),
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(
          // borderSide: BorderSide(color: Color.fromARGB(255, 156, 0, 167)),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
