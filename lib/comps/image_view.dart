import 'dart:io';

import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String? url;
  final String? asset;
  final double? width;
  final double? height;
  final String? path;
  final bool? isShadow;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Color? bgColor;

  ImageView(
      {this.url,
      this.asset,
      required this.width,
      this.height,
      this.isShadow,
      this.path,
      this.margin,
      this.padding,
      this.alignment,
      this.bgColor});

  @override
  Widget build(BuildContext context) {

    var link = url;
    if(url!=null && url!.contains("http://13.233.244.254/")){
      link = url!.replaceFirst("http://13.233.244.254/", "http://13.126.156.101/");
    }

    return Container(
        margin: margin,
        padding: padding,
        alignment: alignment,
        width: 150,
        child: Image(
          image: link != null
              ? NetworkImage(link)
              : path != null
                  ? FileImage(File(path!))
                  : AssetImage('assets/images/' + asset!) as ImageProvider<Object>,
          height: height,
          fit: BoxFit.cover,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: isShadow != null && isShadow!
                  ? Color(0x19000000)
                  : Colors.transparent,
            ),
          ],
        ));
  }
}
