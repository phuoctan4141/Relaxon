// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:relaxon/src/blocs/play_back.dart';
import 'package:relaxon/src/views/one/one_page.dart';
import 'package:relaxon/src/views/three/three_page.dart';
import 'package:relaxon/src/views/two/two_page.dart';
import 'package:relaxon/src/views/widgets/player_buttons.dart';
import 'package:snap_view/snap_view.dart';

ValueNotifier<String> currentSongTitleNotifier = ValueNotifier<String>('');
ValueNotifier<String> currentSongArtistNotifier = ValueNotifier<String>('');

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _listenForChangesInSequenceState();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SnapView(
            pages: [
              _OnePage(context),
              _TwoPage(context),
              _ThreePage(context),
            ],
          ),
          _buildContent(context),
        ],
      ),
    );
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
            _CurrentSongTitle(context),
            _CurrentSongArtist(context),
            PlayerButtons(PlayBack.instance.audioPlayer),
          ],
        ),
      ),
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

  _CurrentSongTitle(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: currentSongTitleNotifier,
      builder: (_, title, __) {
        return Text(
          currentSongTitleNotifier.value,
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
    );
  }

  _CurrentSongArtist(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: currentSongArtistNotifier,
      builder: (_, artist, __) {
        return Text(
          currentSongArtistNotifier.value,
          style: Theme.of(context).textTheme.bodyMedium,
        );
      },
    );
  }

  void _listenForChangesInSequenceState() {
    PlayBack.instance.audioPlayer.sequenceStateStream.listen((sequenceState) {
      if (sequenceState == null) return;

      // update current song title
      final currentItem = sequenceState.currentSource;
      final tag = currentItem?.tag as MediaItem;
      currentSongTitleNotifier.value = tag.title;
      currentSongArtistNotifier.value = tag.artist ?? '';
    });
  }
}
