import 'package:ar_book/screens/book_dowload/component/List_item_download.dart';
import 'package:ar_book/screens/book_dowload/component/data_blank_widget.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListBookDownLoad extends ConsumerStatefulWidget {
  const ListBookDownLoad({Key? key}) : super(key: key);

  @override
  ConsumerState<ListBookDownLoad> createState() => _ListBookDownLoadState();
}

class _ListBookDownLoadState extends ConsumerState<ListBookDownLoad> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(homeStateNotifier.notifier).getListbookDownLoad();
    });
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
              // color: Theme.of(context).colorScheme.secondary,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.all(16),
                  //     child: Images.imageAssets(
                  //       Images.ic_back,
                  //       fit: BoxFit.scaleDown,
                  //     ),
                  //   ),
                  // ),
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
