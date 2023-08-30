import 'dart:convert';
import 'package:ar_book/models/advert_model.dart';
import 'package:ar_book/models/arbook.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'http://arbook.vietpix.com';

  Future<List<ArBook>> getListAdverts(String path) async {
    List<ArBook> _listAdvert = [];
    var url = Uri.parse('$baseUrl$path');

    var response = await http.get(url);
    var body = json.decode(response.body);
    final List data = body['items'];
    for (var i = 0; i < data.length; i++) {
      _listAdvert.add(ArBook.fromJson(data[i]));
    }
    if (response.statusCode == 200) {
      return _listAdvert;
    } else {
      return throw Exception('Faild api new noi bat');
    }
  }

  // Future<HomeModel> getHome() async {
  //   var url =
  //       Uri.parse('$baseUrl/tour/edit/65a7a5c7-a077-4b5f-a272-4ac123e8a92c');
  //   var response = await http.get(url);
  //   var body = json.decode(response.body);
  //   if (response.statusCode == 200) {
  //     return HomeModel.fromJson(body['item']);
  //   } else {
  //     return throw Exception('erro ');
  //   }
  // }

  // Future<List<ArtifactModel>> getListArtifact() async {
  //   List<ArtifactModel> _artifactModel = [];
  //   var url = Uri.parse('http://data.vanmieu.baotangso.com/API/layHienVat');

  //   var response = await http.get(url);
  //   var body = json.decode(response.body) as List;
  //   // final List data = body['items'];
  //   for (var i = 0; i < body.length; i++) {
  //     _artifactModel.add(ArtifactModel.fromJson(body[i]));
  //   }
  //   if (response.statusCode == 200) {
  //     // print(_artifactModel);
  //     return _artifactModel;
  //   } else {
  //     return throw Exception('Faild api new noi bat');
  //   }
  // }

  // Future<List<ArtifactModel>> getListBia() async {
  //   List<ArtifactModel> _biaModel = [];
  //   var url = Uri.parse('http://data.vanmieu.baotangso.com/API/layBia');

  //   var response = await http.get(url);
  //   var body = json.decode(response.body) as List;
  //   // final List data = body['items'];
  //   for (var i = 0; i < body.length; i++) {
  //     _biaModel.add(ArtifactModel.fromJson(body[i]));
  //   }
  //   if (response.statusCode == 200) {
  //     // print(_artifactModel);
  //     return _biaModel;
  //   } else {
  //     return throw Exception('Faild api new noi bat');
  //   }
  // }
}
