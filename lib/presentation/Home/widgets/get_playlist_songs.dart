import 'package:flutter/material.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/domain/usecases/get_song_usecase.dart';
import 'package:spotify/presentation/Home/widgets/playlist_tile.dart';

import '../../../service_locator.dart';
class GetPlaylistSongs extends StatelessWidget {
  const GetPlaylistSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: sl<GetSongUseCase>().call(NoParams()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong."));
          } else if (snapshot.hasData) {
            final result = snapshot.data!;
            return result.fold(
                  (failure) => Center(child: Text(failure.message)),
                    (songs) => Text("hello")
            );
          } else {
            return const Center(child: Text("No data."));
          }
        });}

}
