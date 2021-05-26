import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  final String name;
  final String img;

  const ServiceModel(
      {this.name,
        this.img,});

  @override
  List<Object> get props =>
      [img,name];

  static ServiceModel fromJson(dynamic json) {
    return ServiceModel(
        name: json['name'],
        img: json['img']);
  }

  @override
  String toString() => 'ServiceModel id: $img';
}
