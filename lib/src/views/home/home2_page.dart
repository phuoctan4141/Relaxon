// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass/glass.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:relaxon/src/blocs/play_back/bloc/play_back_bloc.dart';
import 'package:relaxon/src/views/one/one_page.dart';
import 'package:relaxon/src/views/three/three_page.dart';
import 'package:relaxon/src/views/two/two_page.dart';
import 'package:relaxon/src/views/widgets/player_buttons_bloc.dart';
import 'package:snap_view/snap_view.dart';

class Home2Page extends StatefulWidget {
  const Home2Page({super.key});

  @override
  State<Home2Page> createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SnapView(
          pages: [
            _OnePage(context),
            _TwoPage(context),
            _ThreePage(context),
          ],
        ),
        _buildContent(context),
      ]),
    );
  }

  _OnePage(BuildContext context) {
    return const OnePage();
  }

  _TwoPage(BuildContext context) {
    return const TwoPage();
  }

  _ThreePage(BuildContext context) {
    return const ThreePage();
  }

  _buildContent(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Glass(
        alignment: Alignment.center,
        width: 300,
        height: 500,
        color: Colors.blueGrey.withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PlayerContent(context),
            _PlayerButtons(context),
          ],
        ),
      ),
    );
  }

  _PlayerContent(BuildContext context) {
    late String currentSongTitle = '';
    late String currentSongArtist = '';

    return BlocConsumer<PlayBackBloc, PlayBackState>(
      listener: (context, state) {},
      builder: (context, state) {
        return StreamBuilder<SequenceState?>(
            stream: state.sequenceStateStream,
            builder: (_, sequenceState) {
              // update current song title
              final currentItem = sequenceState.data?.currentSource;
              final tag = currentItem?.tag as MediaItem?;
              currentSongTitle = tag?.title ?? '';
              currentSongArtist = tag?.artist ?? '';

              return Column(
                children: [
                  Text(
                    currentSongTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    currentSongArtist,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            });
      },
    );
  }

  _PlayerButtons(BuildContext context) {
    // ignore: prefer_const_constructors
    return PlayerButtonsBloc();
  }
}
