import 'dart:io';
import 'dart:math';

import 'package:ar_book/screens/book_detail/player_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ItemPlayerDetailDownload extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String audioUrl;
  const ItemPlayerDetailDownload(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.audioUrl})
      : super(key: key);

  @override
  State<ItemPlayerDetailDownload> createState() => _ItemPlayerDetailDownloadState();
}

class _ItemPlayerDetailDownloadState extends State<ItemPlayerDetailDownload> {
   var sub = "";


  @override
  Widget build(BuildContext context) {
    playSong(widget.audioUrl, localFile: true);
    if(widget.title != null){
      var sub = widget.title.trim();
      setState(() {
        
      });
    }else{
      var sub = "";
      setState(() {
        
      });
    }
    
    return Column(children: [
     Image(
        image: FileImage(File(widget.imageUrl)),
      ),
      Expanded(
        flex: 1,
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            controller: ScrollController(keepScrollOffset: false),
            scrollDirection: Axis.vertical,
            child: Html(
              data: '<p>' + sub + "</p>",
              style: {
                "span": Style(
                  textAlign: TextAlign.center,
                  fontFamily: 'Nunito',
                  fontSize: FontSize(16),
                  color: const Color(0xFF006338),
                  fontWeight: FontWeight.bold,
                ),
                "p": Style(
                  textAlign: TextAlign.center,
                  fontSize: FontSize(16),
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
