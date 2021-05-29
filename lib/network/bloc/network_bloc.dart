import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inses_app/model/bookings.dart';
import 'package:inses_app/model/payment_history.dart';
import 'package:inses_app/model/service.dart';
import 'package:inses_app/network/app_repository.dart';
import 'package:inses_app/network/bloc/network_state.dart';

import 'network_event.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final AppRepository appRepository;

  NetworkBloc({@required this.appRepository})
      : assert(appRepository != null),
        super(Initial());

  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {

    if (event is GetServices) {
      yield Loading();
      try {
        final List<ServiceModel> services = await appRepository.getServices();
        if(services.isEmpty){
          yield Empty();
        }else{
          yield GotServices(services: services);
        }
      } catch (e) {
        print(e);
        yield Error();
      }
    }

    if (event is GetPaymentHistory) {
      yield Loading();
      try {
        final List<PaymentHistoryModel> payments = await appRepository.getPaymentHistory();

        if(payments.isEmpty){
          yield Empty();
        }else{
          yield GotPaymentHistory(payments: payments);
        }
      } catch (e) {
        print(e);
        yield Error();
      }
    }

    if (event is GetBookings) {
      yield Loading();
      try {
        final List<BookingModel> bookings = await appRepository.getBookings();

        if(bookings.isEmpty){
          yield Empty();
        }else{
          yield GotBookings(bookings: bookings);
        }
      } catch (e) {
        print(e);
        yield Error();
      }
    }

    if (event is GetBookingHistory) {
      yield Loading();
      try {
        final List<BookingModel> bookings = await appRepository.getBookingHistory();

        if(bookings.isEmpty){
          yield Empty();
        }else{
          yield GotBookingHistory(bookings: bookings);
        }
      } catch (e) {
        print(e);
        yield Error();
      }
    }

    if (event is BookService) {
      yield Loading();
      try {
        final String response = await appRepository.bookService();
        if(response=='success') {
          yield ServiceBooked();
        }
      } catch (e) {
        print(e);
        yield Error();
      }
    }

    if (event is AddMessage) {
      yield Loading();
      try {
        final String response = await appRepository.addMessage(event.message);
        if(response=='success') {
          yield MessageAdded();
        }
      } catch (e) {
        print(e);
        yield Error();
      }
    }

    if (event is UpdatePaymentStatus) {
      yield Loading();
      try {
        final String response = await appRepository.paymentStatus();
        if(response=='success') {
          yield PaymentStatusUpdated();
        }
      } catch (e) {
        print(e);
        yield Error();
      }
    }

    if (event is UpdatePhoneNumber) {
      yield Loading();
      try {
        final String response = await appRepository.updatePhoneNumber(event.number);
        if(response=='success') {
          yield PhoneNumberUpdated();
        }
      } catch (e) {
        print(e);
        yield Error();
      }
    }

  }
}