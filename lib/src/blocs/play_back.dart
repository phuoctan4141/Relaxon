// ignore_for_file: override_on_non_overriding_member, unnecessary_late, unused_element, prefer_final_fields

import 'package:audio_session/audio_session.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';

import 'package:relaxon/src/models/position_data.dart';

class PlayBack extends ChangeNotifier {
  static final PlayBack instance = PlayBack();

  final _audioPlayer = AudioPlayer();

  List<AudioSource> playlist = [
    AudioSource.asset(
      'assets/audios/reflected-light-147979.mp3',
      tag: MediaItem(
        id: "https://pixabay.com/music/beautiful-plays-reflected-light-147979/",
        title: "Reflected Light",
        artist: "SergePavkinMusic",
        artUri: Uri.parse(
            "https://cdn.pixabay.com/audio/2023/04/29/06-36-55-462_200x200.jpg"),
      ),
    ),
    AudioSource.asset(
      'assets/audios/eco-technology-145636.mp3',
      tag: MediaItem(
        id: "https://pixabay.com/music/beautiful-plays-eco-technology-145636/",
        title: "Eco Technology",
        artist: "Lexin Music",
        artUri: Uri.parse(
            "https://cdn.pixabay.com/audio/2023/04/08/15-11-40-213_200x200.jpg"),
      ),
    ),
    AudioSource.asset(
      'assets/audios/the-cradle-of-your-soul-15700.mp3',
      tag: MediaItem(
        id: 'https://pixabay.com/music/solo-guitar-the-cradle-of-your-soul-15700/',
        title: "The Cradle of Your Soul",
        artist: "Vitaliy Levkin",
        artUri: Uri.parse(
            "https://cdn.pixabay.com/audio/2022/04/06/06-57-42-712_200x200.png"),
      ),
    ),
    AudioSource.asset(
      'assets/audios/touch-and-sound-113676.mp3',
      tag: MediaItem(
        id: 'https://pixabay.com/music/modern-classical-touch-and-sound-113676/',
        title: "Touch and Sound",
        artist: "Juan Sanchez",
        artUri: Uri.parse(
            "https://cdn.pixabay.com/audio/2022/06/21/09-28-47-489_200x200.jpg"),
      ),
    ),
    AudioSource.asset(
      'assets/audios/weeknds-122592.mp3',
      tag: MediaItem(
        id: 'https://pixabay.com/music/beats-weeknds-122592/',
        title: "Weeknds",
        artist: "DayFox",
        artUri: Uri.parse(
            "https://cdn.pixabay.com/audio/2022/10/12/09-28-04-865_200x200.jpg"),
      ),
    ),
    AudioSource.asset(
      'assets/audios/cinematic-documentary-piano-141467.mp3',
      tag: MediaItem(
        id: 'https://pixabay.com/music/modern-classical-cinematic-documentary-piano-141467/',
        title: "Cinematic Documentary Piano",
        artist: "Dmitrii Kolesnikov",
        artUri: Uri.parse(
            "https://cdn.pixabay.com/audio/2023/03/04/09-59-51-790_200x200.jpg"),
      ),
    ),
  ];

  AudioPlayer get audioPlayer => _audioPlayer;

  Stream<Duration> get positionStream => _audioPlayer.positionStream;

  Stream<Duration> get bufferedPositionStream =>
      _audioPlayer.bufferedPositionStream;

  Stream<Duration?> get durationStream => _audioPlayer.durationStream;

  Stream<PlayerState> get playerStateStream => _audioPlayer.playerStateStream;

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          PlayBack.instance.positionStream,
          PlayBack.instance.bufferedPositionStream,
          PlayBack.instance.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  static Future<void> initial() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.phuoctan4141.relaxon.audio',
      androidNotificationChannelName: 'Relaxon Audio Player',
      androidNotificationOngoing: true,
    );
    await instance.setPlayList();
  }

  Future<void> setPlayList() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _playlist = ConcatenatingAudioSource(
      // Start loading next item just before reaching it
      useLazyPreparation: true,
      // Customise the shuffle algorithm
      shuffleOrder: DefaultShuffleOrder(),
      // Specify the playlist items
      children: instance.playlist,
    );

    await _audioPlayer.setAudioSource(_playlist,
        initialIndex: 0, initialPosition: Duration.zero);
  }

  void addPlaylist(String path, {String? tag}) {
    playlist.add(AudioSource.uri(Uri.parse(path), tag: tag));
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void seekN() {
    _audioPlayer.seek;
  }

  void setAsset(assetPath) {
    _audioPlayer.setAsset(assetPath);
  }

  void skipNext() {
    _audioPlayer.seekToNext();
  }

  void skipPrevious() {
    _audioPlayer.seekToPrevious();
  }

  @override
  void doPlay() {
    PlayBack.instance.play();
    notifyListeners();
  }

  @override
  void doPause() {
    PlayBack.instance.pause();
    notifyListeners();
  }

  @override
  void doStop() {
    PlayBack.instance.stop();
    notifyListeners();
  }

  @override
  void doSeek(value) {
    PlayBack.instance.seek(value);
    notifyListeners();
  }

  @override
  void doSeekN() {
    PlayBack.instance.seekN();
    notifyListeners();
  }

  @override
  void setAssetAudio(assetPath) {
    PlayBack.instance.setAsset(assetPath);
    notifyListeners();
  }

  @override
  void doSkipNext() {
    PlayBack.instance.skipNext();
    notifyListeners();
  }

  @override
  void doSkipPrevious() {
    PlayBack.instance.skipPrevious();
    notifyListeners();
  }
}

bool checkFileExtension(String fileExtention) {
  if (fileExtention == ".m4a" || fileExtention == ".mp3") return true;
  return false;
}
