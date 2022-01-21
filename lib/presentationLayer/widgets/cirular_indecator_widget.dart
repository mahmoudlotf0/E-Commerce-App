import 'package:ecommerceapp/constans/constans.dart';
import 'package:flutter/material.dart';

class CircularIndecatorWidget extends StatelessWidget {
  const CircularIndecatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
