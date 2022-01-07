import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefualtTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  TextInputType? textInputType;
  String lable;
  String hintText;
  IconData icon;
  DefualtTextField({
    required this.controller,
    this.textInputType,
    required this.hintText,
    required this.lable,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        suffixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
      ),
    );
  }
}
