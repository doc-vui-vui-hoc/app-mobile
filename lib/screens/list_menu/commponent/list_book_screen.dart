import 'package:ar_book/screens/home_screen/component/item_book.dart';
import 'package:ar_book/screens/list_menu/commponent/loading_list_book.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListBookScreen extends ConsumerStatefulWidget {
  final String title;
  final Map<String, String> filter;

  const ListBookScreen({Key? key, required this.title, required this.filter})
      : super(key: key);

  @override
  ListBookScreenState createState() => ListBookScreenState();
}

class ListBookScreenState extends ConsumerState<ListBookScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(homeStateNotifier.notifier).getListbook(widget.filter);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(homeStateNotifier).isLoadingListBook;
    final book = ref.watch(homeStateNotifier).listBook;
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
                  GestureDetector(
                    onTap: () {
                      ref.read(homeStateNotifier.notifier).removeListBook();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Images.imageAssets(
                        Images.ic_back,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Text(
                    FlutterI18n.translate(context, widget.title),
                    style: TextStyle(
                      fontFamily: FlutterI18n.translate(context, 'font'),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.black202020,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            loading
                ? const LoadingListBook()
                : GridView.builder(
                    itemCount: book.length,
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
                    itemBuilder: (context, index) => ItemBook(
                      listBook: book,
                      book: book[index],
                      related: false,
                    ),
                  ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
