import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String name;
  final String img;
  final String date;
  final int stars;
  final String review;
  

  const ReviewModel(
      {required this.name,
        required this.review,
        required this.img,
        required this.date,
        required this.stars
      });

  @override
  List<Object> get props =>
      [img,name,review];

  static ReviewModel fromJson(dynamic json) {
    return ReviewModel(
        name: json['name'],
        review: json['review'],
        date: json['date'],
        stars: json['stars'],
        img: json['img']);
  }

  @override
  String toString() => 'ServiceModel id: $img';
}
