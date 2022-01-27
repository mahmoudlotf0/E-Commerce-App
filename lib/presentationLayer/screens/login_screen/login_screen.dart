import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../themes/text_styles.dart';
import '../../widgets/defaut_text_button.dart';
import '../../widgets/defualt_button.dart';
import '../products_screen/products_screen.dart';
import '../register_Screen/register_screen.dart';
import 'components/form_field_widget.dart';
import 'components/head_widget.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50.r,
            horizontal: 20.r,
          ),
          child: Column(
            children: [
              const HeadWidget(),
              SizedBox(height: 90.h),
              const FormFieldWidget(),
              SizedBox(height: 15.h),
              DefualtButton(
                title: 'Continue',
                height: 60.h,
                onTap: () {
                  Navigator.of(context).pushNamed(ProductsScreen.routeName);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Don\'t have an account?',
                    style: kHeadLineThree,
                    maxLines: 1,
                  ),
                  DefaultTextButton(
                    lable: 'Sign Up',
                    onTap: () {
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
