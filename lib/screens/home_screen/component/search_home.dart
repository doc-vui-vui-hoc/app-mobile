import 'package:ar_book/models/arbook.dart';
import 'package:ar_book/screens/home_screen/component/item_book.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:ar_book/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchHome extends ConsumerStatefulWidget {
  const SearchHome({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends ConsumerState<SearchHome> {
  final TextEditingController _searchController = TextEditingController();

  bool isCheck = false;
  List<ArBook> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    final listSearch = ref.watch(homeStateNotifier).listSearch;
    return Scaffold(
      appBar: _buildAppBar(listSearch),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: _searchResult.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
              ItemBook(listBook: [], book: _searchResult[index]),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(List<ArBook> listArBook) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: CustomColors.white,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          color: Colors.transparent,
          child: Images.imageAssets(
            Images.ic_back,
            fit: BoxFit.scaleDown,
            color: CustomColors.black333333,
          ),
        ),
      ),
      title: Container(
        height: 42,
        decoration: BoxDecoration(
          color: CustomColors.whiteF1F3F4,
          borderRadius: BorderRadius.circular(6),
        ),
        child: TextField(
          controller: _searchController,
          // onChanged: onSearchTextChanged,
          // autofocus: true,
          cursorColor: CustomColors.black1E1E1E,
          // style: text.League14w300.copyWith(
          //   fontStyle: FontStyle.normal,
          //   fontSize: 16,
          //   color: CustomColors.black1E1E1E,
          // ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              setState(() {
                isCheck = true;
              });
            } else {
              setState(() {
                isCheck = false;
              });
            }
            _searchResult.clear();
            if (value.isEmpty) {
              setState(() {});
              return;
            }

            for (var item in listArBook) {
              if (item.data["title"]
                      [FlutterI18n.translate(context, "current_lang")]
                  .toLowerCase()
                  .contains(value.toLowerCase())) {
                _searchResult.add(item);
              }
            }
            setState(() {});
          },
          decoration: InputDecoration(
            hintText: 'Nhập từ khóa tìm kiếm',
            hintStyle: TxtStyle.League14w300.copyWith(
              fontStyle: FontStyle.normal,
              fontSize: 12,
              color: CustomColors.grayCBCBCB,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: CustomColors.grayCBCBCB,
            ),
            suffixIcon: isCheck
                ? GestureDetector(
                    onTap: () {
                      _searchController.clear();
                      setState(() {
                        isCheck = false;
                      });
                    },
                    child: Images.imageAssets(
                      Images.ic_search,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                : const SizedBox.shrink(),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          ),
        ),
      ),
    );
  }
}
