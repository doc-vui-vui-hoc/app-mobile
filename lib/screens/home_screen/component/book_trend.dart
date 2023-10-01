import 'package:ar_book/models/arbook.dart';
import 'package:ar_book/screens/home_screen/component/item_book.dart';
import 'package:ar_book/screens/home_screen/component/loading_booknew.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookTrend extends ConsumerStatefulWidget {
  const BookTrend({Key? key}) : super(key: key);

  @override
  ConsumerState<BookTrend> createState() => _BookTrendState();
}

class _BookTrendState extends ConsumerState<BookTrend> {
  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(homeStateNotifier).isLoadingBookTrend;
    final bookTrend = ref.watch(homeStateNotifier).listBookTrend;
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            FlutterI18n.translate(context, 'dashboard.trending'),
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
          loading ? const LoadingBookNew() : _buildList(bookTrend)
        ],
      ),
    );
  }

  Widget _buildList(List<ArBook> bookTrend) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: bookTrend.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              ItemBook(
                listBook: bookTrend,
                book: bookTrend[index],
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
