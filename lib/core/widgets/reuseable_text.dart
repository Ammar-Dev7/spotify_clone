import "package:flutter/material.dart";

class ReuseableText extends StatelessWidget {
   ReuseableText({super.key, this.text,  this.style});
   final  text;
   final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.left,
      style: style,
      overflow: TextOverflow.fade,
      maxLines: 1,
    );
  }
}
