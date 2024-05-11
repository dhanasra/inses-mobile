import 'package:equatable/equatable.dart';
import 'package:inses_app/network/models/user_address.dart';
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
  final UserAddress userAddress;
  final String? userName;
  final String? userPhone;
  final bool? reviewed;
  final int quantity;
  final int? additionalPrice;
  final int? additionalId;
  final String? additionalDesc;
  final int totalPrice;

  const BookingModel(
      {required this.id,required this.startTime,required this.endTime,required this.userAddress,required this.date,required this.quantity,required this.icon,required this.name,required this.status,required this.totalPrice,
      required this.categoryName,this.userName,this.userPhone,required this.payMethod,this.reviewed,required this.payStatus, this.additionalId, this.additionalDesc, this.additionalPrice});

  @override
  List<Object> get props => [id,status,startTime,endTime,userAddress,date,quantity,icon,name,totalPrice,categoryName,payStatus,payMethod];

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
      userName: json['userName'],
      userPhone: json['userPhone'],
      startTime: json['startTime'],
        reviewed: json['reviewed'],
        endTime: json['endTime'],
      userAddress: UserAddress.fromMap(json['user_address']),
      quantity: json['quantity'],
      totalPrice: json['totalPrice'],
      additionalDesc: json['additionalDesc'],
      additionalPrice: json['additionalPrice'],
        additionalId: json['additionalId']
    );
  }

  @override
  String toString() => 'ServiceModel id: $id';
}