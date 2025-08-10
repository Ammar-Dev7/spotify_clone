import 'package:flutter/material.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/songModel.dart';
import 'package:spotify/domain/entities/song_entity.dart';
import 'package:spotify/domain/usecases/get_song_usecase.dart';
import 'package:spotify/presentation/Home/widgets/get_songs_page.dart';
import '../../../service_locator.dart';

class TabView extends StatefulWidget {
  final TabController controller;
  const TabView({super.key, required this.controller});

  @override
  State<TabView> createState() => _TabBarViewState();
}


class _TabBarViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.controller,
      children: [
        GetSongsPage(),

        const Center(child: Text("Tab 2")),
        const Center(child: Text("Tab 3")),
        const Center(child: Text("Tab 4")),
      ],
    );
  }
}
