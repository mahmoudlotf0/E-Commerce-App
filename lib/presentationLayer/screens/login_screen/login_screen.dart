import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/presentationLayer/screens/login_screen/components/form_field_widget.dart';
import 'package:ecommerceapp/presentationLayer/screens/login_screen/components/head_widget.dart';
import 'package:ecommerceapp/presentationLayer/widgets/custom_size_box.dart';
import 'package:ecommerceapp/presentationLayer/widgets/default_text_field.dart';
import 'package:ecommerceapp/presentationLayer/widgets/defualt_button.dart';
import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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