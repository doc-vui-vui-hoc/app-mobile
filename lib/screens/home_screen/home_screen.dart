import 'package:ar_book/screens/home_screen/component/banner.dart';
import 'package:ar_book/screens/home_screen/component/book_new.dart';
import 'package:ar_book/screens/home_screen/component/book_recommend.dart';
import 'package:ar_book/screens/home_screen/component/book_trend.dart';
import 'package:ar_book/screens/home_screen/component/darawer.dart';
import 'package:ar_book/screens/home_screen/component/search_home.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavigationDrawerWidget(),
      body: ListView(
        children: <Widget>[
          _appBar(),
          const ListBanner(),
          // UserRepository.isAuth ? const ListRecent() : const SizedBox(),
          const BookNew(),
          const BookRecommend(),
          const BookTrend(),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      height: 50,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _scaffoldKey.currentState!.openDrawer(),
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(16),
              child: Images.imageAssets(
                Images.icon_menu,
                fit: BoxFit.scaleDown,
                color: CustomColors.green006338,
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchHome(),
              ),
            ),
            child: Container(
              width: 30,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Images.imageAssets(
                  Images.ic_search,
                  width: 15,
                  height: 15,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFECECEC),
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
