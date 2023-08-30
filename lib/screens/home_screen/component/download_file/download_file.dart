import 'dart:async';
import 'dart:io';
import 'package:ar_book/helpers/local_storage_manager.dart';
import 'package:ar_book/helpers/local_storage_name.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:archive/archive_io.dart';

class DownloadFile extends StatefulWidget {
  final String uuid;
  const DownloadFile({Key? key, required this.uuid}) : super(key: key);

  @override
  State<DownloadFile> createState() => _DownloadFileState();
}

class _DownloadFileState extends State<DownloadFile>
    with SingleTickerProviderStateMixin {
  final StreamController<double> _addProcess =
      StreamController<double>.broadcast();

  late AnimationController _controller;
  bool isDone = false;

  Future dowloadOffline(
      {CancelToken? cancelToken, String? languageCode}) async {
    try {
      final language = FlutterI18n.translate(context, 'current_lang');
      Directory directory = await getCacheFolder(widget.uuid);
      File file = File('${directory.path}/$language/${widget.uuid}.zip');
      if (file.existsSync()) {
        file.deleteSync(recursive: true);
      }

      await Dio().download(
        'https://arbook.vietpix.com/dist/arbook/${widget.uuid}_$language.dvvh.zip',
        file.path,
        options: Options(
          method: 'GET',
        ),
        onReceiveProgress: (count, total) {
          double process = count * 100 / total;
          if (process <= 0) {
            process = 1.0;
          }
          _addProcess.add(process);
          if (process == 1.0) {
            setState(() {
              isDone = true;
            });
          }
        },
      );
      final inputStream = InputFileStream(file.path);

      final archive = ZipDecoder().decodeBuffer(inputStream);

      extractArchiveToDisk(archive, directory.path);

      savePathResource(path: directory.path);
    } catch (error) {}
  }

  Future savePathResource({required String path}) {
    return LocalStoreManager.setString(LocalStorageName.downloadFilePath, path);
  }

  Directory? getFolderResource({bool isPreBuy = false}) {
    if (LocalStoreManager.getString(LocalStorageName.downloadFilePath) ==
        null) {
      return null;
    } else {
      final file = Directory(
          LocalStoreManager.getString(LocalStorageName.downloadFilePath));
      if (file.existsSync()) {
        return file;
      } else {
        return null;
      }
    }
  }

  Future<Directory> getCacheFolder(String fileName) async {
    final group = await path.getApplicationSupportDirectory();
    Directory directory = Directory('${group.path}/$fileName');
    if (await directory.exists()) {
      return directory;
    } else {
      directory.createSync();
      return directory;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      if (_controller.isCompleted) {
        Navigator.pop(context, true);
      }
    });
    dowloadOffline();
  }

  @override
  Widget build(BuildContext context) {
    final language = FlutterI18n.translate(context, 'current_lang');
    print(getFolderResource());
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
            .copyWith(bottom: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: isDone ? Alignment.center : Alignment.centerLeft,
              child: Text(
                isDone ? 'msg_completed_download' : 'download_story',
              ),
            ),
            if (!isDone)
              const SizedBox(
                height: 24,
              ),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              child: isDone
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox.square(
                          dimension: 112,
                          child: Lottie.asset(
                            'assets/icons/upload_complete.json',
                            controller: _controller,
                            fit: BoxFit.contain,
                            width: 112,
                            onLoaded: (p0) {
                              _controller.duration = p0.duration;
                              _controller.forward();
                            },
                          ),
                        ),
                      ],
                    )
                  : StreamBuilder<double>(
                      stream: _addProcess.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            child: Column(
                              children: [
                                LinearProgressIndicator(
                                  backgroundColor: Colors.grey[200],
                                  value: snapshot.data! / 100,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  '${(snapshot.data!.toInt())} %',
                                )
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Container(
                            child: Column(
                              children: [
                                LinearProgressIndicator(
                                  backgroundColor: Colors.grey[200],
                                  value: 0.01,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  '1 %',
                                )
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            child: Column(
                              children: [
                                LinearProgressIndicator(
                                  backgroundColor: Colors.grey[200],
                                  value: 0.01,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  '1 %',
                                )
                              ],
                            ),
                          );
                        }
                      },
                    ),
            ),
            if (!isDone)
              ButtonBar(
                buttonPadding: const EdgeInsets.symmetric(vertical: 12),
                alignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('cancel'),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
