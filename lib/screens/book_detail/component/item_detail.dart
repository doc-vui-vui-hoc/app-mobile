import 'dart:io';

import 'package:ar_book/screens/book_detail/player_manager.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as a;

class ItemPlayerDetail extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String audioUrl;
  const ItemPlayerDetail(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.audioUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    playSong(audioUrl);
    var sub = title.trim();
    return Column(children: [
       Images.imageAssets(
        imageUrl,
        fit: BoxFit.contain,
      ),
     
      Expanded(
        flex: 1,
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            controller: ScrollController(keepScrollOffset: false),
            scrollDirection: Axis.vertical,
            child: a.Html(
              data: '<p>' + sub + "</p>",
              style: {
                "span": a.Style(
                  textAlign: TextAlign.center,
                  fontFamily: 'Nunito',
                  fontSize: a.FontSize(16),
                  color: const Color(0xFF006338),
                  fontWeight: FontWeight.bold,
                ),
                "p": a.Style(
                  textAlign: TextAlign.center,
                  fontSize: a.FontSize(16),
                  color: const Color(0xFF006338),
                  fontWeight: FontWeight.bold,
                ),
              },
            ),
          ),
        ),
      ),
    ]);
  }
}
