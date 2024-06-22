import 'dart:ui';

import 'package:flutter/material.dart';

class ListItemModell {
  final String image;
  final String text;
  final String id;
  final Color textColor;
  ListItemModell({required this.image, required this.text,required this.id,this.textColor = Colors.white});
}

