import 'dart:io';

import 'package:inses_app/model/order.dart';

abstract class NetworkEvent {
  const NetworkEvent();
}

class AddUser extends NetworkEvent {
  final String name;
  final String email;
  final String phone;
  final String password;
  AddUser({required this.name,required this.email,required this.phone,required this.password});
  // AddUser({this.name, this.phone, this.password});
}

class LoginUser extends NetworkEvent {
  final String phone;
  final String password;

  LoginUser({required this.phone,required this.password});
}

class Logout extends NetworkEvent {}

class GetUserDetails extends NetworkEvent {}

class AuthExpired extends NetworkEvent {}

class UpdateProfile extends NetworkEvent {
  final String name;
  final String phone;

  UpdateProfile({required this.name,required this.phone});
}

class UpdatePassword extends NetworkEvent {
  final String old;
  final String password;

  UpdatePassword({required this.old,required this.password});
}

class ForgetPassword extends NetworkEvent {
  final String phone;
  final String password;

  ForgetPassword({required this.phone,required this.password});
}

class AddUserAddress extends NetworkEvent {
  final String address;

  AddUserAddress({required this.address});
}

class GetCategoryServices extends NetworkEvent {
  final int id;

  GetCategoryServices({required this.id});
}

class GetUserAddress extends NetworkEvent {}

class GetServices extends NetworkEvent {}

class GetOffers extends NetworkEvent {}

class AddServiceEvent extends NetworkEvent {
  final int categoryId;
  final int price;
  final String name;
  final File? icon;
  final File? image;

  AddServiceEvent(
      {required this.categoryId,required this.name,required this.price, this.image, this.icon});
}

class EditService extends NetworkEvent {
  final int id;
  final int categoryId;
  final int price;
  final String name;
  final File? icon;
  final File? image;

  EditService(
      {required this.id,required this.categoryId,required this.name,required this.price, this.image, this.icon});
}

class DeleteService extends NetworkEvent {
  final int serviceId;
  DeleteService({required this.serviceId});
}

class AddCategoryEvent extends NetworkEvent {
  final String name;
  final File? image;

  AddCategoryEvent({required this.name, this.image});
}

class AddOfferEvent extends NetworkEvent {
  final int price;
  final int offer;
  final String text;
  final File? image;

  AddOfferEvent({this.image,required this.price,required this.text,required this.offer});
}

class EditCategory extends NetworkEvent {
  final int categoryId;
  final String name;
  final File? image;

  EditCategory({required this.name,this.image,required this.categoryId});
}

class EditOfferEvent extends NetworkEvent {
  final int id;
  final int old;
  final int price;
  final String txt;
  final File? image;

  EditOfferEvent({required this.txt,required this.image,required this.price,required this.old,required this.id});
}

class DeleteCategory extends NetworkEvent {
  final int categoryId;
  DeleteCategory({required this.categoryId});
}

class DeleteOffer extends NetworkEvent {
  final int id;
  DeleteOffer({required this.id});
}

class GetCategories extends NetworkEvent {}

class GetPaymentHistory extends NetworkEvent {}

class GetBookings extends NetworkEvent {}

class GetBookingHistory extends NetworkEvent {}

class GetReview extends NetworkEvent {}

class AddMessage extends NetworkEvent {
  final String message;
  AddMessage({required this.message});
}

class UpdatePhoneNumber extends NetworkEvent {
  final String number;
  UpdatePhoneNumber({required this.number});
}

class BookService extends NetworkEvent {
  final Order order;

  BookService({required this.order});
}

class CancelService extends NetworkEvent {
  final int orderId;

  CancelService({required this.orderId});
}

class UpdatePaymentStatus extends NetworkEvent {
  final int orderId;
  final String paymentId;
  final String method;

  UpdatePaymentStatus({required this.orderId,required this.paymentId,required this.method});
}

class AddAdditionalCharge extends NetworkEvent {
  final int orderId;
  final int price;
  final String desc;

  AddAdditionalCharge({required this.orderId,required this.price,required this.desc});
}

class AddReview extends NetworkEvent {
  final int id;
  final int rating;
  final String comment;

  AddReview({required this.id,required this.rating,required this.comment});
}

class ApproveOrder extends NetworkEvent {
  final int categoryId;
  ApproveOrder({required this.categoryId});
}

class CompleteOrder extends NetworkEvent {
  final int categoryId;
  CompleteOrder({required this.categoryId});
}

class GetBookingDetails extends NetworkEvent {
  final int id;
  GetBookingDetails({required this.id});
}

class RemoveAdditionalCharge extends NetworkEvent {
  final int id;
  RemoveAdditionalCharge({required this.id});
}
