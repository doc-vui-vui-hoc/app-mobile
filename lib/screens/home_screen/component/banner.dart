import 'package:ar_book/models/arbook.dart';
import 'package:ar_book/screens/book_detail/book_detail.dart';
import 'package:ar_book/screens/home_screen/component/loading_banner.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListBanner extends ConsumerStatefulWidget {
  const ListBanner({Key? key}) : super(key: key);

  @override
  ConsumerState<ListBanner> createState() => _ListBannerState();
}

class _ListBannerState extends ConsumerState<ListBanner> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      _currentPageValue = pageController.page!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(homeStateNotifier).isLoadingBanner;
    final banner = ref.watch(homeStateNotifier).listBanner;
    return isLoading
        ? const LoadingBanner()
        : Container(
            padding: const EdgeInsets.only(top: 8),
            height: 220,
            child: PageView.builder(
              controller: pageController,
              itemCount: banner.length,
              itemBuilder: (context, position) {
                return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookDetailScreen(
                                  listBook: banner,
                                  book: banner[position],
                                ))),
                    child: _buildpageItem(position, banner[position]));
              },
            ),
          );
  }

  Widget _buildpageItem(int index, ArBook arBook) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Images.imageAssets(
            baseUrlAR + arBook.data['banner'][0]['url'],
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
