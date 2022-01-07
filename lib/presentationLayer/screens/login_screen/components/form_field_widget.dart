import 'package:ecommerceapp/presentationLayer/widgets/custom_size_box.dart';
import 'package:ecommerceapp/presentationLayer/widgets/default_text_field.dart';
import 'package:flutter/material.dart';

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
            controller: emailController,
            hintText: 'Enter your email',
            lable: 'Email',
            icon: Icons.email_outlined,
            textInputType: TextInputType.emailAddress,
          ),
          customSizeBox(height: 30),
          DefualtTextField(
            controller: passwordController,
            hintText: 'Enter your password',
            lable: 'password',
            icon: Icons.lock_outline,
            textInputType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
