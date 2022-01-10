import '../../../businessLogicLayer/cubit/shopcubit_cubit.dart';
import '../../../constans/size_config.dart';
import 'components/on_boarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: const OnBoardingBody(),
    );
  }
}
