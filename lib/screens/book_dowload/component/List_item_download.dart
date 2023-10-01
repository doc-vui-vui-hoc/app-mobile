import 'dart:io';

import 'package:ar_book/helpers/local_storage_manager.dart';
import 'package:ar_book/helpers/local_storage_name.dart';
import 'package:ar_book/models/arbook.dart';
import 'package:ar_book/screens/book_dowload/component/book_detail_download.dart';
import 'package:ar_book/styles/images/images.dart';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class ItemBookDownLoad extends StatelessWidget {
  final ArBook book;
  const ItemBookDownLoad({
    Key? key,
    required this.book,
  }) : super(key: key);
  String path() {
    final local = LocalStoreManager.getString(LocalStorageName.path);
    if (local != null) {
      return local;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final localPath = path();
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailDownLoad(
              book: book,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                border: Border.all(color: const Color(0xFFECECEC), width: 1),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: (book.data["image"].length != 0)
                    ? Image.file(File(
                        '$localPath${book.uuid}/${book.data["image"][0]["url"]}'),
                        width: 90,
                        height: 120,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(
                        width: 90,
                        height: 120,
                      ),
              )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 90,
            child: Text(
              book.data["title"]
                      [FlutterI18n.translate(context, "current_lang")] != null
              ? book.data["title"]
                      [FlutterI18n.translate(context, "current_lang")] 
                :  book.data["title"]["vi"],
              style: TextStyle(
                fontSize: 14,
                fontFamily: FlutterI18n.translate(context, "font"),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
