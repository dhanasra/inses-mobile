import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  final String name;
  final String icon;
  final String? image;
  final int? id;
  final int? price;
  final int? categoryId;

  const ServiceModel(
      {
        required this.name,
        this.image,
        required this.icon,
        this.id,
        this.price,
        this.categoryId
      });

  @override
  List<Object> get props =>
      [name,icon];

  static ServiceModel fromJson(dynamic json) {
    return ServiceModel(
        name: json['name'],
        image: json['image'],
        icon: json['icon'],
        id: json['id'],
        price: json['price'],
      categoryId: json['categoryId']
    );
  }



  @override
  String toString() => 'ServiceModel id: $image';
}
