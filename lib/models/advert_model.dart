import 'package:equatable/equatable.dart';

class Advert extends Equatable {
  var id = '';
  var ten = '';
  var anh = '';

  Advert({
    this.id = '',
    this.ten = '',
    this.anh = '',
  });

  @override
  String toString() => 'Advert';
  @override
  List<Object> get props => [
        id,
        ten,
        anh,
      ];

  factory Advert.fromJson(Map<String, dynamic> dictionary) {
    return Advert(
        id: dictionary['id'] ?? '',
        ten: dictionary['ten'] ?? '',
        anh: dictionary['anh'] ?? '');
  }

  static get empty => Advert();
}
