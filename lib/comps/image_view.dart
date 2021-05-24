import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String url;
  final String asset;
  final double width;
  final double height;
  final bool isShadow;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final Color bgColor;

  ImageView(
      {this.url,
      this.asset,
      @required this.width,
      this.height,
      this.isShadow,
      this.margin,
      this.padding,
      this.alignment,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        padding: padding,
        width: width,
        child: Image(
          image: url != null ? NetworkImage(url) : AssetImage('assets/images/'+asset),
          height: height,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: isShadow != null && isShadow
                  ? Color(0x19000000)
                  : Colors.transparent,
            ),
          ],
        ));
  }
}
