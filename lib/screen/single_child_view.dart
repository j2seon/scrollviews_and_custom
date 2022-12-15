import 'package:flutter/material.dart';
import 'package:scrollviews_and_custom/const/colors.dart';
import 'package:scrollviews_and_custom/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  SingleChildScrollViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollView',
      body: SingleChildScrollView(
        child: Column(
          children: numbers
              .map(
                (e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length],
              index: e
            ),
          )
              .toList(),
        ),
      ),
    );
  }

  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children: rainbowColors
            .map(
              (e) => renderContainer(color: e),
            )
            .toList(),
      ),
    );
  }

  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(), //강제로 스크롤 시키는 방법
      child: Column(
        children: [renderContainer(color: Colors.black)],
      ),
    );
  }

  Widget renderClip() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(), //강제로 스크롤 시키는 방법
      clipBehavior: Clip.none, //안의 내용물 크기 변환없도록
      child: Column(
        children: [renderContainer(color: Colors.black)],
      ),
    );
  }

  Widget renderPhysics() {
    return SingleChildScrollView(
      // NeverScrollableScrollPhysics() 스크롤 안됨
      // BouncingScrollPhysics(), ios 스타일
      // ClampingScrollPhysics 안드로이드 스타일
      physics: ClampingScrollPhysics(),
      child: Column(
        children: rainbowColors
            .map(
              (e) => renderContainer(color: e),
            )
            .toList(),
      ),
    );
  }

  Widget renderContainer({required Color color, int? index}) {
    if(index != null){
      print(index);
    }
    return Container(height: 300, color: color);
  }
}
