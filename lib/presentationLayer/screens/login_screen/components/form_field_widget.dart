import 'package:flutter/material.dart';

import '../../../widgets/custom_size_box.dart';
import '../../../widgets/default_text_field.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          DefualtTextField(
            validate: (String? value) {
              if (value!.isEmpty) {
                return 'Please enter your email address';
              }
            },
            controller: emailController,
            hintText: 'Enter your email',
            lable: 'Email',
            prefixIcon: Icons.email_outlined,
            textInputType: TextInputType.emailAddress,
          ),
          customSizeBox(height: 30),
          DefualtTextField(
            validate: (String? value) {
              if (value!.isEmpty || value.length < 8) {
                return 'Your password is too short';
              }
            },
            controller: passwordController,
            suffixIcon: Icons.visibility_outlined,
            suffixPressed: () {},
            hintText: 'Enter your password',
            isPassword: true,
            lable: 'Password',
            prefixIcon: Icons.lock_outline,
            textInputType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }
}
