import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/widgets/custom_appbar.dart';
import 'package:spotify/presentation/Home/widgets/tab_list.dart';
import 'package:spotify/presentation/profile/page/profile_screen.dart';

import '../widgets/tab_bar_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;
@override
  void initState() {
  controller = TabController(length: 4, vsync: this);
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar:   CustomAppbar(
        action:  Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: (){
                Navigator.push(context,
                    (MaterialPageRoute(builder: (context)=>ProfileScreen())));
              }, icon: Icon(FontAwesomeIcons.user,size: 27.w,),
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
            ),
            SizedBox(width: 10.w,)
          ],
        ),
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 35.h,
          width: 35.w,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Image.asset(
                                    width: ScreenUtil().screenWidth-35.w,
                                    AppImages.homeFrame, fit: BoxFit.fitWidth),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  AppImages.homeTop,
                                  fit: BoxFit.fitWidth,
                                  width: 355.w,
                                  height: 145.h,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                   TabList(controller: controller), // Your TabBar
                ],
              ),
            ),
          ];
        },
         body: TabView(controller: controller), // Your TabBarView
      ),
    );
  }
 }