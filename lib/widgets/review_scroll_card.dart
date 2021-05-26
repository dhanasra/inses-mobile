import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/elevated_button.dart';
import 'package:inses_app/comps/image_container.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/comps/tap_field.dart';
import 'package:inses_app/comps/two_wave_clipper.dart';
import 'package:inses_app/model/offer.dart';
import 'package:inses_app/model/review.dart';
import 'package:inses_app/model/service.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ReviewScrollCard extends StatefulWidget {

  @override
  _ReviewScrollCardState createState() => _ReviewScrollCardState();
}

class _ReviewScrollCardState extends State<ReviewScrollCard> {
  int _currentPage = 0;
  PageController _pageController;

  List<ReviewModel> scrolls;

  @override
  void initState() {
    super.initState();
    scrolls = [
      ReviewModel(
          name:'Harishkumar',
          img: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
          date: 'May 23, 2021',
        review: 'Timely service. Both service and service charge are satisfied.',
        stars: 5
      ),
      ReviewModel(
          name:'Faumitha',
          img: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
          date: 'May 19, 2021',
          review: 'Service was too gud.. I loved it.. definitely I will refer my frnds',
          stars: 5
      ),
      ReviewModel(
          name:'Sandhya Jaganath',
          img: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
          date: 'May 16, 2021',
          review: 'Service was excellent and pricing for the service is genuine. On time delivery of the product. Team is very supportive',
          stars: 5
      ),
      ReviewModel(
          name:'Nandita Vaishali',
          img: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
          date: 'May 12, 2021',
          review: 'Excellent on-time service and promising!',
          stars: 5
      ),
      ReviewModel(
          name:'Balaji kr',
          img: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
          date: 'May 8, 2021',
          review: 'Very innovative way of service and unique approach in the market. Punctual and cost effective services.',
          stars: 5
      )
    ];
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              width: 500,
              height: 250,
              child: Stack(
                children: [
                  PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      itemCount: scrolls.length,
                      itemBuilder: (context,index) {
                        return pageItem(
                            review: scrolls[index]
                        );
                      }
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: OnTapField(
                        child: BorderContainer(
                          radius: 100,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(3),
                          bgColor: AppColors.WHITE,
                          child: Icon(Icons.arrow_left),
                        ),
                        onTap: (){
                          if (_currentPage < scrolls.length-1) {
                            _currentPage++;
                          } else {
                            _currentPage = 0;
                          }
                          _pageController.jumpToPage(_currentPage);
                        },
                      )
                    )
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                        child: OnTapField(
                          onTap: (){
                            if (_currentPage >0) {
                              _currentPage--;
                            } else {
                              _currentPage = scrolls.length;
                            }
                            _pageController.jumpToPage(_currentPage);
                          },
                          child: BorderContainer(
                            radius: 100,
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(3),
                            bgColor: AppColors.WHITE,
                            child: Icon(Icons.arrow_right),
                          ),
                        )
                      )
                  )
                ],
              )
    );
  }

  Widget pageItem({ReviewModel review}) {
    return OnTapField(
        child: Container(
            color: AppColors.WHITE_1,
            padding: EdgeInsets.all(10),
            height: 200,
            child: Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageContainer(
                              height: 50,
                              width: 50,
                              url: review.img,
                              radius: 100,
                            ),
                            Expanded(
                                child: Column(
                                  children: [
                                    Content(
                                      padding: EdgeInsets.only(left: 20),
                                      alignment: Alignment.centerLeft,
                                      text:review.name,
                                      fontfamily: AppFont.FONT,
                                      color: AppColors.BLACK,
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppDimen.TEXT_SMALL,
                                    ),
                                    Content(
                                      padding: EdgeInsets.only(left: 20,top: 10),
                                      alignment: Alignment.centerLeft,
                                      text:review.date,
                                      fontfamily: AppFont.FONT,
                                      color: AppColors.GRAY,
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppDimen.TEXT_SMALLEST,
                                    ),
                                  ],
                                )
                            ),
                            Container(
                              child: RatingBarIndicator(
                                rating: 5,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: AppColors.PRIMARY_COLOR,
                                ),
                                itemCount: 5,
                                itemSize: 15.0,
                                direction: Axis.horizontal,
                              ),
                            )
                          ],
                        ),
                      ),
                      Content(
                        padding: EdgeInsets.only(left: 50,right: 50),
                        alignment: Alignment.centerLeft,
                        text:"\" ${review.review} \"",
                        textHeight: 2,
                        fontfamily: AppFont.FONT,
                        color: AppColors.BLACK,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALL,
                      ),
                    ],
                  ),
                )
            ),
        onTap: (){

        });
  }
}
