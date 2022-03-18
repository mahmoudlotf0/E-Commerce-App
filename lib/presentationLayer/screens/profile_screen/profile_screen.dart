import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerceapp/presentationLayer/screens/profile_screen/components/profile_content.dart';

import '../../../themes/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            'Profile',
            style: kHeadLineOneWithPrimaryColor,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: Container(),
        ),
        body: ProfileContent(),
      ),
    );
  }
}
