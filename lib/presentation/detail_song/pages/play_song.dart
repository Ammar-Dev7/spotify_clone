import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/core/widgets/custom_appbar.dart';
import 'package:spotify/core/widgets/text_style.dart';
import 'package:spotify/domain/entities/song_entity.dart';
import 'package:spotify/presentation/detail_song/bloc/play_bloc.dart';
import 'package:spotify/presentation/detail_song/bloc/play_event.dart';
import 'package:spotify/presentation/detail_song/bloc/play_state.dart';
class DetailScreen extends StatelessWidget {
  final SongEntity song;
  const DetailScreen({super.key, required this.song});

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayBloc(audioPlayer:AudioPlayer())..add(PlaySong(song.audioUrl)), // start playback immediately
      child: BlocBuilder<PlayBloc, PlayState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppbar(
              btn: true,
                title:  Text('Now Playing',style: MyTextStyle(
              color: Theme.of(context).colorScheme.secondary,fontSize: 22,fontWeight: FontWeight.w600
            ))),
            body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(song.coverUrl, fit: BoxFit.cover,width: ScreenUtil().screenWidth,),
                  ),
                  const SizedBox(height: 20),
                  Text(song.title, style: MyTextStyle(
                        color: Theme.of(context).colorScheme.secondary,fontSize: 22,fontWeight: FontWeight.w600
                        )),
                  Text(song.artist, style:MyTextStyle(
                        color: Theme.of(context).colorScheme.secondary,fontSize: 15,fontWeight: FontWeight.w500
                        )),
                   SizedBox(height: 20.h), Column(children: [Slider(
              activeColor: Theme.of(context).colorScheme.onPrimary.withAlpha(450) ,
              thumbColor: Theme.of(context).colorScheme.onPrimary.withAlpha(450) ,
              inactiveColor: Theme.of(context).colorScheme.onPrimary.withAlpha(50),
              value: state.position.inSeconds.toDouble(),
                        max: state.duration.inSeconds.toDouble(),
                        onChanged: (value) {
                        context.read<PlayBloc>().audioPlayer.seek(
                        Duration(seconds: value.toInt()),);},),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.h),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(_formatDuration(state.position),style: MyTextStyle(
                          color: Theme.of(context).colorScheme.secondary,fontSize: 15,fontWeight: FontWeight.w400
                          )),
                          Text(_formatDuration(state.duration),style: MyTextStyle(
                          color: Theme.of(context).colorScheme.secondary,fontSize: 15,fontWeight: FontWeight.w400
                          )),
                          ],),),],),
                  SizedBox(height: 20.h),
                  Center(
                    child: IconButton(
                      icon: Icon(
                        state.isPlaying ? Icons.pause_circle : Icons.play_circle,color: AppColors.primary,),
                      color: Theme.of(context).primaryColor,
                      iconSize: 95.w,
                      onPressed: () {
                        if (state.isPlaying) {
                          context.read<PlayBloc>().add(PauseSong());
                        }
                        if (!state.isPlaying) {
                          context.read<PlayBloc>().add(ResumeSong());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

