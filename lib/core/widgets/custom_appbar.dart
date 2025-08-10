import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/widgets/back_btn.dart';
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppbar({super.key ,this.title,this.btn=false,this.action,this.colorBg=false});
  final Widget? title;
  final bool btn;
  final Widget? action;
  final bool colorBg;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [?action],
      elevation: 0,
      centerTitle: true,
      leadingWidth: 53.w,
      surfaceTintColor: Colors.transparent,
      backgroundColor:colorBg?Theme.of(context).colorScheme.onPrimary.withAlpha(100): Colors.transparent,

      title: title,
      leading: btn?Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BackBtn(),
        ],
      ):SizedBox(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(38.h);
  
}
