import 'package:equatable/equatable.dart';

class ArBook extends Equatable {
  final String uuid;
  final Map<String, dynamic> data;
  final String? publisher;


  const ArBook({required this.uuid, required this.data, required this.publisher});

  @override
  List<Object?> get props => [uuid, data];

  factory ArBook.fromJson(Map<String, dynamic> dictionary) {
    return ArBook(uuid: dictionary["uuid"], data: dictionary["data"], publisher:dictionary["publisher"]);
  }
}
