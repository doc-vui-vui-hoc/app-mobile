// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.width >= 550;
}

const double size_32 = 32.0;
const double APPBAR_HEIGHT = 70.0;
const double APPBAR_EXPANDED_HEIGHT = 150.0;
const double APPBAR_MAX_HEIGHT = 160.0;

const double designScreenHeight = 812;
const double designScreenWidth = 375;

class Dimension {
  double width;
  double height;

  Dimension(this.width, this.height);
}

Dimension dimension(BuildContext context) {
  final double w = MediaQuery.of(context).size.width;
  final double h = MediaQuery.of(context).size.height;

  return Dimension(w, h);
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double height(BuildContext context, double size) {
  final double ratio = getHeight(context) / designScreenHeight;
  return (size * ratio).ceil().toDouble();
}

double width(BuildContext context, double size) {
  final double ratio = getWidth(context) / designScreenWidth;
  return (size * ratio).ceil().toDouble();
}
