import 'package:ar_book/screens/home_screen/home_state.dart';
import 'package:ar_book/screens/home_screen/home_state_notifier.dart';
import 'package:ar_book/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String baseUrlAR = 'http://arbook.vietpix.com';
String bookBanner = '/arbook/api/books/advert';
String bookNew = '/arbook/api/books/list?pageNumber=1&pageSize=10';
String bookSearch = '/arbook/api/books/list?pageNumber=1&pageSize=1000';
String bookRecommend = '/arbook/api/books/list?pageNumber=2&pageSize=10';
String bookTrend = '/arbook/api/books/list?pageNumber=3&pageSize=10';
String bookAR = '/arbook/api/books/list?pageNumber=1&pageSize=100';
String bookVideo = '/arbook/api/books/video';
String bookID = '/arbook/api/books/list?pageNumber=1&pageSize=100&category=';

final apiClientProvider = Provider<ApiService>((ref) => ApiService());

final indexSelectBottomBar = StateProvider<int>((ref) => 0);

final flutterSwitchValue = StateProvider<bool>((ref) => false);

final homeStateNotifier = StateNotifierProvider<HomeStateNotifier, HomeState>(
    (ref) => HomeStateNotifier(ref.watch(apiClientProvider)));

// final artifactStateNotifier =
//     StateNotifierProvider<ArtifactStateNotifier, ArtifactState>(
//         (ref) => ArtifactStateNotifier(ref.watch(apiClientProvider)));

// final storyStateNotifier =
//     StateNotifierProvider<StoryStateNotifier, StoryState>(
//         (ref) => StoryStateNotifier(ref.watch(apiClientProvider)));

// final playerStateNotifier =
//     StateNotifierProvider<PlayerStateNotifier, PlayerState>(
//         (ref) => PlayerStateNotifier(ref.watch(apiClientProvider)));

// final diagramStateNotifier =
//     StateNotifierProvider<DiagramStateNotifier, DiagramState>(
//         (ref) => DiagramStateNotifier(ref.watch(apiClientProvider)));
