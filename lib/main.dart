import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcase/contact_list.dart';
import 'package:showcaseview/showcaseview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      blurValue: 1,
      builder: Builder(
        builder: (context) => GetMaterialApp(
            title: 'Flutter ShowCase',
            theme: ThemeData(
              primaryColor: const Color(0xffEE5366),
            ),
            debugShowCheckedModeBanner: false,
            home: ConatctPage()),
      ),
    );
  }
}

