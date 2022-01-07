import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefualtTextField extends StatelessWidget {
  String? Function(String? val)? validate;
  bool isPassword;
  Function()? suffixPressed;
  String? Function(String? val)? onSaved;
  TextEditingController controller = TextEditingController();
  TextInputType? textInputType;
  String lable;
  String hintText;
  IconData prefixIcon;
  IconData? suffixIcon;

  DefualtTextField({
    this.isPassword = false,
    this.suffixIcon,
    this.suffixPressed,
    this.validate,
    this.onSaved,
    required this.controller,
    this.textInputType,
    required this.hintText,
    required this.lable,
    required this.prefixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      onSaved: onSaved,
      validator: validate,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        hintText: hintText,
        labelText: lable,
        labelStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.only(
          left: 40.0,
          top: 20.0,
          bottom: 20.0,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
            color: Colors.grey,
          ),
          onPressed: suffixPressed,
        ),
      ),
    );
  }
}
