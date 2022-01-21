import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                'can\'t connect .. check internet',
                textAlign: TextAlign.center,
                style: kHeadLineOneWithPrimaryColor,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/icons/offline.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
