part of 'play_back_bloc.dart';

class PlayBackState extends Equatable {
  PlayBackState() {
    _audioPlayer.setAudioSource(ConcatenatingAudioSource(children: playList),
        initialIndex: 0, initialPosition: Duration.zero);
  }

  final _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  Stream<Duration> get positionStream => _audioPlayer.positionStream;

  Stream<Duration> get bufferedPositionStream =>
      _audioPlayer.bufferedPositionStream;

  Stream<Duration?> get durationStream => _audioPlayer.durationStream;

  Stream<PlayerState> get playerStateStream => _audioPlayer.playerStateStream;

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        positionStream,
        bufferedPositionStream,
        durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  Stream<bool> get shuffleModeEnabledStream =>
      _audioPlayer.shuffleModeEnabledStream;

  Stream<SequenceState?> get sequenceStateStream =>
      _audioPlayer.sequenceStateStream;

  Stream<LoopMode> get loopModeStream => _audioPlayer.loopModeStream;

  get hasPrevious => _audioPlayer.hasPrevious;

  get hasNext => _audioPlayer.hasNext;

  get playing => _audioPlayer.playing;

  get doPlay async => await _audioPlayer.play();

  get doPause async => await _audioPlayer.pause();

  get doStop async => await _audioPlayer.stop();

  get doReplay async => await _audioPlayer.seek(Duration.zero, index: 0);

  get doSkipToNext async => await _audioPlayer.seekToNext();

  get doSkipToPrevious async => await _audioPlayer.seekToPrevious();

  get doShuffle async => await _audioPlayer.shuffle();

  setShuffleMode(bool enable) async =>
      await _audioPlayer.setShuffleModeEnabled(enable);

  setLoopMode(LoopMode loopMode) async =>
      await _audioPlayer.setLoopMode(loopMode);

  @override
  List<Object?> get props => throw UnimplementedError();
}
