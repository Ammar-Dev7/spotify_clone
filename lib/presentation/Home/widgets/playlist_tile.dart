import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/widgets/play_button.dart';
import 'package:spotify/domain/entities/song_entity.dart';

import '../../../core/widgets/text_style.dart';
import '../../detail_song/pages/play_song.dart';
class PlaylistTile extends StatelessWidget {
   PlaylistTile({super.key,required this.title,required this.subTitle,required this.releaseDate,required this.song});
   SongEntity song;
   final String title ;
   final String subTitle ;
   final String releaseDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(song: song)));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [PlayButton(
            onPressed: (){},
              redius: 23,),
            Container(
                width: 200,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.fade,
                      title,style: MyTextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.secondary,
                    ),),
                    SizedBox(height: 5.h,),
                    Text(
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.fade,
                      subTitle,style: MyTextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary,
                    ),)
                  ]
                ),
              ),
            Text(
              maxLines: 1,
              textAlign: TextAlign.left,
              overflow: TextOverflow.fade,
              releaseDate,style: MyTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.secondary.withAlpha(200),
            ),),
            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart,color: Theme.of(context).colorScheme.onPrimary,))
          ]
        ),
      ),
    );
  }
}
