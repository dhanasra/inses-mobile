import 'package:flutter/cupertino.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/model/bookings.dart';
import 'package:inses_app/model/payment_history.dart';
import 'package:inses_app/model/service.dart';
import 'package:inses_app/network/app_api_client.dart';

class AppRepository {
  final AppApiClient appApiClient;

  AppRepository({@required this.appApiClient})
      : assert(appApiClient != null);

  Future<List<ServiceModel>> getServices() async {
    return await appApiClient.getServices();
  }

  Future<List<PaymentHistoryModel>> getPaymentHistory() async {
    return await appApiClient.getPaymentHistory();
  }

  Future<List<BookingModel>> getBookings() async {
    return await appApiClient.getBookings();
  }

  Future<List<BookingModel>> getBookingHistory() async {
    return await appApiClient.getBookingHistory();
  }

  Future<String> addMessage(String message) async {
    return await appApiClient.addMessage(message);
  }

  Future<String> updatePhoneNumber(String number) async {
    return await appApiClient.updatePhoneNumber(number);
  }

  Future<String> bookService() async {
    return await appApiClient.bookService();
  }

  Future<String> paymentStatus() async {
    return await appApiClient.paymentStatus();
  }
}