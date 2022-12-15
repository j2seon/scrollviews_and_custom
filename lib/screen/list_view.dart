import 'package:flutter/material.dart';
import 'package:scrollviews_and_custom/const/colors.dart';
import 'package:scrollviews_and_custom/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ListViewScreen',
      body: RefreshIndicator(
        onRefresh: () async{
          await Future.delayed(Duration(seconds: 3));
        },
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return renderContainer(
              color: Colors.black,
              index: index,
              height: 100
            );
          },
          itemCount: 100,
          itemBuilder: (context, index) {
            return renderContainer(
              color: rainbowColors[index % rainbowColors.length],
              index: index,
            );
          },
        ),
      ),
    );
  }

  Widget renderListViewBuilder() {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
  }

  Widget renderListViewDefault() {
    return ListView(
      children: numbers
          .map(
            (e) => renderContainer(
                index: e, color: rainbowColors[e % rainbowColors.length]),
          )
          .toList(),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
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
