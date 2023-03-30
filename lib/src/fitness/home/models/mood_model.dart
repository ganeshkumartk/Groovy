import 'package:flutter/material.dart';

class MoodCard {
  final int index;
  final String title;
  final String shortTitle;
  final String bigCardImage;
  final String miniCardImage;
  final Color cardColor;
  final Color bigBackgroundColor;

  MoodCard({
    required this.index,
    required this.title,
    required this.shortTitle,
    required this.bigCardImage,
    required this.miniCardImage,
    required this.cardColor,
    required this.bigBackgroundColor,
  });
}
