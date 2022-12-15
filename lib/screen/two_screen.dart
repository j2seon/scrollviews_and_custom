import 'package:flutter/material.dart';
import 'package:scrollviews_and_custom/const/colors.dart';

class TwoScreens extends StatelessWidget {
  const TwoScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView(
                  shrinkWrap: true,
              children: rainbowColors
                  .map(
                    (e) => renderContainer(color: e, index: 1),
                  )
                  .toList(),
            )),
            SizedBox(height: 10.0,),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return renderContainer(width: 300.0,height: 300.0, color: rainbowColors[index % rainbowColors.length], index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
    double? width,
  }) {
    print(index);
    return Container(
      width: width ?? 100,
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
