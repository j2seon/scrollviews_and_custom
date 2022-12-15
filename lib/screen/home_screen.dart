import 'package:flutter/material.dart';
import 'package:scrollviews_and_custom/layout/main_layout.dart';
import 'package:scrollviews_and_custom/screen/custom_scoller_view.dart';
import 'package:scrollviews_and_custom/screen/scollerbar_screen.dart';
import 'package:scrollviews_and_custom/screen/two_screen.dart';
import 'package:scrollviews_and_custom/screen/gridviewscreen.dart';
import 'package:scrollviews_and_custom/screen/list_view.dart';
import 'package:scrollviews_and_custom/screen/reorderable_list_view.dart';
import 'package:scrollviews_and_custom/screen/single_child_view.dart';

class ScreenModel {
  final WidgetBuilder builder;
  final String name;

  ScreenModel({required this.builder, required this.name});
}

class HomeScreen extends StatelessWidget {
  final screen = [
    ScreenModel(
      builder: (_) => SingleChildScrollViewScreen(),
      name: 'SingleChildScrollViewScreen',
    ),
    ScreenModel(
      builder: (_) => ListViewScreen(),
      name: 'ListViewScreen',
    ),
    ScreenModel(
      builder: (_) => GridViewScreen(),
      name: 'GridViewScreen',
    ),
    ScreenModel(
      builder: (_) => ReorderableListViewScreen(),
      name: 'ReorderableListViewScreen',
    ),
    ScreenModel(
      builder: (_) => TwoScreens(),
      name: 'TwoScreens',
    ),
    ScreenModel(
      builder: (_) => CustomScrollViewScreen(),
      name: 'CustomScrollViewScreen',
    ),
    ScreenModel(
      builder: (_) => ScrollbarScreen(),
      name: 'ScrollbarScreen',
    ),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'home',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: screen
              .map(
                (e) => ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: e.builder),
                    );
                  },
                  child: Text(e.name),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
