// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:showcaseview/showcaseview.dart';

// class ShowCaseController extends GetxController {
//   final GlobalKey one = GlobalKey();
//   final GlobalKey two = GlobalKey();
//   final GlobalKey three = GlobalKey();
//   final GlobalKey four = GlobalKey();

//   void showCaseForKeys(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool hasSeen = prefs.getBool('hasSeen') ?? false;

//     if (!hasSeen) {
//       ShowCaseWidget.of(context).startShowCase([one, two]);
//       prefs.setBool('hasSeen', true);
//     }
//   }

//     void showCaseAddPage(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool hasSeen = prefs.getBool('addPage') ?? false;

//     if (!hasSeen) {
//       ShowCaseWidget.of(context).startShowCase([three]);
//       prefs.setBool('addPage', true);
//     }
//   }

//   void showCaseRemovePage(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool hasSeen = prefs.getBool('removePage') ?? false;

//     if (!hasSeen) {
//       ShowCaseWidget.of(context).startShowCase([four]);
//       prefs.setBool('removePage', true);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowCaseController extends GetxController {
  final GlobalKey one = GlobalKey();
  final GlobalKey two = GlobalKey();
  final GlobalKey three = GlobalKey();
  final GlobalKey four = GlobalKey();
  final GlobalKey five = GlobalKey();

  Map<String, GlobalKey> keys = {
    'one': GlobalKey(),
    'two': GlobalKey(),
    'three': GlobalKey(),
    'four': GlobalKey(),
    'five': GlobalKey(),
  };

  void _showCase(
      BuildContext context, List<GlobalKey> keys, String showcaseKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeen = prefs.getBool(showcaseKey) ?? false;

    if (!hasSeen) {
      ShowCaseWidget.of(context).startShowCase(keys);
      prefs.setBool(showcaseKey, true);
    }
  }

  void showCaseHomePage(BuildContext context) {
    _showCase(context, [one, two], 'homePage');
  }

  void showCaseAddPage(BuildContext context) {
    _showCase(context, [three], 'addPage');
  }

  void showCaseRemovePage(BuildContext context) {
    _showCase(context, [four, five], 'removePage');
  }
    List<String> unit = ['cm', 'gm', 'ltr', 'mtr'];

  RxString selectedValue = ''.obs;

  void updateValue(String value) {
    selectedValue = value.obs;
    // update();
  }

    Future<void> loadSelectedValue() async {
    final prefs = await SharedPreferences.getInstance();
    // setState(() {
    selectedValue.value = prefs.getString('selectedValue') ?? '';
    // });
  }

    Future<void> saveSelectedValue(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedValue', value);
  }
}
