import 'package:ar_book/models/arbook.dart';
import 'package:ar_book/screens/home_screen/component/item_book.dart';
import 'package:ar_book/screens/home_screen/component/loading_booknew.dart';
import 'package:ar_book/screens/list_menu/commponent/list_book_screen.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookNew extends ConsumerStatefulWidget {
  const BookNew({Key? key}) : super(key: key);

  @override
  ConsumerState<BookNew> createState() => _BookNewState();
}

class _BookNewState extends ConsumerState<BookNew> {
  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(homeStateNotifier).isLoadingBookNew;
    final bookNew = ref.watch(homeStateNotifier).listBookNew;
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            FlutterI18n.translate(context, 'dashboard.new'),
            style: TextStyle(
              fontFamily: FlutterI18n.translate(context, 'font'),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: CustomColors.black202020,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          loading ? const LoadingBookNew() : _listView(bookNew)
        ],
      ),
    );
  }

  Widget _listView(List<ArBook> book) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: book.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              ItemBook(
                listBook: book,
                book: book[index],
                related: false,
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
