import 'package:equatable/equatable.dart';

class Category extends Equatable {
  int id;
  String ten;
  String anh;
  String filter;

  Category({
    this.id = 0,
    this.ten = '',
    this.anh = '',
    this.filter = '',
  });

  @override
  String toString() => 'Category';
  @override
  List<Object> get props => [id, ten, anh, filter];

  factory Category.fromJson(Map<String, dynamic> dictionary) {
    return Category(
        id: dictionary['id'] ?? '',
        ten: dictionary['ten'] ?? '',
        anh: dictionary['anh'] ?? '',
        filter: dictionary['filter'] ?? '');
  }

  static get empty => Category();
}
