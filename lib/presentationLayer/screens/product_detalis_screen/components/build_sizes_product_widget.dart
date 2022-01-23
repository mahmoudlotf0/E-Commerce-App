import 'package:ecommerceapp/constans/constans.dart';
import 'package:ecommerceapp/constans/size_config.dart';
import 'package:ecommerceapp/presentationLayer/widgets/custom_size_box.dart';
import 'package:ecommerceapp/themes/text_styles.dart';
import 'package:flutter/material.dart';

class BuildSizesProducrWidget extends StatefulWidget {
  const BuildSizesProducrWidget({Key? key}) : super(key: key);

  @override
  _BuildSizesProducrWidgetState createState() =>
      _BuildSizesProducrWidgetState();
}

class _BuildSizesProducrWidgetState extends State<BuildSizesProducrWidget> {
  List<String> sizesText = ['S', 'M', 'L', 'Xl'];
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(70),
        vertical: getProportionateScreenHeight(5),
      ),
      child: customSizeBox(
        width: SizeConfig.screenWidth,
        height: getProportionateScreenWidth(30),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSize = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: getProportionateScreenWidth(40),
                ),
                child: Text(
                  sizesText[index],
                  style: kHeadLineTwo.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: selectedSize == index ? kPrimaryColor : kTextColor,
                  ),
                ),
              ),
            );
          },
          itemCount: sizesText.length,
        ),
      ),
    );
  }
}
