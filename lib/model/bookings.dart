import 'package:equatable/equatable.dart';

class BookingModel extends Equatable {
  final int id;
  final String name;
  final String categoryName;
  final String icon;
  final String status;
  final String payMethod;
  final String payStatus;
  final String date;
  final String startTime;
  final String endTime;
  final String address;
  final int quantity;
  final int totalPrice;

  const BookingModel(
      {this.id,this.startTime,this.endTime,this.address,this.date,this.quantity,this.icon,this.name,this.status,this.totalPrice,
      this.categoryName,this.payMethod,this.payStatus});

  @override
  List<Object> get props => [id,status,startTime,endTime,address,date,quantity,icon,name,totalPrice,categoryName,payStatus,payMethod];

  static BookingModel fromJson(dynamic json) {
    return BookingModel(
      id: json['id'],
      name:json['name'],
      categoryName: json['categoryName'],
      icon: json['icon'],
      status: json['status'],
      payMethod: json['payMethod'],
      payStatus: json['payStatus'],
      date: json['date'],
      startTime: json['startTime'],
        endTime: json['endTime'],
      address: json['address'],
      quantity: json['quantity'],
      totalPrice: json['totalPrice']
    );
  }

  @override
  String toString() => 'ServiceModel id: $id';
}