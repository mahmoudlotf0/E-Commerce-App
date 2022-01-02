import '../../constans/constans.dart';
import '../../constans/size_config.dart';
import 'package:flutter/material.dart';

class DefualtButton extends StatelessWidget {
  const DefualtButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(50),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            primary: kPrimaryColor,
          ),
          child: const Text('Continue'),
          onPressed: () {},
        ),
      ),
    );
  }
}
