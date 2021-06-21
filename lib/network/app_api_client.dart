import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:inses_app/database/app_preferences.dart';
import 'package:inses_app/database/constants.dart';
import 'package:inses_app/model/bookings.dart';
import 'package:inses_app/model/category.dart';
import 'package:inses_app/model/offer.dart';
import 'package:inses_app/model/order.dart';
import 'package:inses_app/model/payment_history.dart';
import 'package:inses_app/model/service.dart';
import 'package:inses_app/network/bloc/network_state.dart';
import 'package:inses_app/utils/url.dart';
import 'package:http/http.dart' as http;
import 'package:inses_app/view_models/home_view_model.dart';
import 'package:inses_app/view_models/order_view_model.dart';
import 'package:inses_app/view_models/profile_view_model.dart';

class AppApiClient {
  final _baseUrl = AppUrl.BASE_URL;
  final http.Client httpClient;
  AppApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<String> addUser(String name,String phone,String password) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${_baseUrl}auth/register'));

    request.body = jsonEncode({
      "name": name,
      "phone": phone,
      "password": password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String responseStr = await response.stream.bytesToString();

    Map<String, dynamic> json = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status = json['status'];
      print(status);
      if(status==200){
        String token = json['data']['token']['token'];
        String rToken = json['data']['token']['refreshToken'];

        int roleId = json['data']['user']['role_id'];

        await AppPreferences().setToken(token: token);
        await AppPreferences().setRefreshToken(refreshToken: rToken);
        await AppPreferences().setName(firstName: name);
        await AppPreferences().setPhoneNumber(phone: phone);
        await AppPreferences().setLoginStatus(status: roleId==1?AppConstants.LOGGED_IN_ADMIN:AppConstants.LOGGED_IN);

        return "success";
      }else if(status==422){
        String error = json['data']['errors'][0]['rule'];
        if(error=="alreadyExists"){
          return "Phone number already exists.";
        }else{
          return "Error";
        }
      }
    }
    else {
      print(response.reasonPhrase);
      return "Error";
    }

  }

  Future<String> userLogin(String phone,String password) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${_baseUrl}auth/login'));

    request.body = jsonEncode({
      "phone": phone,
      "password": password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String responseStr = await response.stream.bytesToString();

    Map<String, dynamic> json = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status = json['status'];
      print(status);
      if(status==200){
        String token = json['data']['token']['token'];
        String rToken = json['data']['token']['refreshToken'];

        int roleId = json['data']['user']['role_id'];
        String name = json['data']['user']['name'];

        await AppPreferences().setToken(token: token);
        await AppPreferences().setRefreshToken(refreshToken: rToken);
        await AppPreferences().setName(firstName: name);
        await AppPreferences().setPhoneNumber(phone: phone);
        await AppPreferences().setLoginStatus(status: roleId==1?AppConstants.LOGGED_IN_ADMIN:AppConstants.LOGGED_IN);
        HomeViewModel.loginStatus = roleId==1?AppConstants.LOGGED_IN_ADMIN:AppConstants.LOGGED_IN;
        print(roleId);
        return "success";
      }else if(status==422){
        String error = json['data']['errors'][0]['rule'];
        print(error);
        if(error=="invalid"){
          return "Invalid password";
        }else{
          return "Error";
        }
      }
    }
    else {
      print(response.reasonPhrase);
      return "Error";
    }
  }

  Future<String> logout() async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token
    };
    var request = http.Request('POST', Uri.parse('${_baseUrl}auth/logout'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String responseStr = await response.stream.bytesToString();

    Map<String, dynamic> json = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status = json['status'];
      print(status);
      if(status==200){
        await AppPreferences().setLoginStatus(status: AppConstants.LOGGED_OUT);
        return "success";
      }
    }
    else {
      print(response.reasonPhrase);
      return "Error";
    }
  }

  Future<NetworkState> getUserDetails() async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token
    };
    var request = http.Request('GET', Uri.parse('${_baseUrl}user/me'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String responseStr = await response.stream.bytesToString();

    Map<String, dynamic> json = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status =  json['status'];
      if(status==200){
        String name = json['data']['user']['name'];
        String phone = json['data']['user']['phone'];
        return GotUserDetails(name: name,phone: phone);
      }
    }
    else {
      print(response.reasonPhrase);
      return Error(error: 'Error');
    }
  }

  Future<String> updateProfile(String name,String phone) async {
    print(name);
    print(phone);
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json'
    };
    var body = jsonEncode({
      "name":name,
      "phone":phone
    });
    var response = await http.post(Uri.parse('${_baseUrl}user/update-profile'),body: body,headers: headers);

    String responseStr = response.body.toString();

    Map<String, dynamic> json1 = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status =  json1['status'];
      if(status==200){
        await AppPreferences().setName(firstName: name);
        await AppPreferences().setPhoneNumber(phone: phone);
        return 'success';
      }
    }
    else {
      print(response.reasonPhrase);
      return 'Error';
    }
  }

  Future<String> updatePassword(String password) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json'
    };
    var body = jsonEncode({
      "password": password
    });
    var response = await http.post(Uri.parse('${_baseUrl}user/update-password'),body: body,headers: headers);

    String responseStr = response.body.toString();
    print(responseStr);
    Map<String, dynamic> json = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status =  json['status'];
      if(status==200){
        return 'success';
      }
    }
    else {
      print(response.reasonPhrase);
      return 'Error';
    }
  }

  Future<String> addUserAddress(String address) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json'
    };
    var body = jsonEncode({
      "address": address
    });
    var response = await http.post(Uri.parse('${_baseUrl}user-address'),body: body,headers: headers);

    String responseStr = response.body.toString();
    print(responseStr);

    Map<String, dynamic> json = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status =  json['status'];
      if(status==200){
        return 'success';
      }
    }
    else {
      print(response.reasonPhrase);
      return 'Error';
    }
  }

  Future<String> getUserAddress() async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('${_baseUrl}user-address'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String responseStr = await response.stream.bytesToString();

    Map<String, dynamic> json = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status =  json['status'];
      if(status==200){
        String address = json['data']['userAddresses']['address'];
        return address;
      }
    }
    else {
      print(response.reasonPhrase);
      return 'Error';
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = [];
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('${_baseUrl}category'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String responseStr = await response.stream.bytesToString();

    Map<String, dynamic> json = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status =  json['status'];
      if(status==200){
        List category = json['data']['categories'];
        category.forEach((element) {
          categories.add(
            CategoryModel(
              id: element['id'],
              name: element['name'],
              image: element['image']
            )
          );
        });
        return categories;
      }
    }
    else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<List<OfferModel>> getOffers() async {
    List<OfferModel> offers = [];
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('${_baseUrl}banner'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String responseStr = await response.stream.bytesToString();

    Map<String, dynamic> json = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status =  json['status'];
      if(status==200){
        List category = json['data']['banners'];
        category.forEach((element) {
          offers.add(
              OfferModel(
                  id: element['id'],
                  old: element['price'].toString(),
                  offer: element['offer_price'].toString(),
                  txt: element['text'],
                  img: element['image']
              )
          );
        });
        return offers;
      }
    }
    else {
      print(response.reasonPhrase);
      return [];
    }
  }


  Future<List<ServiceModel>> getCategoryServices(int id) async {
    final List<ServiceModel> services = [];
    print(id.toString());
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('${_baseUrl}category/$id/services'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String responseStr = await response.stream.bytesToString();
    print(responseStr);

    Map<String, dynamic> json = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status =  json['status'];
      if(status==200){
        List category = json['data']['services'];
        category.forEach((element) {
          services.add(
              ServiceModel(
                  id: element['id'],
                  name: element['name'],
                  image: element['image'],
                  icon: element['icon'],
                  price: element['price']
              )
          );
        });
        return services;
      }
    }
    else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<List<ServiceModel>> getServices() async {
    final List<ServiceModel> services = [];
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('${_baseUrl}service'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String responseStr = await response.stream.bytesToString();
    print(responseStr);

    Map<String, dynamic> json = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status =  json['status'];
      if(status==200){
        List category = json['data']['services'];
        category.forEach((element) {
          services.add(
              ServiceModel(
                  id: element['id'],
                  name: element['name'],
                  image: element['image'],
                  icon: element['icon'],
                  price: element['price'],
                categoryId: element['category_id']
              )
          );
        });
        return services;
      }
    }
    else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<String> addService({int categoryId,String name,int price,File icon,File image}) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json/octet-stream',
    };
    try {
      print('${_baseUrl}service');

      var request = http.MultipartRequest('POST', Uri.parse('${_baseUrl}service'))
        ..fields['name'] = name
        ..fields['category_id'] = categoryId.toString()
        ..fields['price'] = price.toString()
        ..files.add(await http.MultipartFile.fromPath('icon', icon.path,
          contentType:MediaType('icon','png/jpeg/jpg'),
        ))
        ..files.add(await http.MultipartFile.fromPath('image', image.path,
          contentType:MediaType('image','png/jpeg/jpg'),
        ));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String responseStr = await response.stream.bytesToString();

      print(responseStr);

      Map<String, dynamic> json = jsonDecode(responseStr);

      if (response.statusCode == 200) {
        int status = json['status'];
        if (status == 200) {
          return 'success';
        }
      }
      else {
        print(response.reasonPhrase);
        return 'Error';
      }

    }catch(e){
      print(e);
    }

  }

  Future<String> editService({int categoryId,int id,String name,int price,File icon,File image}) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json/octet-stream',
    };
    print(id);
    try {
      print('${_baseUrl}service/$id');

      var request = http.MultipartRequest('PUT', Uri.parse('${_baseUrl}service/$id'))
        ..fields['name'] = name
        ..fields['category_id'] = categoryId.toString()
        ..fields['price'] = price.toString()

        ..files.add(await http.MultipartFile.fromPath('icon', icon.path,
          contentType:MediaType('image','png/jpeg/jpg'),)
        )
        ..files.add(await http.MultipartFile.fromPath('image', image.path,
          contentType:MediaType('image','png/jpeg/jpg'),
        ));

        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        String responseStr = await response.stream.bytesToString();

        print(responseStr);

        Map<String, dynamic> json = jsonDecode(responseStr);

        if (response.statusCode == 200) {
          int status = json['status'];
          if (status == 200) {
            return 'success';
          }
        }
        else {
          print(response.reasonPhrase);
          return 'Error';
        }

    }catch(e){
      print(e);
    }

  }

  Future<String> deleteService({int serviceId}) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json',
    };
    try {
      print('${_baseUrl}category');


      var request = http.Request('DELETE', Uri.parse('${_baseUrl}service/$serviceId'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String responseStr = await response.stream.bytesToString();

      print(responseStr);

      Map<String, dynamic> json = jsonDecode(responseStr);

      if (response.statusCode == 200) {
        int status = json['status'];
        if (status == 200) {
          return 'success';
        }
      }
      else {
        print(response.reasonPhrase);
        return 'Error';
      }

    }catch(e){
      print(e);
    }

  }

  Future<String> addCategory({String name,File image}) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json/octet-stream',
    };
    try {
      print('${_baseUrl}category');

      var request = http.MultipartRequest('POST', Uri.parse('${_baseUrl}category'))
        ..fields['name'] = name
        ..files.add(await http.MultipartFile.fromPath('image', image.path,
          contentType:MediaType('image','png/jpeg/jpg'),
        ));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String responseStr = await response.stream.bytesToString();

      print(responseStr);

      Map<String, dynamic> json = jsonDecode(responseStr);

      if (response.statusCode == 200) {
        int status = json['status'];
        if (status == 200) {
          return 'success';
        }
      }
      else {
        print(response.reasonPhrase);
        return 'Error';
      }

    }catch(e){
      print(e);
    }

  }

  Future<String> addOffer({String text,File image,int price,int offer}) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json/octet-stream',
    };
    try {
      print('${_baseUrl}category');

      var request = http.MultipartRequest('POST', Uri.parse('${_baseUrl}banner'))
        ..fields['text'] = text
        ..fields['price'] = price.toString()
        ..fields['offer_price'] = offer.toString()
        ..files.add(await http.MultipartFile.fromPath('image', image.path,
          contentType:MediaType('image','png/jpeg/jpg'),
        ));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String responseStr = await response.stream.bytesToString();

      print(responseStr);

      Map<String, dynamic> json = jsonDecode(responseStr);

      if (response.statusCode == 200) {
        int status = json['status'];
        if (status == 200) {
          return 'success';
        }
      }
      else {
        print(response.reasonPhrase);
        return 'Error';
      }

    }catch(e){
      print(e);
    }

  }

  Future<String> editOffer({int id, String text,File image,int price,int offer}) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json/octet-stream',
    };
    try {
      print('${_baseUrl}banner/$id');

      var request = http.MultipartRequest('PUT', Uri.parse('${_baseUrl}banner/$id'))
        ..fields['price'] = price.toString()
        ..fields['offer_price'] = offer.toString()
        ..fields['text'] = text
        ..files.add(await http.MultipartFile.fromPath('image', image.path,
          contentType:MediaType('image','png/jpeg/jpg'),
        ));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String responseStr = await response.stream.bytesToString();

      print(responseStr);

      Map<String, dynamic> json = jsonDecode(responseStr);

      if (response.statusCode == 200) {
        int status = json['status'];
        if (status == 200) {
          return 'success';
        }
      }
      else {
        print(response.reasonPhrase);
        return 'Error';
      }

    }catch(e){
      print(e);
    }

  }

  Future<String> editCategory({int categoryId,String name,File image}) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json/octet-stream',
    };
    try {
      print('${_baseUrl}category/$categoryId');

      var request = http.MultipartRequest('PUT', Uri.parse('${_baseUrl}category/$categoryId'))
        ..fields['name'] = name
        ..files.add(await http.MultipartFile.fromPath('image', image.path,
          contentType:MediaType('image','png/jpeg/jpg'),
        ));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String responseStr = await response.stream.bytesToString();

      print(responseStr);

      Map<String, dynamic> json = jsonDecode(responseStr);

      if (response.statusCode == 200) {
        int status = json['status'];
        if (status == 200) {
          return 'success';
        }
      }
      else {
        print(response.reasonPhrase);
        return 'Error';
      }

    }catch(e){
      print(e);
    }

  }

  Future<String> deleteCategory({int categoryId}) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json',
    };
    try {
      print('${_baseUrl}category');


      var request = http.Request('DELETE', Uri.parse('${_baseUrl}category/$categoryId'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String responseStr = await response.stream.bytesToString();

      print(responseStr);

      Map<String, dynamic> json = jsonDecode(responseStr);

      if (response.statusCode == 200) {
        int status = json['status'];
        if (status == 200) {
          return 'success';
        }
      }
      else {
        print(response.reasonPhrase);
        return 'Error';
      }

    }catch(e){
      print(e);
    }

  }

  Future<String> bookService(Order order) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    print(1);
    try{
      print(1);
      var headers = {
        'x-refresh-token': token,
        'Content-Type': 'application/json'
      };

      var request = http.Request('POST', Uri.parse('${_baseUrl}order'));

      request.headers.addAll(headers);

      request.body = jsonEncode({
        "date":order.date,
        "start_time":order.start_time,
        "end_time":order.end_time,
        "address":order.address,
        "service_id":order.service_id,
        "quantity":order.quantity
      });

      http.StreamedResponse response = await request.send();

      String responseStr = await response.stream.bytesToString();

      print(responseStr);

      Map<String, dynamic> json = jsonDecode(responseStr);

      if (response.statusCode == 200) {
        int status =  json['status'];
        OrderViewModel.orderId = json['data']['order']['id'];
        if(status==200){
          return 'success';
        }
      }
      else {
        print(response.reasonPhrase);
        return 'Error';
      }
    }catch(e){
      print(e);
    }
  }

  Future<List<BookingModel>> getBookings(String type) async {
    final List<BookingModel> bookings = [];
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('${_baseUrl}order?status=$type'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String responseStr = await response.stream.bytesToString();
    print(responseStr);

    Map<String, dynamic> json = jsonDecode(responseStr);

    if (response.statusCode == 200) {
      int status =  json['status'];
      if(status==200){
        List orders = json['data']['orders'];
        orders.forEach((element) {
          bookings.add(
              BookingModel(
                id: element['id'],
                name: element['service']['name'],
                categoryName: element['service']['category_name'],
                address: element['address'],
                totalPrice: element['total'],
                startTime: element['start_time'],
                endTime: element['end_time'],
                status: element['status'],
                payStatus: element['payment_status'],
                payMethod: element['payment_method'],
                icon: element['service']['icon'],
                date: element['date'],
                quantity:element['quantity']
              )
          );
        });
        return bookings;
      }
    }
    else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<String> updateOrder(int id,String status) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    var headers = {
      'x-refresh-token': token,
      'Content-Type': 'application/json',
    };
    print(id);
    try {
      print('${_baseUrl}order/$id/$status');

      var request = http.Request('PUT', Uri.parse('${_baseUrl}order/$id/$status'));

      request.headers.addAll(headers);

      request.body = jsonEncode({
        "status":"success",
      });

      http.StreamedResponse response = await request.send();

      String responseStr = await response.stream.bytesToString();

      print(responseStr);

      Map<String, dynamic> json = jsonDecode(responseStr);

      if (response.statusCode == 200) {
        int status = json['status'];
        if (status == 200) {
          return 'success';
        }
      }
      else {
        print(response.reasonPhrase);
        return 'Error';
      }

    }catch(e){
      print(e);
    }

  }


  Future<String> addMessage(String message) async {
    // var url = Uri.https(_baseUrl, '/exam/get');
    // final List<ServiceModel> services = [];
    // Response response = await http.get(url);
    await Future.delayed(Duration(seconds: 5));
    return 'success';
  }

  Future<String> paymentStatus(int orderId,String paymentId,String method) async {
    String token = await AppPreferences().getRefreshToken();
    print(token);
    print(1);
    try{
      print(1);
      var headers = {
        'x-refresh-token': token,
        'Content-Type': 'application/json'
      };

      print("======================$orderId======$paymentId=========$method");

      var request = http.Request('PUT', Uri.parse('${_baseUrl}order/$orderId/payment'));

      request.headers.addAll(headers);

      request.body = jsonEncode({
        "status":"success",
        "transaction_id":paymentId,
        "method":method
      });

      http.StreamedResponse response = await request.send();

      String responseStr = await response.stream.bytesToString();

      print(responseStr);

      Map<String, dynamic> json = jsonDecode(responseStr);

      if (response.statusCode == 200) {
        int status =  json['status'];
        if(status==200){
          return 'success';
        }
      }
      else {
        print(response.reasonPhrase);
        return 'Error';
      }
    }catch(e){
      print(e);
    }
  }
}