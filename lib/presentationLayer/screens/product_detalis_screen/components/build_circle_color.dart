import '../../../../constans/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
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
              width: 30.w,
              height: 20.h,
              margin: EdgeInsets.symmetric(
                horizontal: 7.w,
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
