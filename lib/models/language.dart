import 'package:equatable/equatable.dart';

class Lang extends Equatable {
  var id;
  var scriptCode;
  var languageCode;
  var name;
  var slug;
  final String font;

  Lang(
      {this.id = '',
      this.scriptCode = '',
      this.languageCode = '',
      this.name = '',
      this.slug = '',
      this.font = 'Nunito'});

  @override
  String toString() => 'Lang';

  @override
  //
  List<Object> get props => [
        id,
        scriptCode,
        languageCode,
        slug,
        name,
      ];

  factory Lang.fromJson(Map<String, dynamic> dictionary) {
    return Lang(
      id: dictionary['id'] ?? '',
      scriptCode: dictionary['scriptCode'] ?? '',
      languageCode: dictionary['languageCode'] ?? '',
      slug: dictionary['slug'] ?? '',
      name: dictionary['name'] ?? '',
    );
  }

  static get empty => Lang();
}
