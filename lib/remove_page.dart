import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcase/controller.dart';
import 'package:showcaseview/showcaseview.dart';

class RemovePage extends StatefulWidget {
  const RemovePage({super.key});

  @override
  State<RemovePage> createState() => _RemovePageState();
}

class _RemovePageState extends State<RemovePage> {
  final showCaseController = Get.put(ShowCaseController());

   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showCaseController.showCaseRemovePage(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Showcase(
            key: showCaseController.four,
            title: 'Compose Mail',
            description: 'Click here to compose mail',
            targetShapeBorder: const CircleBorder(),
            child: ElevatedButton(onPressed: () {}, child: Text("Hello"))),
      ]),
    );
  }
}
