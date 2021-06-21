import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/image_container.dart';
import 'package:inses_app/comps/line.dart';
import 'package:inses_app/comps/tap_field.dart';
import 'package:inses_app/database/constants.dart';
import 'package:inses_app/network/app_api_client.dart';
import 'package:inses_app/network/app_repository.dart';
import 'package:inses_app/network/bloc/network_bloc.dart';
import 'package:inses_app/network/bloc/network_event.dart';
import 'package:inses_app/network/bloc/network_state.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/view_models/order_view_model.dart';
import 'package:inses_app/widgets/error_item.dart';
import 'package:inses_app/widgets/loader.dart';

class UpdateBookingStatus extends StatefulWidget {

  @override
  _UpdateBookingStatusState createState() => _UpdateBookingStatusState();
}

class _UpdateBookingStatusState extends State<UpdateBookingStatus> {
  NetworkBloc bloc;
  AppRepository appRepository = AppRepository(appApiClient: AppApiClient(httpClient: Client()));

  @override
  void initState() {
    bloc = NetworkBloc(appRepository: appRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App().appBarBack(
        context,
        OrderViewModel.booking.categoryName,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 50),
        child: BlocBuilder<NetworkBloc,NetworkState>(
          bloc: bloc,
          builder: (context,state){
            if(state is Empty || state is Loading){
              return buildView(OrderViewModel.load1,OrderViewModel.load2);
            }else if(state is Error){
              return ErrorItem();
            }else if(state is Initial || state is Approved || state is Completed){
              if(state is Approved){
                Future.delayed(Duration.zero, () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Wrap(
                            children: [
                              Content(
                                padding: EdgeInsets.only(top: 5,bottom: 5),
                                text: 'Order is approved successfully',
                                fontSize: AppDimen.TEXT_SMALL,
                                fontWeight: FontWeight.w400,
                                fontfamily: AppFont.FONT,
                              ),
                            ],
                          )
                      )
                  );
                });
              }
              if(state is Completed){
                Future.delayed(Duration.zero, () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Wrap(
                            children: [
                              Content(
                                padding: EdgeInsets.only(top: 5,bottom: 5),
                                text: 'Order is completed successfully',
                                fontSize: AppDimen.TEXT_SMALL,
                                fontWeight: FontWeight.w400,
                                fontfamily: AppFont.FONT,
                              ),
                            ],
                          )
                      )
                  );
                });
              }
              OrderViewModel.load1 = false;
              OrderViewModel.load2 = false;
              return buildView(false,false);
            }else{
              return Container();
            }
          },
        )
      ),
    );
  }

  Widget buildView(bool isLoading1,bool isLoading2){
    return ListView(
      children: [
        Stack(
          children: [
            ImageContainer(
              height: 300,
              width: double.infinity,
              radius: 0,
              url: 'https://images.unsplash.com/photo-1596394723269-b2cbca4e6313?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBsdW1iaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Content(
                                    alignment: Alignment.centerRight,
                                    text: '24',
                                    fontfamily: AppFont.FONT,
                                    color: AppColors.SUCCESS_COLOR_EXTRA_LIGHT,
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppDimen.TEXT_H4,
                                  ),
                                  Content(
                                    alignment: Alignment.centerRight,
                                    text: ' x ',
                                    fontfamily: AppFont.FONT,
                                    color: AppColors.WHITE,
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppDimen.TEXT_SMALL,
                                  ),
                                  Content(
                                    alignment: Alignment.centerRight,
                                    text: '7',
                                    fontfamily: AppFont.FONT,
                                    color: AppColors.SUCCESS_COLOR_EXTRA_LIGHT,
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppDimen.TEXT_H4,
                                  ),
                                  Content(
                                    padding: EdgeInsets.only(left: 10),
                                    alignment: Alignment.centerRight,
                                    text: 'Available',
                                    fontfamily: AppFont.FONT,
                                    color: AppColors.WHITE,
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppDimen.TEXT_SMALLEST,
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: BorderContainer(
                                radius: 20,
                                padding:
                                EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                borderColor: AppColors.WHITE,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      size: 18,
                                      color: AppColors.WHITE,
                                    ),
                                    Content(
                                      padding: EdgeInsets.only(left: 10),
                                      alignment: Alignment.centerRight,
                                      text: AppConstants.INSES_NUMBER,
                                      fontfamily: AppFont.FONT,
                                      color: AppColors.WHITE,
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppDimen.TEXT_SMALLEST,
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Content(
                    padding: EdgeInsets.only(top: 20,left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    fontfamily: AppFont.FONT,
                    textHeight: 1.5,
                    letterSpacing: 1,
                    text: OrderViewModel.booking.categoryName,
                    color: AppColors.WHITE,
                    fontWeight: FontWeight.w600,
                    fontSize: AppDimen.TEXT_H1,
                  ),
                  Content(
                    padding: EdgeInsets.only(top: 10,left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    fontfamily: AppFont.FONT,
                    textHeight: 1.5,
                    text: 'Get lowest prices for ${OrderViewModel.booking.categoryName} in Madurai',
                    color: AppColors.WHITE_1,
                    fontWeight: FontWeight.w400,
                    fontSize: AppDimen.TEXT_SMALL,
                  ),
                ],
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.only(top: 250,left: 10,right: 10),
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BorderContainer(
                          radius: 4,
                          padding: EdgeInsets.only(left: 5,right: 5,top: 8,bottom: 8),
                          bgColor: AppColors.SUCCESS_COLOR,
                          child: Content(
                            width: 80,
                            text: OrderViewModel.booking.status,
                            color: AppColors.WHITE,
                            fontfamily: AppFont.FONT,
                            fontSize: AppDimen.TEXT_MINI,
                            fontWeight: FontWeight.w500,
                          )
                      ),
                      Content(
                        color:AppColors.GRAY,
                        text: 'Service',
                        alignment: Alignment.centerLeft,
                        textHeight: 2,
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w400,
                        fontSize: AppDimen.TEXT_SMALLEST,
                      ),
                      Content(
                        alignment: Alignment.centerLeft,
                        textHeight: 1.5,
                        margin: EdgeInsets.only(top: 5),
                        color:AppColors.BLACK,
                        text: OrderViewModel.booking.name,
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLER,
                      ),
                      Content(
                        margin: EdgeInsets.only(top: 15),
                        color:AppColors.GRAY,
                        text: 'Service Date',
                        alignment: Alignment.centerLeft,
                        textHeight: 2,
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w400,
                        fontSize: AppDimen.TEXT_SMALLEST,
                      ),
                      Content(
                        alignment: Alignment.centerLeft,
                        textHeight: 1.5,
                        margin: EdgeInsets.only(top: 5),
                        color:AppColors.BLACK,
                        text: OrderViewModel.booking.date,
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLER,
                      ),
                      Content(
                        margin: EdgeInsets.only(top: 15),
                        color:AppColors.GRAY,
                        text: 'Address',
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLEST,
                        alignment: Alignment.centerLeft,
                        textHeight: 2,
                      ),
                      Content(
                        color:AppColors.BLACK,
                        margin: EdgeInsets.only(top: 5),
                        text: OrderViewModel.booking.address,
                        overflow: TextOverflow.ellipsis,
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLER,
                        alignment: Alignment.centerLeft,
                        textHeight: 1.5,
                      ),
                      Content(
                        margin: EdgeInsets.only(top: 15),
                        color:AppColors.GRAY,
                        text: 'Amount',
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLEST,
                        alignment: Alignment.centerLeft,
                        textHeight: 2,
                      ),
                      Content(
                        color:AppColors.BLACK,
                        text: '\u20B9 ${OrderViewModel.booking.totalPrice}',
                        margin: EdgeInsets.only(top: 5),
                        overflow: TextOverflow.ellipsis,
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLER,
                        alignment: Alignment.centerLeft,
                        textHeight: 1.5,
                      ),
                      Content(
                        margin: EdgeInsets.only(top: 15),
                        color:AppColors.GRAY,
                        text: 'Payment Type',
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLEST,
                        alignment: Alignment.centerLeft,
                        textHeight: 2,
                      ),
                      Content(
                        color:AppColors.BLACK,
                        margin: EdgeInsets.only(top: 5),
                        text: OrderViewModel.booking.payMethod,
                        overflow: TextOverflow.ellipsis,
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLER,
                        alignment: Alignment.centerLeft,
                        textHeight: 1.5,
                      ),
                      Visibility(
                        visible: OrderViewModel.booking.status=='PENDING',
                        child: BorderContainer(
                            radius: 4,
                            margin: EdgeInsets.only(left: 15,right: 15,top: 30),
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            bgColor: AppColors.SECONDARY_COLOR,
                            child: OnTapField(
                              child: isLoading1
                                  ?Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Loader(margin: EdgeInsets.all(0),)
                                ],
                              )
                                  :Content(
                                padding: EdgeInsets.only(top: 10,bottom: 10),
                                text: 'APPROVE ORDER',
                                color: AppColors.WHITE,
                                fontfamily: AppFont.FONT,
                                fontSize: AppDimen.TEXT_SMALL,
                                fontWeight: FontWeight.w400,
                              ),
                              onTap: (){
                                OrderViewModel.load1 = true;
                                  bloc.add(ApproveOrder(categoryId: OrderViewModel.booking.id));
                              },
                            )
                        )
                      ),
                      Visibility(
                        visible: OrderViewModel.booking.status=='APPROVED',
                        child: BorderContainer(
                            radius: 4,
                            margin: EdgeInsets.only(left: 15,right: 15,top: 30),
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            bgColor: AppColors.SECONDARY_COLOR,
                            child: OnTapField(
                              child: isLoading1
                                  ?Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Loader(margin: EdgeInsets.all(0),)
                                ],
                              )
                                  :Content(
                                padding: EdgeInsets.only(top: 10,bottom: 10),
                                text: 'ORDER COMPLETED',
                                color: AppColors.WHITE,
                                fontfamily: AppFont.FONT,
                                fontSize: AppDimen.TEXT_SMALL,
                                fontWeight: FontWeight.w400,
                              ),
                              onTap: (){
                                OrderViewModel.load1 = true;
                                 bloc.add(CompleteOrder(categoryId: OrderViewModel.booking.id));
                              },
                            )
                        )
                      ),
                      Visibility(
                          visible: OrderViewModel.booking.payStatus=='PENDING',
                          child:
                          BorderContainer(
                              radius: 4,
                              margin: EdgeInsets.only(left: 15,right: 15,top: 30),
                              padding: EdgeInsets.only(top: 5,bottom: 5),
                              bgColor: AppColors.SECONDARY_COLOR,
                              child: OnTapField(
                                child: isLoading2
                                    ?Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Loader(margin: EdgeInsets.all(0),)
                                  ],
                                )
                                    :Content(
                                  padding: EdgeInsets.only(top: 10,bottom: 10),
                                  text: 'UPDATE',
                                  color: AppColors.WHITE,
                                  fontfamily: AppFont.FONT,
                                  fontSize: AppDimen.TEXT_SMALL,
                                  fontWeight: FontWeight.w400,
                                ),
                                onTap: (){
                                  OrderViewModel.load2 = true;
                                  bloc.add(UpdatePaymentStatus(orderId:OrderViewModel.orderId,paymentId: '',method: 'CASH'));
                                },
                              )
                          )
                      )
                    ],
                  )
              ),
            )
          ],
        ),
      ],
    );
  }
}
