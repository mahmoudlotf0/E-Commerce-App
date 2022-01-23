import 'package:ecommerceapp/constans/size_config.dart';
import 'package:flutter/material.dart';

class BuildCircleColor extends StatefulWidget {
  const BuildCircleColor({Key? key}) : super(key: key);

  @override
  _BuildCircleColorState createState() => _BuildCircleColorState();
}

class _BuildCircleColorState extends State<BuildCircleColor> {
  List<Color> colors = [
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.white,
    Colors.yellow,
    Colors.blue,
    Colors.grey,
  ];
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(60),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = index;
              });
            },
            child: Container(
              width: getProportionateScreenHeight(30),
              height: getProportionateScreenHeight(30),
              margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(8),
              ),
              decoration: BoxDecoration(
                color: colors[index],
                shape: BoxShape.circle,
                border: selectedColor == index
                    ? Border.all(
                        color: index == 3 ? Colors.black : Colors.white,
                        width: 3,
                      )
                    : Border.all(
                        color: Colors.white.withOpacity(0),
                      ),
              ),
            ),
          );
        },
        itemCount: colors.length,
      ),
    );
  }
}
