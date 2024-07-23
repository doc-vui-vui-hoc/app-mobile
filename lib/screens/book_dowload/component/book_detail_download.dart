import 'dart:io';

import 'package:ar_book/common/button/custom_buttom_widget.dart';
import 'package:ar_book/helpers/local_storage_manager.dart';
import 'package:ar_book/helpers/local_storage_name.dart';
import 'package:ar_book/models/arbook.dart';
import 'package:ar_book/screens/book_dowload/component/book_read_download.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/custom_size.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookDetailDownLoad extends StatefulWidget {
  final ArBook book;
  const BookDetailDownLoad({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetailDownLoad> createState() => _BookDetailDownLoadState();
}

class _BookDetailDownLoadState extends State<BookDetailDownLoad> {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String currentLang = "";
  String path() {
    final local = LocalStoreManager.getString(LocalStorageName.path);
    if (local != null) {
      return local;
    }
    return '';
  }

    void checkCurrentLang() async {
    final SharedPreferences prefs = await _prefs;
    final String? currentLangCode = prefs.getString('lang');
    setState(() {
    currentLang = currentLangCode!;
    });
  }
  @override
  void initState() {
  checkCurrentLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localPath = path();
    setState(() {
      currentLang = FlutterI18n.translate(context, 'current_lang');
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: ListView(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(right: 22),
                height: 50,
                color: Theme.of(context).colorScheme.secondary,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.transparent,
                        child: Images.imageAssets(
                          Images.ic_back,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const SizedBox.shrink(),
                  ],
                )),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                // borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image(
                    image: FileImage(
                      File(
                          '$localPath${widget.book.uuid}/${widget.book.data["image"][0]["url"]}'),
                    ),
                    width: 135,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Text(
                        widget.book.data["title"][currentLang] ??
                            widget.book.data["title"]["vi"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: FlutterI18n.translate(context, "font"),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF202020)),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    // transform: Matrix4.translationValues(0.0, 25.0, -10.0),
                    child: CustomButtomWidget(
                      height: 50,
                      width: getWidth(context),
                      title:
                          FlutterI18n.translate(context, 'book.info.read-book'),
                      titleColor: CustomColors.white,
                      backgroudColor: CustomColors.green006338,
                      icon: Images.ic_book,
                      radius: BorderRadius.circular(30),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookReadingDownload(
                                      book: widget.book,
                                    )));
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            // intro(),
            widget.book.data["intro"]
                        [FlutterI18n.translate(context, 'current_lang')] !=
                    null
                ? Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      FlutterI18n.translate(context, 'book.info.intro'),
                      style: TextStyle(
                          fontFamily: FlutterI18n.translate(context, 'font'),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF202020)),
                    ),
                  )
                : const SizedBox.shrink(),
            widget.book.data["intro"]
                        [FlutterI18n.translate(context, 'current_lang')] !=
                    ""
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: intro(),
                )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 10,
            ),
             (widget.book.data['author'][FlutterI18n.translate(context, 'current_lang')] != null && widget.book.data['author'][FlutterI18n.translate(context, 'current_lang')] != "") 
            ?  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: FlutterI18n.translate(context, 'noi_dung'),
                           style: TextStyle(
                          fontFamily: FlutterI18n.translate(context, 'font'),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF202020)),
                        ),
                        TextSpan(
                          text: widget.book.data['author'][FlutterI18n.translate(context, 'current_lang')],
                           style: TextStyle(
                          fontFamily: FlutterI18n.translate(context, 'font'),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF202020)),
                        ),
                      ],
                    ),),
                  )
                : const SizedBox.shrink(),
                const SizedBox(
              height: 10,
            ),
            (widget.book.data['painter'] != null && widget.book.data['painter'] != "") 
            ?  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: FlutterI18n.translate(context, 'minh_hoa'),
                           style: TextStyle(
                          fontFamily:
                                    FlutterI18n.translate(context, 'Nunito'),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF202020)),
                        ),
                        TextSpan(
                          text: widget.book.data['painter'],
                           style: TextStyle(
                          fontFamily:
                                    FlutterI18n.translate(context, 'Nunito'),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF202020)),
                        ),
                      ],
                    ),),
                  )
                : const SizedBox.shrink(),
                 const SizedBox(
              height: 10,
            ),
          
                (widget.book.publisher != null && widget.book.publisher != "") 
            ?  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: FlutterI18n.translate(context, 'nha_xuat_ban'),
                           style: TextStyle(
                          fontFamily: FlutterI18n.translate(context, 'font'),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF202020)),
                        ),
                        TextSpan(
                          text: widget.book.publisher,
                           style: TextStyle(
                          fontFamily: FlutterI18n.translate(context, 'font'),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF202020)),
                        ),
                      ],
                    ),),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget intro() {
    return Html(
      data: "<p>" +
          (widget.book.data["intro"]
                  [FlutterI18n.translate(context, 'current_lang')] ??
              "") +
          "</p>",
      style: {
        //  "*": Style(
        //   textAlign: TextAlign.justify,
        //   fontFamily: FlutterI18n.translate(context, 'font'),
        //   fontSize: const FontSize(16),
        //   color: const Color(0xFF707070),
        // ),
        "span": Style(
          // textAlign: TextAlign.center,
          fontFamily: 'Nunito',
          fontSize:  FontSize(16),
          color: const Color(0xFF707070),
        ),
        "p": Style(
          // textAlign: TextAlign.center,
          fontFamily: FlutterI18n.translate(context, 'font'),
          fontSize:  FontSize(16),
          color: const Color(0xFF707070),
          // fontWeight: FontWeight.bold,
        ),
      },
    );
  }
}
