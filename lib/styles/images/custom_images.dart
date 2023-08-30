// ignore_for_file: non_constant_identifier_names
import 'dart:io';
import 'dart:typed_data';
import 'package:ar_book/styles/images/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget CustomImage({
  String? imageUrl,
  BoxFit? fit,
  Widget? imageDefault,
  File? file,
  Uint8List? data,
  double? width,
  double? height,
  double? radius,
  Color? color,
  bool isShowLoading = true,
  bool viewImage = false,
  String imageCropMode = 'crop',
}) {
  if (imageUrl != null && imageUrl.trim().isNotEmpty) {
    if (imageUrl.contains("http")) {
      switch (getMediaType(imageUrl)) {
        default:
          return CachedNetworkImage(
              imageUrl: imageUrl,
              width: width,
              height: height,
              imageBuilder: (width != null && height != null)
                  ? (BuildContext context, ImageProvider _imageUrl) {
                      return Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius ?? 0),
                          image: DecorationImage(
                              image: imageUrl.contains('.gif')
                                  ? NetworkImage(imageUrl)
                                  : _imageUrl,
                              fit: fit ?? BoxFit.contain),
                        ),
                      );
                    }
                  : null,
              placeholder: (_, __) => isShowLoading
                  ? SpinKitThreeBounce(
                      color: Colors.grey[350],
                      size: 24.0,
                    )
                  : const SizedBox(),
              fit: fit,
              errorWidget: (_, __, dynamic error) {
                return imageDefault ??
                    _buildImageDefault(fit, width, height, radius);
              });
      }
    } else if (imageUrl.contains('data')) {
      return Image.file(
        File(imageUrl),
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      return Image.asset(
        imageUrl,
        fit: fit,
        width: width,
        height: height,
        color: color,
      );
    }
  } else if (file != null) {
    return Image.file(
      file,
      fit: fit,
      width: width,
      height: height,
    );
  } else if (data != null) {
    return Image.memory(
      data,
      fit: fit,
      width: width,
      height: height,
    );
  }

  return imageDefault ?? _buildImageDefault(fit, width, height, radius);
}

Widget _buildImageDefault(
    BoxFit? fit, double? width, double? height, double? radius) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 0),
      image: DecorationImage(
        image: const AssetImage(Images.imageDefault),
        fit: fit ?? BoxFit.contain,
      ),
    ),
  );
}

MediaType getMediaType(String path) {
  if (getVideo(path)) {
    return MediaType.mp4;
  } else if (path.contains('http')) {
    if (path.contains('sticker')) {
      return MediaType.sticker;
    } else if (path.contains('svg')) {
      return MediaType.svgNetwork;
    } else if (path.contains('jpg') ||
        path.contains('jpeg') ||
        path.contains('JPG') ||
        path.contains('png') ||
        path.contains('.gif')) {
      return MediaType.jpgNetwork;
    } else if (path.contains('mp4')) {
      return MediaType.mp4;
    }
    return MediaType.file;
  } else if (path.contains("data")) {
    return MediaType.file;
  } else if (path.contains('svg')) {
    return MediaType.svgLocal;
  } else if (path.contains('png') ||
      path.contains('jpg') ||
      path.contains('JPG') ||
      path.contains('jpeg')) {
    return MediaType.pngLocal;
  }
  return MediaType.waiting;
}

bool getVideo(String path) =>
    path.contains("mp4") ||
    path.contains("MP4") ||
    path.contains("MOV") ||
    path.contains("mov");

enum MediaType {
  mp4,
  svgLocal,
  svgNetwork,
  pngLocal,
  pngNetwork,
  jpgNetwork,
  file,
  waiting,
  sticker
}
