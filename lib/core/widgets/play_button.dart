import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayButton extends StatelessWidget {
   PlayButton({super.key,required this.onPressed, this.redius=18});
   VoidCallback onPressed;
   double redius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
        ),
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: CircleAvatar(
              backgroundColor:Theme.of(context).colorScheme.onSurface,
              radius: redius.h,
              child: IconButton(
                icon: Icon(FontAwesomeIcons.play
                  ,color: Theme.of(context).colorScheme.onPrimary.withAlpha(480),
                  applyTextScaling: true,size: redius-3.h,),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );

  }
}
