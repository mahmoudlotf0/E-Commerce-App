import 'package:auto_size_text/auto_size_text.dart';
import '../../../../constans/constans.dart';
import '../../../../constans/size_config.dart';
import '../../../../themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        horizontal: 40.h,
      ),
      child: SizedBox(
        width: SizeConfig.screenWidth,
        height: 30.h,
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
                  right: 50.w,
                ),
                child: AutoSizeText(
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
