import 'package:equatable/equatable.dart';

class BookingModel extends Equatable {
  final String id;

  const BookingModel(
      {this.id,});

  @override
  List<Object> get props => [id];

  static BookingModel fromJson(dynamic json) {
    return BookingModel(
      id: json['id'],);
  }

  @override
  String toString() => 'ServiceModel id: $id';
}