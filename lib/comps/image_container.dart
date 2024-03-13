import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final Widget? child;
  final Color? bgColor;
  final Color? borderColor;
  final double? radius;
  final String? url;
  final double? width;
  final double? height;
  final String? asset;
  final bool? isShadow;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  ImageContainer(
      {this.child,
      this.bgColor,
      this.asset,
      this.width,
      this.height,
      this.url,
      this.borderColor,
      this.radius,
      this.isShadow,
      this.margin,
      this.padding});

  @override
  Widget build(BuildContext context) {

    var link = url;
    if(url!=null && url!.contains("http://13.233.244.254/")){
      link = url!.replaceFirst("http://13.233.244.254/", "http://13.126.156.101/");
    }

    return Container(
        child: child,
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius??0),
          image: link != null 
          ? DecorationImage(
            colorFilter: new ColorFilter.mode(
                bgColor??Colors.white, BlendMode.dstATop),
            image:  NetworkImage(link),
            fit: BoxFit.cover,
          )
          : DecorationImage(
            colorFilter: new ColorFilter.mode(
                bgColor??Colors.white, BlendMode.dstATop),
            image: AssetImage('assets/images/'+asset!),
            fit: BoxFit.cover,
          ),
        ));
  }
}
