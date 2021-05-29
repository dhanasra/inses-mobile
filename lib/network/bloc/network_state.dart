import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:inses_app/model/bookings.dart';
import 'package:inses_app/model/payment_history.dart';
import 'package:inses_app/model/service.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object> get props => [];
}

class Initial extends NetworkState {}

class Loading extends NetworkState {}

class Empty extends NetworkState {}

class Error extends NetworkState {}

class GotServices extends NetworkState {
  final List<ServiceModel> services;

  const GotServices({@required this.services}) : assert(services != null);

  @override
  List<Object> get props => [services];
}

class GotPaymentHistory extends NetworkState {
  final List<PaymentHistoryModel> payments;

  const GotPaymentHistory({@required this.payments}) : assert(payments != null);

  @override
  List<Object> get props => [payments];
}

class GotBookings extends NetworkState {
  final List<BookingModel> bookings;

  const GotBookings({@required this.bookings}) : assert(bookings != null);

  @override
  List<Object> get props => [bookings];
}

class GotBookingHistory extends NetworkState {
  final List<BookingModel> bookings;

  const GotBookingHistory({@required this.bookings}) : assert(bookings != null);

  @override
  List<Object> get props => [bookings];
}

class MessageAdded extends NetworkState {}

class PaymentStatusUpdated extends NetworkState {}

class PhoneNumberUpdated extends NetworkState {}

class ServiceBooked extends NetworkState {}