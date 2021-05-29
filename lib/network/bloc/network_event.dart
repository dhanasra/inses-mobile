import 'dart:io';

abstract class NetworkEvent {
  const NetworkEvent();
}

class GetServices extends NetworkEvent {}

class GetPaymentHistory extends NetworkEvent {}

class GetBookings extends NetworkEvent {}

class GetBookingHistory extends NetworkEvent {}

class AddMessage extends NetworkEvent{
  final String message;

  AddMessage({this.message});
}

class UpdatePhoneNumber extends NetworkEvent{
  final String number;

  UpdatePhoneNumber({this.number});
}

class BookService extends NetworkEvent {}

class UpdatePaymentStatus extends NetworkEvent {}