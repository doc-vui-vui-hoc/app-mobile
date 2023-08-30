import 'package:ar_book/models/arbook.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoadingSearch,
    @Default(false) bool isLoadingBanner,
    @Default(false) bool isLoadingBookNew,
    @Default(false) bool isLoadingBookRecommend,
    @Default(false) bool isLoadingBookTrend,
    @Default(false) bool isLoadingListBook,
    @Default(false) bool isPlaying,
    @Default([]) List<ArBook> listSearch,
    @Default([]) List<ArBook> listBanner,
    @Default([]) List<ArBook> listBookNew,
    @Default([]) List<ArBook> listBookRecommend,
    @Default([]) List<ArBook> listBookTrend,
    @Default([]) List<ArBook> listBook,
    @Default([]) List<ArBook> listBookDownLoad,
  }) = _HomeState;
}
