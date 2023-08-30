import 'dart:convert';

import 'package:ar_book/helpers/local_storage_manager.dart';
import 'package:ar_book/helpers/local_storage_name.dart';
import 'package:ar_book/models/arbook.dart';
import 'package:ar_book/screens/home_screen/home_state.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  final ApiService apiService;

  HomeStateNotifier(this.apiService) : super(const HomeState());

  Future<void> getListBanner() async {
    state = state.copyWith(isLoadingBanner: true);
    final lsBanner = await apiService.getListAdverts(bookBanner);
    state = state.copyWith(
      listBanner: lsBanner,
      isLoadingBanner: false,
    );
  }

  Future<void> getListbookNew() async {
    state = state.copyWith(isLoadingBookNew: true);
    final lsBanner = await apiService.getListAdverts(bookNew);
    state = state.copyWith(
      listBookNew: lsBanner,
      isLoadingBookNew: false,
    );
  }

  Future<void> getListbookRecommend() async {
    state = state.copyWith(isLoadingBookRecommend: true);
    final lsBanner = await apiService.getListAdverts(bookRecommend);
    state = state.copyWith(
      listBookRecommend: lsBanner,
      isLoadingBookRecommend: false,
    );
  }

  Future<void> getListbookTrend() async {
    state = state.copyWith(isLoadingBookTrend: true);
    final lsBanner = await apiService.getListAdverts(bookTrend);
    state = state.copyWith(
      listBookTrend: lsBanner,
      isLoadingBookTrend: false,
    );
  }

  Future<void> getListAllSearch() async {
    state = state.copyWith(isLoadingSearch: true);
    final lsBanner = await apiService.getListAdverts(bookSearch);
    state = state.copyWith(
      listSearch: lsBanner,
      isLoadingSearch: false,
    );
  }

  Future<void> getListbook(Map<String, String> filter) async {
    state = state.copyWith(isLoadingListBook: true);
    List<ArBook> ls;
    if (filter["category"] == "arbook") {
      ls = await apiService.getListAdverts(bookAR);
    } else if (filter["category"] == "video") {
      ls = await apiService.getListAdverts(bookVideo);
    } else {
      ls = await apiService.getListAdverts(bookID + '${filter["category"]}');
    }

    state = state.copyWith(
      listBook: ls,
      isLoadingListBook: false,
    );
  }

  void removeListBook() {
    state = state.copyWith(
      listBook: [],
      isLoadingListBook: false,
    );
  }

  void isPlaying(bool isPlaying) {
    if (isPlaying == true) {
      state = state.copyWith(isPlaying: true);
    } else {
      state = state.copyWith(isPlaying: false);
    }
  }

  Future<void> getListbookDownLoad() async {
    List<ArBook> ls = [];
    final download =
        LocalStoreManager.getStringList(LocalStorageName.downloadFileBook);
    if (download != null) {
      for (var item in download) {
        var data = jsonDecode(item);
        ls.add(ArBook.fromJson(data));
      }
      state = state.copyWith(
        listBookDownLoad: ls,
      );
    } else {
      state = state.copyWith(
        listBookDownLoad: [],
      );
    }
  }
}
