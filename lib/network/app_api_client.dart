import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:inses_app/model/bookings.dart';
import 'package:inses_app/model/payment_history.dart';
import 'package:inses_app/model/service.dart';
import 'package:inses_app/utils/url.dart';
import 'package:http/http.dart' as http;

class AppApiClient {
  final _baseUrl = AppUrl.BASE_URL;
  final http.Client httpClient;
  AppApiClient({@required this.httpClient}) : assert(httpClient != null);


  Future<List<ServiceModel>> getServices() async {
    final List<ServiceModel> responseList = [];
    // var url = Uri.https(_baseUrl, '/exam/get');
    // Response response = await http.get(url);
    // List<dynamic> responseJson = jsonDecode(utf8.decode(response.bodyBytes));
    // responseJson.forEach((exam) {
    //   responseList.add(ServiceModel(
    //       name: exam['name'],
    //       img: exam['img']));
    // });
    await Future.delayed(Duration(seconds: 5));
    responseList.add(ServiceModel(name: '',img: ''));
    responseList.add(ServiceModel(name: '',img: ''));
    return responseList;
  }

  Future<List<BookingModel>> getBookings() async {
    final List<BookingModel> responseList = [];
    // var url = Uri.https(_baseUrl, '/exam/get');
    // Response response = await http.get(url);
    // List<dynamic> responseJson = jsonDecode(utf8.decode(response.bodyBytes));
    // responseJson.forEach((exam) {
    //   responseList.add(ServiceModel(
    //       name: exam['name'],
    //       img: exam['img']));
    // });
    await Future.delayed(Duration(seconds: 5));
    responseList.add(BookingModel(id: '1'));
    responseList.add(BookingModel(id: '1'));
    return responseList;
  }

  Future<List<BookingModel>> getBookingHistory() async {
    final List<BookingModel> responseList = [];
    // var url = Uri.https(_baseUrl, '/exam/get');
    // Response response = await http.get(url);
    // List<dynamic> responseJson = jsonDecode(utf8.decode(response.bodyBytes));
    // responseJson.forEach((exam) {
    //   responseList.add(ServiceModel(
    //       name: exam['name'],
    //       img: exam['img']));
    // });
    await Future.delayed(Duration(seconds: 5));
    responseList.add(BookingModel(id: '1'));
    responseList.add(BookingModel(id: '1'));
    return responseList;
  }

  Future<String> addMessage(String message) async {
    // var url = Uri.https(_baseUrl, '/exam/get');
    // final List<ServiceModel> services = [];
    // Response response = await http.get(url);
    await Future.delayed(Duration(seconds: 5));
    return 'success';
  }

  Future<String> updatePhoneNumber(String number) async {
    // var url = Uri.https(_baseUrl, '/exam/get');
    // final List<ServiceModel> services = [];
    // Response response = await http.get(url);
    await Future.delayed(Duration(seconds: 5));
    return 'success';
  }

  Future<String> bookService() async {
    // var url = Uri.https(_baseUrl, '/exam/get');
    // final List<ServiceModel> services = [];
    // Response response = await http.get(url);
    await Future.delayed(Duration(seconds: 5));
    return 'success';
  }

  Future<String> paymentStatus() async {
    // var url = Uri.https(_baseUrl, '/exam/get');
    // final List<ServiceModel> services = [];
    // Response response = await http.get(url);
    await Future.delayed(Duration(seconds: 5));
    return 'success';
  }

  Future<List<PaymentHistoryModel>> getPaymentHistory() async {
    final List<PaymentHistoryModel> responseList = [];
    // var url = Uri.https(_baseUrl, '/exam/get');
    // Response response = await http.get(url);
    // List<dynamic> responseJson = jsonDecode(utf8.decode(response.bodyBytes));
    // responseJson.forEach((exam) {
    //   responseList.add(PaymentHistoryModel(
    //       id: exam['id']));
    // });
    await Future.delayed(Duration(seconds: 5));
    responseList.add(PaymentHistoryModel(id: '1'));
    responseList.add(PaymentHistoryModel(id: '1'));
    return responseList;
  }
}