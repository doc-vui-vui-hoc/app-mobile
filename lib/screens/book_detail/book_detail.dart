import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ar_book/common/button/custom_buttom_widget.dart';
import 'package:ar_book/helpers/local_storage_manager.dart';
import 'package:ar_book/helpers/local_storage_name.dart';
import 'package:ar_book/models/arbook.dart';
import 'package:ar_book/screens/book_detail/book_read.dart';
import 'package:ar_book/screens/book_detail/book_video.dart';
import 'package:ar_book/screens/home_screen/component/item_book.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/custom_size.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:archive/archive_io.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:wakelock/wakelock.dart';

class BookDetailScreen extends StatefulWidget {
  final ArBook book;
  final List<ArBook> listBook;

  const BookDetailScreen({Key? key, required this.book, required this.listBook})
      : super(key: key);

  @override
  BookDetailScreenState createState() => BookDetailScreenState();
}

class BookDetailScreenState extends State<BookDetailScreen>
    with SingleTickerProviderStateMixin {
  String currentLang = "";

  final StreamController<double> _addProcess =
      StreamController<double>.broadcast();

  bool isDone = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      if (_controller.isCompleted) {
        Navigator.pop(context, true);
      }
    });
  }

  Widget intro() {
    return Html(
      data: "<p>" +
          (widget.book.data["intro"]
                  [FlutterI18n.translate(context, 'current_lang')] ??
              "") +
          "</p>",
      style: {
        "*": Style(
          textAlign: TextAlign.justify,
          fontFamily: FlutterI18n.translate(context, 'font'),
          fontSize: const FontSize(16),
          color: const Color(0xFF707070),
        ),
        "span": Style(
          textAlign: TextAlign.justify,
          fontFamily: 'Nunito',
          fontSize: const FontSize(16),
          color: const Color(0xFF707070),
        ),
        "p": Style(
          // textAlign: TextAlign.center,
          fontFamily: FlutterI18n.translate(context, 'font'),
          fontSize: const FontSize(16),
          color: const Color(0xFF707070),
          // fontWeight: FontWeight.bold,
        ),
      },
    );
  }

  Future<void> showDialogAlri(
    BuildContext context, {
    String? title,
    String? cancelText,
    String? submitText,
    Function? onCancel,
    Function? onSubmit,
  }) {
    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                  .copyWith(bottom: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sách đã được tải',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> showDownloadDialog(
    BuildContext context, {
    String? title,
    String? cancelText,
    String? submitText,
    Function? onCancel,
    Function? onSubmit,
  }) {
    return showDialog(
        useRootNavigator: false,
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                  .copyWith(bottom: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  StreamBuilder<double>(
                      stream: _addProcess.stream,
                      builder: (context, snapshot) {
                        final ischeck = snapshot.data == 100;
                        return Align(
                          alignment:
                              ischeck ? Alignment.center : Alignment.centerLeft,
                          child: Text(
                            ischeck ? 'Tải thành công' : 'Đang tải',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        );
                      }),
                  if (!isDone)
                    const SizedBox(
                      height: 24,
                    ),
                  StreamBuilder<double>(
                      stream: _addProcess.stream,
                      builder: (context, snapshot) {
                        final ischeck = snapshot.data == 100;
                        return AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          child: ischeck
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox.square(
                                      dimension: 112,
                                      child: Lottie.asset(
                                        'assets/icons/upload_complete.json',
                                        controller: _controller,
                                        fit: BoxFit.contain,
                                        width: 112,
                                        onLoaded: (p0) {
                                          _controller.duration = p0.duration;
                                          _controller.forward();
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : StreamBuilder<double>(
                                  stream: _addProcess.stream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Column(
                                        children: [
                                          LinearProgressIndicator(
                                            
                                            backgroundColor:
                                                CustomColors.green006338,
                                            value: snapshot.data! / 100,
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            '${(snapshot.data!.toInt())} %',
                                          )
                                        ],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Container(
                                        child: Column(
                                          children: [
                                            Images.imageAssets(
                                              'assets/icons/icon_alert_triangle.svg',
                                              fit: BoxFit.scaleDown,
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            ButtonBar(
                                              buttonPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12),
                                              alignment: MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Đóng'),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        child: Column(
                                          children: [
                                            Images.imageAssets(
                                              'assets/icons/icon_alert_triangle.svg',
                                              fit: BoxFit.scaleDown,
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            ButtonBar(
                                              buttonPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12),
                                              alignment: MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Đóng'),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                ),
                        );
                      }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
  }

  Future dowloadOffline() async {
    try {
      final language = FlutterI18n.translate(context, 'current_lang');
      Directory directory = await getCacheFolder(widget.book.uuid);
      File file = File('${directory.path}/${widget.book.uuid}.zip');
      if (file.existsSync()) {
        file.deleteSync(recursive: true);
      }

      await Dio().download(
        'https://arbook.vietpix.com/dist/arbook/${widget.book.uuid}_$language.dvvh.zip',
        file.path,
        options: Options(
          method: 'GET',
        ),
        onReceiveProgress: (count, total) {
          double process = count * 100 / total;
          if (process <= 0) {
            process = 1.0;
          }
          _addProcess.add(process);
         
        },
      );
      final inputStream = InputFileStream(file.path);

      final archive = ZipDecoder().decodeBuffer(inputStream);

      extractArchiveToDisk(archive, directory.path);

      File fileJson = File('${directory.path}/data.json');
      fileJson.open();
      final value = fileJson.readAsStringSync();
      final List<String> listbook = [];
      final book =
          LocalStoreManager.getStringList(LocalStorageName.downloadFileBook);
      for (int i = 0; i < book.length; i++) {
        listbook.add(book[i]);
      }
      listbook.add(value);
      LocalStoreManager.setStringList(
          LocalStorageName.downloadFileBook, listbook);

      savePathResource(path: directory.path);
    } catch (error) {

      print(error);
    }
  }

  Future savePathResource({required String path}) {
    return LocalStoreManager.setString(LocalStorageName.downloadFilePath, path);
  }

  Future<Directory> getCacheFolder(String fileName) async {
    final group = await path.getApplicationSupportDirectory();
    final language = FlutterI18n.translate(context, 'current_lang');
    Directory directory = Directory('${group.path}/$language$fileName');
    Directory pathLocal = Directory('${group.path}/$language');
    LocalStoreManager.setString(LocalStorageName.path, pathLocal.path);
    if (await directory.exists()) {
      return directory;
    } else {
      directory.createSync();
      return directory;
    }
  }

  Future<bool> checkPathFileExit(String fileName) async {
    final language = FlutterI18n.translate(context, 'current_lang');
    final group = await path.getApplicationSupportDirectory();
    Directory directory = Directory('${group.path}/$language$fileName');
    if (directory != null) {
      try {
        File fileJson = File('${directory.path}/data.json');
        fileJson.open();
        final value = jsonDecode(fileJson.readAsStringSync());
        if (value != null) {
          return true;
        }
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  @override
  void dispose() {
    Wakelock.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    GestureDetector(
                      onTap: () async {
                        final k = await checkPathFileExit(widget.book.uuid);
                        if (k) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: CustomColors.green006338,
                              content: Text(
                                'Sách đã được tải',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: CustomColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        } else {
                          dowloadOffline();
                          showDownloadDialog(context);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Images.imageAssets(
                          Images.ic_download,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
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
                  Images.imageAssets(
                    baseUrlAR + widget.book.data["image"][0]["url"],
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
                    height: 50,
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
                                builder: (context) => BookReading(
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
            ((widget.book.data["video"].length != 0))
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButtomWidget(
                      height: 50,
                      width: getWidth(context),
                      title: FlutterI18n.translate(
                          context, 'book.info.video-play'),
                      titleColor: CustomColors.green006338,
                      backgroudColor: Colors.white,
                      icon: Images.ic_book,
                      radius: BorderRadius.circular(30),
                      onPressed: () {
                        String url = baseUrlAR +
                            (widget.book.data["video"][0]["url"] ?? "");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CustomVideoPlayder(urlVideo: url)));
                      },
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 40,
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
            widget.listBook.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          FlutterI18n.translate(context, 'book.info.same'),
                          style: TextStyle(
                              fontFamily:
                                  FlutterI18n.translate(context, 'font'),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF202020)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: widget.listBook.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 30),
                                child: ItemBook(
                                  listBook: widget.listBook,
                                  book: widget.listBook[index],
                                  related: true,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
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
}
