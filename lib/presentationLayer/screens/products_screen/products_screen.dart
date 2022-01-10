import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../businessLogicLayer/cubit/shopcubit_cubit.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = 'ProductsScreen';
  final ShopCubit cubit;
  const ProductsScreen({required this.cubit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (_, index) {
              return Text(cubit.products[index].rating['rate'].toString());
            },
            itemCount: cubit.products.length,
          );
        },
      ),
    );
  }
}
