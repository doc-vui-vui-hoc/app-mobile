import 'package:ar_book/common/check_internet/connectivity_status_notifier.dart';
import 'package:ar_book/common/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:ar_book/screens/book_dowload/list_book_download.dart';
import 'package:ar_book/screens/home_screen/home_screen.dart';
import 'package:ar_book/screens/list_menu/list_menu_screen.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DaskBoardScreen extends ConsumerStatefulWidget {
  const DaskBoardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DaskBoardScreen> createState() => _DaskBoardScreenState();
}

class _DaskBoardScreenState extends ConsumerState<DaskBoardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(homeStateNotifier.notifier)
        ..getListBanner()
        ..getListbookNew()
        ..getListbookRecommend()
        ..getListbookTrend()
        ..getListAllSearch()
        ..getListbookDownLoad();
    });
  }

  final _screen = [
    const HomeScreen(),
    const ListMenuScreen(),
    const ListBookDownLoad(),
    // Container(),
  ];
  void _onItemTap(int index) {
    ref.read(indexSelectBottomBar.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    final selectIndexBottomBar = ref.watch(indexSelectBottomBar);
    return 
        Scaffold(
            body: _screen[selectIndexBottomBar],
            bottomNavigationBar: FABBottomAppBar(
              color: CustomColors.green8a9894,
              backgroundColor: CustomColors.white,
              selectedColor: CustomColors.green3ba56c,
              notchedShape: const CircularNotchedRectangle(),
              onTabSelected: _onItemTap,
              items: [
                FABBottomAppBarItem(
                  iconData: selectIndexBottomBar == 0
                      ? Images.nav_home_fill
                      : Images.nav_home,
                  text: '',
                ),
                FABBottomAppBarItem(
                  iconData: selectIndexBottomBar == 1
                      ? Images.nav_book_fill
                      : Images.nav_book,
                  text: '',
                ),
                FABBottomAppBarItem(
                  iconData: selectIndexBottomBar == 2
                      ? Images.nav_bookmark
                      : Images.nav_bookmark_blank,
                  text: '',
                ),
              ],
            ),
          );
        
}
}