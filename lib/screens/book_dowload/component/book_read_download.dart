import 'dart:async';

import 'package:ar_book/core/local_data.dart';
import 'package:ar_book/helpers/local_storage_manager.dart';
import 'package:ar_book/helpers/local_storage_name.dart';
import 'package:ar_book/models/arbook.dart';
import 'package:ar_book/models/language.dart';
import 'package:ar_book/screens/book_detail/player_manager.dart';
import 'package:ar_book/screens/book_dowload/component/item_read_detail_download.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookReadingDownload extends ConsumerStatefulWidget {
  final ArBook book;

  const BookReadingDownload({Key? key, required this.book}) : super(key: key);

  @override
  BookReadingDownloadState createState() => BookReadingDownloadState();
}

class BookReadingDownloadState extends ConsumerState<BookReadingDownload> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final PageController _pageController = PageController(initialPage: 0);
  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();
  final StreamController<ProcessingState> _streamAudioDone =
      StreamController<ProcessingState>.broadcast();

  List<Lang> lang = LocalData.languages;

  List pages = [];

  String currentLang = 'vi';
  String currentFont = '';
  bool maxPage = false;
  bool autoplay = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
    initLanguage();
    setState(() {
      pages = widget.book.data["pages"];
    });

    nextPage();
  }

  String path() {
    final local = LocalStoreManager.getString(LocalStorageName.path);
    if (local != null) {
      return local;
    }
    return '';
  }

  void initLanguage() async {
    final SharedPreferences prefs = await _prefs;
    final String? currentLangCode = prefs.getString('lang');
    if (currentLangCode != null) {
      int index = lang.indexWhere((element) => element.id == currentLangCode);
      currentLang = lang[index].slug;
      currentFont = lang[index].font;
    }
  }

  void nextPage() {
    audioPlayer.playbackEventStream.listen((event) {
      if (autoplay) {
        if (event.processingState == ProcessingState.completed) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            if (!maxPage) {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeIn);
            } else {
              audioPlayer.pause();
            }
          });
        }
      }
    });
  }

  String urlAudio(int index) {
    final localPath = path();
    String playUrl;
    if (pages[index]["audio"][currentLang] != null) {
      playUrl = localPath +
          widget.book.uuid +
          '/' +
          pages[index]["audio"][currentLang];
    } else {
      playUrl =
          "http://arbook.vietpix.com/content/uploads/arbook/2022/05/08/blank-93073436.mp3";
    }

    return playUrl;
  }

  @override
  void dispose() {
    audioPlayer.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localPath = path();
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          padding: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Column(
            children: [
              _buildAppbar(),
              Expanded(
                flex: 2,
                child: AbsorbPointer(
                  absorbing: ref.watch(flutterSwitchValue),
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: _pageController,
                    itemCount: pages.length,
                    onPageChanged: (value) {
                      if (value == pages.length - 1) {
                        setState(() {
                          maxPage = true;
                        });
                      }
                    },
                    itemBuilder: (BuildContext context, int itemIndex) {
                      return ItemPlayerDetailDownload(
                        imageUrl: localPath +
                            widget.book.uuid +
                            '/' +
                            pages[itemIndex]["image"]['url'],
                        title: pages[itemIndex]["sub_title"][currentLang],
                        audioUrl: urlAudio(itemIndex),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: _buildBottom(),
    );
  }

  Widget _buildAppbar() {
    return Container(
      padding: const EdgeInsets.only(right: 22),
      height: 50,
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              width: 18,
              height: 18,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          FlutterSwitch(
            padding: 4,
            activeText: "Auto",
            inactiveText: "Auto",
            activeTextColor: Colors.white,
            inactiveTextColor: Colors.white,
            activeIcon: const Icon(
              Icons.check,
              color: Color(0xFF21A56C),
              // size:20
            ),
            toggleSize: 18,
            inactiveIcon: const Icon(Icons.check, color: Color(0xFF869A95)),
            valueFontSize: 12.0,
            value: autoplay,
            height: 26,
            width: 60,
            activeColor: const Color(0xFF21A56C),
            showOnOff: true,
            onToggle: (val) {
              setState(() {
                autoplay = val;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 22),
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () => _pageController.previousPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                  ),
                  child: Images.imageAssets(
                    Images.iconBackward,
                    fit: BoxFit.scaleDown,
                    color: CustomColors.white,
                    height: 15,
                    width: 15,
                  ),
                  style: OutlinedButton.styleFrom(
                      elevation: 0,
                      shape: const CircleBorder(),
                      side: const BorderSide(
                        color: Color(0xFF006338),
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      backgroundColor: const Color(0xFF21A56C),
                      fixedSize: const Size(40, 40)),
                ),
                StreamBuilder<PlayerState>(
                    stream: audioPlayer.playerStateStream,
                    builder: (context, snapshot) {
                      final playerState = snapshot.data;
                      final processingState = playerState?.processingState;
                      final playing = playerState?.playing;
                      if (processingState == ProcessingState.loading ||
                          processingState == ProcessingState.buffering) {
                        return const SizedBox.shrink();
                      } else if (playing != true) {
                        return OutlinedButton(
                          onPressed: audioPlayer.play,
                          child: Images.imageAssets(
                            Images.ic_play,
                            fit: BoxFit.scaleDown,
                            height: 15,
                            width: 15,
                            color: Colors.white,
                          ),
                          style: OutlinedButton.styleFrom(
                              elevation: 0,
                              shape: const CircleBorder(),
                              side: const BorderSide(
                                color: Color(0xFFD55600),
                                style: BorderStyle.solid,
                                width: 1,
                              ),
                              backgroundColor: const Color(0xFFF97923),
                              fixedSize: const Size(40, 40)),
                        );
                      } else if (processingState != ProcessingState.completed) {
                        return OutlinedButton(
                          onPressed: audioPlayer.pause,
                          child: Images.imageAssets(
                            Images.ic_pause,
                            fit: BoxFit.scaleDown,
                            height: 15,
                            width: 15,
                            color: Colors.white,
                          ),
                          style: OutlinedButton.styleFrom(
                              elevation: 0,
                              shape: const CircleBorder(),
                              side: const BorderSide(
                                color: Color(0xFFD55600),
                                style: BorderStyle.solid,
                                width: 1,
                              ),
                              backgroundColor: const Color(0xFFF97923),
                              fixedSize: const Size(40, 40)),
                        );
                      } else {
                        return OutlinedButton(
                          onPressed: () => audioPlayer.seek(Duration.zero),
                          child: Images.imageAssets(
                            Images.ic_play,
                            fit: BoxFit.scaleDown,
                            height: 15,
                            width: 15,
                            color: Colors.white,
                          ),
                          style: OutlinedButton.styleFrom(
                              elevation: 0,
                              shape: const CircleBorder(),
                              side: const BorderSide(
                                color: Color(0xFFD55600),
                                style: BorderStyle.solid,
                                width: 1,
                              ),
                              backgroundColor: const Color(0xFFF97923),
                              fixedSize: const Size(40, 40)),
                        );
                      }
                    }),
                OutlinedButton(
                  onPressed: () => _pageController.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeIn),
                  child: Images.imageAssets(
                    Images.iconNext,
                    fit: BoxFit.scaleDown,
                    color: CustomColors.white,
                    height: 15,
                    width: 15,
                  ),
                  style: OutlinedButton.styleFrom(
                      elevation: 0,
                      shape: const CircleBorder(),
                      side: const BorderSide(
                        color: Color(0xFF006338), //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 1, //width of the border
                      ),
                      // padding: EdgeInsets.all(7),
                      backgroundColor: const Color(0xFF21A56C),
                      // <-- Button color
                      fixedSize: const Size(40, 40) // <-- Splash color
                      ),
                ),
              ],
            ),
          ),
          StreamBuilder<int>(
              initialData: 0,
              stream: _pageStreamController.stream,
              builder: (context, snapshot) {
                final currentPage = snapshot.data!;
                if (currentPage != null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        (currentPage + 1).toString() +
                            " / " +
                            pages.length.toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      LinearPercentIndicator(
                        // width: 140.0,
                        lineHeight: 5.0,
                        percent: (currentPage + 1) / pages.length,
                        backgroundColor: Colors.white,
                        progressColor: const Color(0xFFF97923),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              })
        ],
      ),
    );
  }
}
