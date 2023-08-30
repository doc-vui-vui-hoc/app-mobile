import 'package:equatable/equatable.dart';

class ArBook extends Equatable {
  final String uuid;
  final Map<String, dynamic> data;

  const ArBook({required this.uuid, required this.data});

  @override
  List<Object?> get props => [uuid, data];

  factory ArBook.fromJson(Map<String, dynamic> dictionary) {
    return ArBook(uuid: dictionary["uuid"], data: dictionary["data"]);
  }
}
