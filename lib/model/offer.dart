import 'package:equatable/equatable.dart';

class OfferModel extends Equatable {
  final String old;
  final String offer;
  final String txt;
  final int id;
  final String img;

  const OfferModel(
      {required this.old,
        required this.txt,
        required this.img,
        required this.offer,
        required this.id
      });

  @override
  List<Object> get props =>
      [img,old,txt,offer,id];

  static OfferModel fromJson(dynamic json) {
    return OfferModel(
        old: json['old'],
        txt: json['txt'],
        img: json['img'],
        offer: json['offer'],
        id: json['id']
    );
  }

  @override
  String toString() => 'ServiceModel id: $img';
}
