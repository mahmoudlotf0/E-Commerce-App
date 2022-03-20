import 'package:ecommerceapp/presentationLayer/screens/profile_screen/components/profile_image.dart';
import 'package:ecommerceapp/presentationLayer/screens/profile_screen/components/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ProfileImage(),
        SizedBox(height: 20.h),
        const ProfileMenuItem(
          svgPicture: 'assets/icons/User Icon.svg',
          title: 'My Account',
        ),
        const ProfileMenuItem(
          svgPicture: 'assets/icons/Bell.svg',
          title: 'Notifications',
        ),
        const ProfileMenuItem(
          svgPicture: 'assets/icons/Settings.svg',
          title: 'Settings',
        ),
        const ProfileMenuItem(
          svgPicture: 'assets/icons/Question mark.svg',
          title: 'Help Center',
        ),
        const ProfileMenuItem(
          svgPicture: 'assets/icons/Log out.svg',
          title: 'Log Out',
        ),
      ],
    );
  }
}
