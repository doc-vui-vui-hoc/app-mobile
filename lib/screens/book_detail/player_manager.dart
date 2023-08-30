import 'package:ar_book/screens/book_detail/just_audio_common.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

final _loudnessEnhancer = AndroidLoudnessEnhancer();
final shuffleNotifier = ValueNotifier<bool>(false);
final repeatNotifier = ValueNotifier<bool>(false);
final muteNotifier = ValueNotifier<bool>(false);
final playerState = ValueNotifier<PlayerState>(audioPlayer.playerState);

AudioPlayer audioPlayer = AudioPlayer(
  audioPipeline: AudioPipeline(
    androidAudioEffects: [
      _loudnessEnhancer,
    ],
  ),
);

Stream<PositionData> get positionDataStream =>
    Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
      audioPlayer.positionStream,
      audioPlayer.bufferedPositionStream,
      audioPlayer.durationStream,
      (position, bufferedPosition, duration) =>
          PositionData(position, bufferedPosition, duration ?? Duration.zero),
    );

bool get hasNext => audioPlayer.hasNext;

bool get hasPrevious => audioPlayer.hasPrevious;

Future<void> playSong(String urlPlayer, {bool localFile = false}) async {
  try {
    if (urlPlayer.contains('http')) {
      await audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(
          urlPlayer,
        )),
      );
    } else {
      await audioPlayer.setAudioSource(AudioSource.file(urlPlayer));
    }
    audioPlayer.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace st) {
      if (e is PlayerException) {
        print('Error code: ${e.code}');
        print('Error message: ${e.message}');
      } else {
        print('An error occurred: $e');
      }
    });
    await audioPlayer.play();
  } on PlayerInterruptedException catch (e) {
    print(e);
  }
}

// Future playNext(List<PlayerModel> listPlayer, int index) async {
//   if (index == listPlayer.length - 1) {
//     await audioPlayer.seek(Duration.zero);
//   } else {
//     await playSong(listPlayer[index + 1]);
//   }
// }

// Future playPrevious(List<PlayerModel> listPlayer, int index) async {
//   if (index == 0) {
//     await audioPlayer.seek(Duration.zero);
//   } else {
//     await playSong(listPlayer[index - 1]);
//   }
// }

class AudioMetadata {
  final String title;
  final String descrition;
  final String imageUrl;

  AudioMetadata(
      {required this.title, required this.descrition, required this.imageUrl});
}
