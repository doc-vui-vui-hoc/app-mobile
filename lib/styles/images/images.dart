// ignore_for_file: constant_identifier_names

import 'package:ar_book/styles/images/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Images {
  static const String url_image = 'assets/images/';
  static const String url_icons = 'assets/icons/';

  static const String imageDefault = url_image + 'image_default.png';

  //icon
  static const String nav_home = url_icons + 'nav_home.svg';
  static const String nav_home_fill = url_icons + 'nav_home_fill.svg';
  static const String nav_book = url_icons + 'nav_book.svg';
  static const String nav_book_fill = url_icons + 'nav_book_fill.svg';
  static const String nav_bookmark_blank = url_icons + 'nav_bookmark_blank.svg';
  static const String nav_bookmark = url_icons + 'nav_bookmark.svg';
  static const String nav_user = url_icons + 'nav_user.svg';
  static const String nav_user_fill = url_icons + 'nav_user_fill.svg';
  static const String ic_search = url_icons + 'search.svg';
  static const String ic_filter = url_icons + 'filter.svg';
  static const String ic_back = url_icons + 'back.svg';
  static const String iconNext = url_icons + 'icon_next.svg';
  static const String iconBackward = url_icons + 'icon_backward.svg';
  static const String ic_pause = url_icons + 'pause.svg';
  static const String ic_play = url_icons + 'play.svg';
  static const String ic_book = url_icons + 'book.svg';
  static const String ic_download = url_icons + 'download.svg';
  static const String icon_menu = url_icons + 'icon_menu.svg';

  //image
  static const String img_logo = url_image + 'goc.png';

  static Widget imageAssets(
    String path, {
    Color? color,
    double? width,
    double? height,
    bool cacheColorFilter = false,
    BoxFit fit = BoxFit.contain,
  }) {
    if (path.contains("http")) {
      if (path.contains('jpg') ||
          path.contains('png') ||
          path.contains('gif') ||
          path.contains('jpeg') ||
          path.contains('webp')) {
        return CustomImage(
          imageUrl: path,
          width: width,
          height: height,
          fit: fit,
        );
      }
      return SvgPicture.network(
        path,
        cacheColorFilter: cacheColorFilter,
        color: color,
        width: width,
        height: height,
        fit: fit,
      );
    } else if (path.contains('jpg') || path.contains('png')) {
      return CustomImage(
          imageUrl: path, width: width, height: height, fit: fit);
    }
    return SvgPicture.asset(
      path,
      cacheColorFilter: cacheColorFilter,
      color: color,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
