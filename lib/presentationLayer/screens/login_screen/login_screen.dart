import 'package:flutter/material.dart';

import '../../../constans/size_config.dart';
import 'components/form_field_widget.dart';
import 'components/head_widget.dart';
import '../../widgets/custom_size_box.dart';
import '../../widgets/defualt_button.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(50),
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              children: [
                const HeadWidget(),
                customSizeBox(height: 100),
                const FormFieldWidget(),
                customSizeBox(height: 15),
                DefualtButton(
                  title: 'Continue',
                  height: 60,
                  onTap: () {
                    print('object');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*

 */