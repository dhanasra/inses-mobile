import 'package:equatable/equatable.dart';

class OfferModel extends Equatable {
  final String old;
  final String txt;
  final String img;

  const OfferModel(
      {this.old,
        this.txt,
        this.img,});

  @override
  List<Object> get props =>
      [img,old,txt];

  static OfferModel fromJson(dynamic json) {
    return OfferModel(
        old: json['old'],
        txt: json['txt'],
        img: json['img']);
  }

  @override
  String toString() => 'ServiceModel id: $img';
}
