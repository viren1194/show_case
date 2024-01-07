import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcase/controller.dart';
import 'package:showcaseview/showcaseview.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final showCaseController = Get.put(ShowCaseController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showCaseController.showCaseAddPage(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Showcase(
              key: showCaseController.three,
              title: 'Compose Mail',
              description: 'Click here to compose mail',
              targetShapeBorder: const CircleBorder(),
              child: ElevatedButton(onPressed: () {}, child: Text("data"))),
        ],
      ),
    );
  }
}


