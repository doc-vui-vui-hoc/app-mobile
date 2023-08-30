import 'dart:io';

import 'package:ar_book/models/arbook.dart';
import 'package:ar_book/services/api_provider.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:path_provider/path_provider.dart';

class DownloadFile {
  void downloadListFile(ArBook book, String lang) async {
    var file = await download(baseUrlAR + book.data["image"][0]["url"]);
    print(file);
  }

  Future<File?> download(String url) async {
    final File? file = await FileDownloader.downloadFile(
      url: url,
      onDownloadError: (err) {},
    );
    return file;
  }

  Future<String> getDownloadFilePath(String name) async {
    final Directory? dir = Platform.isAndroid
        ? await _getDownloadFilePathAndroid()
        : await getApplicationSupportDirectory();
    if (dir != null) {
      final String path = '${dir.path}/$name';
      final bool _exit = await dir.exists();
      if (!_exit) {
        await dir.create();
      }
      print(dir.path);
      return path;
    }
    return "";
  }

  Future<Directory?> _getDownloadFilePathAndroid() async {
    Directory? directory = await getExternalStorageDirectory();
    if (directory != null) {
      String newPath = "";

      final List<String> paths = directory.path.split("/");
      for (int x = 1; x < paths.length; x++) {
        final String folder = paths[x];
        if (folder != "Android") {
          newPath += "/" + folder;
        } else {
          break;
        }
      }
      newPath = newPath + "/" + 'bonbon';
      print(newPath);

      directory = Directory(newPath);

      return directory;
    }
    return null;
  }
}
