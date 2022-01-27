import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0.r),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0.r),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0.w,
          ),
        ),
        hintText: hintText,
        labelText: lable,
        labelStyle: const TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.only(
          left: 40.0.r,
          top: 20.0.r,
          bottom: 20.0.r,
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
