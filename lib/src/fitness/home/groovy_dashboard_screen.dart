import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:io';
import 'package:image/image.dart' as img;

import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/color_palette.dart';

/// Displays detailed information about captured image and color pallete.
class GroovyDashboardScreenView extends StatefulWidget {
  const GroovyDashboardScreenView({Key? key}) : super(key: key);

  static const routeName = '/home_dashboard';

  @override
  State<GroovyDashboardScreenView> createState() =>
      _GroovyDashboardScreenViewState();
}

class _GroovyDashboardScreenViewState extends State<GroovyDashboardScreenView> {
  List? _recognitions;
  List<Color> colors = [];
  List<Color> sortedColors = [];
  List<Color> palette = [];

  Color primary = Colors.blueGrey;
  Color primaryText = Colors.black;
  Color background = Colors.white;

  late Random random;
  Uint8List? imageBytes;

  int noOfPaletteColors = 4;
  final player = AudioPlayer();

  Future predictImagePicker() async {
    final ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {});
    var pickedImage = File(image.path);
    predictImage(pickedImage);
  }

  Future predictImage(File image) async {
    // ignore: unnecessary_null_comparison
    if (image == null) return;

    await recognizeImage(image);

    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();

    loadModel().then((val) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite.close();
    player.dispose();
    super.dispose();
  }

  Future playMusic(String scene) async {
    player.stop().then((value) async {
      if (scene.replaceAll(RegExp(r"\d\s+"), "") == 'forest') {
        await player.play(AssetSource('musics/spring-yellow.mp3'));
      } else if (scene == 'beach') {
        await player.play(AssetSource('musics/serrated-rainy.wav'));
      } else {
        await player.play(AssetSource('musics/rise-orange.mp3'));
      }
    });
  }

  Future loadModel() async {
    Tflite.close();
    try {
    } on PlatformException {
      debugPrint('Failed to load model.');
    }
  }

  Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (pixel.r - mean) / std;
        buffer[pixelIndex++] = (pixel.g - mean) / std;
        buffer[pixelIndex++] = (pixel.b - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  Uint8List imageToByteListUint8(img.Image image, int inputSize) {
    var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
    var buffer = Uint8List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = pixel.r as int;
        buffer[pixelIndex++] = pixel.g as int;
        buffer[pixelIndex++] = pixel.b as int;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  Future recognizeImage(File image) async {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    extractColors(image);
    setState(() {
      if (kDebugMode) {
        print(recognitions);
      }
      _recognitions = recognitions!;
      playMusic(recognitions[0]["label"]);
    });
    int endTime = DateTime.now().millisecondsSinceEpoch;
    if (kDebugMode) {
      print("Inference took ${endTime - startTime}ms");
    }
  }


  Future<void> extractColors(File image) async {
    colors = [];
    sortedColors = [];
    palette = [];
    imageBytes = null;

    setState(() {});

    noOfPaletteColors = 4;

    imageBytes = await image.readAsBytes();

    colors = await compute(extractPixelsColors, imageBytes);
    setState(() {});
    sortedColors = await compute(sortColors, colors);
    setState(() {});
    palette = await compute(
        generatePalette, {keyPalette: colors, keyNoOfItems: noOfPaletteColors});
    primary = palette.last;
    primaryText = palette.first;
    background = palette.first.withOpacity(0.5);
    setState(() {});
  }


 Widget _getPalette() {
    return SizedBox(
      height: 50,
      child: palette.isEmpty
          ? Text(
              'Capture the scene to generate the palette of tones',
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                )
              )
          )
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: palette.length,
              itemBuilder: (BuildContext context, int index) => Container(
                color: palette[index],
                height: 50,
                width: 50,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: const Column(
          children: [
            Text(
              'Groovy',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.info_outline,
                size: 32,
              ),
            ),
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF5F0E7),
        foregroundColor: Colors.black,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
      ),
      backgroundColor: const Color(0xffF5F0E7),
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Center(
              child: Column(
                children: _recognitions != null
                    ? _recognitions!.map((res) {
                        return Text(
                          "The Scene is ${res["label"].replaceAll(RegExp(r"\d\s+"), "")} with ${res["confidence"].toStringAsFixed(3)}% accuracy",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                          textAlign: TextAlign.center,
                        );
                      }).toList()
                    : [const SizedBox.shrink()],
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.5),
              padding: const EdgeInsets.only(top: 6, bottom: 16),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text('Palette of the Scene'),
                  const SizedBox(height: 10),
                  _getPalette()
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: predictImagePicker,
        tooltip: 'Capture Scene',
        child: const Icon(Icons.photo_camera),
      ),
    );
  }
}
