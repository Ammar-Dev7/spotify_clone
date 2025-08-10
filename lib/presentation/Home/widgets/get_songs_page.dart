import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/core/widgets/play_button.dart';
import 'package:spotify/core/widgets/text_style.dart';
import 'package:spotify/presentation/Home/bloc/song_bloc.dart';
import 'package:spotify/presentation/Home/bloc/song_event.dart';
import 'package:spotify/presentation/Home/bloc/song_state.dart';
import 'package:spotify/presentation/Home/widgets/playlist_tile.dart';
import 'package:spotify/presentation/detail_song/pages/play_song.dart';
import '../../../domain/entities/song_entity.dart';
import '../../../service_locator.dart';

class GetSongsPage extends StatelessWidget {
  const GetSongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SongBloc>()..add(GettingSongsEvent()),
      child: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());}
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.songs.length,
                      itemBuilder: (context, index) {
                        final SongEntity song = state.songs[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(song: song),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 23.w),
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 14.h),
                                      height: 220.h,
                                      width: 160.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(28),
                                        child: Image.network(song.coverUrl, fit: BoxFit.fill),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 7.w,
                                      child: PlayButton(onPressed: () {}),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      song.title,
                                      style: MyTextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).colorScheme.secondary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 3.h),
                                    Text(
                                      song.artist,
                                      style: MyTextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).colorScheme.secondary,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Playlist",
                        style: MyTextStyle(
                          fontSize: 21,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "See More",
                        style: MyTextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  ListView.builder(
                    itemCount: state.songs.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final song = state.songs[index];
                      return PlaylistTile(
                        song: song,
                        title: song.title,
                        subTitle: song.artist,
                        releaseDate: song.duration,
                      );
                    },
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
