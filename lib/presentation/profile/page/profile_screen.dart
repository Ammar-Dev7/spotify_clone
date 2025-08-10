import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/domain/usecases/get_song_usecase.dart';
import 'package:spotify/presentation/Home/bloc/song_bloc.dart';
import 'package:spotify/presentation/Home/bloc/song_event.dart';
import 'package:spotify/presentation/Home/bloc/song_state.dart';
import 'package:spotify/presentation/detail_song/pages/play_song.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/text_style.dart';
import '../../../service_locator.dart';
import '../../Home/widgets/playlist_tile.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SongBloc(
      getSongUseCase: GetSongUseCase(songRepository: sl()))..add(GettingSongsEvent()),
  child: Scaffold(
      appBar: CustomAppbar(
        colorBg: true,
        title: Text('Profile',style: MyTextStyle(
          color: Theme.of(context).colorScheme.secondary,fontSize: 22,fontWeight: FontWeight.w600
        )),
        btn: true,
        action: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.settings,color: Theme.of(context).colorScheme.secondary,size: 30.sp,),
              onPressed: (){},
            ),
            SizedBox(width: 8.w,)
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(100),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.w,
                  backgroundColor: Theme.of(context).canvasColor,
                  child: Icon(Icons.person,size: 60,color: Theme.of(context).colorScheme.secondary,),
                ),
                SizedBox(height: 20.h),
                Text('Muhammad Ammar',style: MyTextStyle(
                  color: Theme.of(context).colorScheme.secondary,fontSize: 22,fontWeight: FontWeight.w600
                )),
                Text('ammarop007@gmail.com',style: MyTextStyle(
                  color: Theme.of(context).colorScheme.secondary,fontSize: 15,fontWeight: FontWeight.w500

                )),
                SizedBox(height: 20.h),
              ]
            ),
          ),SizedBox(height: 20.h),
          Text('Public Playlists',style: MyTextStyle(
              color: Theme.of(context).colorScheme.secondary,fontSize: 24,fontWeight: FontWeight.w600
          )),
          BlocBuilder<SongBloc, SongState>(
  builder: (context, state) {
    if (state.isLoading) {
      return Center(child: Center(child: CircularProgressIndicator(color: AppColors.primary,)),);}
      else if(state.songs.isEmpty){
        return Center(child: Text('No Playlist Found',style: MyTextStyle(
          color: Theme.of(context).colorScheme.secondary,fontSize: 22,fontWeight: FontWeight.w600
        )),);
    } else {
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
          child: ListView.builder(
            itemCount: state.songs.length,
            itemBuilder: (context, index) {
              final song = state.songs[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, 
                      (MaterialPageRoute(builder: (context)=>DetailScreen(song: song))));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(state.songs[index].coverUrl,height: 80.h,)),
                
                      Container(
                        width: 135.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.songs[index].title,style: MyTextStyle(
                              color: Theme.of(context).colorScheme.tertiary,fontSize: 16,fontWeight: FontWeight.w700
                            )),
                            SizedBox(height: 7.h,),
                            Text(state.songs[index].artist,style: MyTextStyle(
                              color: Theme.of(context).colorScheme.tertiary,fontSize: 15,fontWeight: FontWeight.w400
                            )),
                          ],
                        ),
                      ),
                      Container(width: 4.w,),
                      Text(state.songs[index].duration,style: MyTextStyle(
                          color: Theme.of(context).colorScheme.tertiary,fontSize: 15,fontWeight: FontWeight.w400
                      )),
                      Icon(Icons.more_horiz,color: Theme.of(context).colorScheme.tertiary,)
                
                    ],
                  ),
                ),
              );
            }
          ),
        )
      );
    }
  },
),
          SizedBox(height: 20.h)
        ],
      ),
    ),
);
  }
}


