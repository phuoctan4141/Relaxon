part of 'play_back_bloc.dart';

@immutable
abstract class PlayBackEvent {
  const PlayBackEvent();
}

class PlayBackPlay extends PlayBackEvent {
  const PlayBackPlay();
}

class PlayBackPause extends PlayBackEvent {
  const PlayBackPause();
}

class PlayBackStop extends PlayBackEvent {
  const PlayBackStop();
}

class PlayBackReplay extends PlayBackEvent {
  const PlayBackReplay();
}

class PlayBackSkipToNext extends PlayBackEvent {
  const PlayBackSkipToNext();
}

class PlayBackSkipToPrevious extends PlayBackEvent {
  const PlayBackSkipToPrevious();
}

class PlayBackShuffle extends PlayBackEvent {
  const PlayBackShuffle(this.enable);

  final bool enable;
}

class PlayBackSeek extends PlayBackEvent {
  const PlayBackSeek(this.position);

  final Duration position;
}

class PlayBackSetVolume extends PlayBackEvent {
  const PlayBackSetVolume(this.volume);

  final double volume;
}

class PlayBackSetShuffleMode extends PlayBackEvent {
  const PlayBackSetShuffleMode(this.shuffleMode);

  final ShuffleOrder shuffleMode;
}

class PlayBackSetLoopMode extends PlayBackEvent {
  const PlayBackSetLoopMode(this.loopMode);

  final LoopMode loopMode;
}
