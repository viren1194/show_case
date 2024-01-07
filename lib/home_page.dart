import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showCaseController.showCaseHomePage(context),
    );
  }

  Future<void> _playAudioFromAsset() async {
    const assetPath = "assets/music/Notification.mp3";
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio(assetPath),
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
              disposeOnTap: true,
              onTargetClick: () => print('profile'),
              textColor: Colors.white,
              targetShapeBorder: const CircleBorder(),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const RemovePage());
                  print('object');
                },
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
            SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
      floatingActionButton: Showcase(
        key: showCaseController.two,
        description: 'Click here to compose mail',
        disposeOnTap: true,
        onTargetClick: () => print('Compose Mail'),
        targetShapeBorder: const CircleBorder(),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            // Get.to(AddPage());
            _playAudioFromAsset();
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}


