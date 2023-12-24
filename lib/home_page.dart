import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcase/add_page.dart';
import 'package:showcase/controller.dart';
import 'package:showcase/remove_page.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final showCaseController = Get.put(ShowCaseController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showCaseController.showCaseHomePage(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Showcase(
              targetPadding: const EdgeInsets.all(5),
              key: showCaseController.one,
              title: 'Profile',
              description:
                  "Tap to see profile which contains user's name, profile picture, mobile number and country",
              tooltipBackgroundColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              targetShapeBorder: const CircleBorder(),
              child: GestureDetector(
                onTap: () => Get.to(RemovePage()),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Icon(Icons.remove),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Showcase(
        key: showCaseController.two,
        title: 'Compose Mail',
        description: 'Click here to compose mail',
        targetShapeBorder: const CircleBorder(),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Get.to(AddPage());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
