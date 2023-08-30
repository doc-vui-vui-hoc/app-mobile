import 'package:ar_book/models/arbook.dart';
import 'package:ar_book/screens/book_detail/book_detail.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class ItemBook extends StatelessWidget {
  final ArBook book;
  final List<ArBook> listBook;
  final bool? related;
  const ItemBook(
      {Key? key,
      required this.book,
      required this.listBook,
      this.related = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (related == true) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BookDetailScreen(
                        listBook: listBook,
                        book: book,
                      )));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookDetailScreen(
                        book: book,
                        listBook: listBook,
                      )));
        }
      },
      child: Column(
        children: [
          Container(
              // margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                border: Border.all(color: const Color(0xFFECECEC), width: 1),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: (book.data["image"].length != 0)
                    ? Images.imageAssets(
                        baseUrlAR + book.data["image"][0]["url"],
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
                      [FlutterI18n.translate(context, "current_lang")] ??
                  book.data["title"]["vi"],
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
