import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:ar_book/models/arbook.dart';
import 'package:ar_book/screens/book_dowload/component/List_item_download.dart';
import 'package:ar_book/screens/book_dowload/component/data_blank_widget.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path;

class ListBookDownLoad extends ConsumerStatefulWidget {
  const ListBookDownLoad({Key? key}) : super(key: key);

  @override
  ConsumerState<ListBookDownLoad> createState() => _ListBookDownLoadState();
}

class _ListBookDownLoadState extends ConsumerState<ListBookDownLoad> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
String currentLang = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(homeStateNotifier.notifier).getListbookDownLoad(context);
    });
  }

   void checkCurrentLang() async {
    final SharedPreferences prefs = await _prefs;
    final String? currentLangCode = prefs.getString('lang');
    setState(() {
    currentLang = currentLangCode!;
    });
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
  Widget build(BuildContext context) {
    final listBookDownLoad = ref.watch(homeStateNotifier).listBookDownLoad;
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 22),
              height: 50,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      FlutterI18n.translate(context, 'bookdownload'),
                      style: TextStyle(
                        fontFamily: FlutterI18n.translate(context, 'font'),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.black202020,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            listBookDownLoad.isEmpty
                ? const DataBlankWidget()
                : GridView.builder(
                    itemCount: listBookDownLoad.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      // crossAxisCount: 3,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5, maxCrossAxisExtent: 150,
                    ),
                    //
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) =>
                        ItemBookDownLoad(book: listBookDownLoad[index])),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
