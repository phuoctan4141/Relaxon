import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:relaxon/src/blocs/play_back/bloc/play_back_bloc.dart';

class PlayerButtonsBloc extends StatelessWidget {
  const PlayerButtonsBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayBackBloc, PlayBackState>(
      bloc: BlocProvider.of<PlayBackBloc>(context),
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Shuffle button
            StreamBuilder<bool>(
              stream: state.shuffleModeEnabledStream,
              builder: (_, snapshot) {
                final shuffleEnabled = snapshot.data ?? false;
                return _shuffleButton(context, shuffleEnabled);
              },
            ),

            /// Previous button
            StreamBuilder<SequenceState?>(
              stream: state.sequenceStateStream,
              builder: (_, __) {
                return _previousButton(context);
              },
            ),

            /// Play, Pause and Replay buttons
            StreamBuilder<PlayerState>(
              stream: state.playerStateStream,
              builder: (_, snapshot) {
                final playerState = snapshot.data;
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: FadeTransition(
                        opacity: animation,
                        child: RotationTransition(
                          turns: animation,
                          child: child,
                        )),
                  ),
                  child: _playPauseButton(
                      context,
                      playerState ??
                          PlayerState(false, ProcessingState.loading)),
                );
              },
            ),

            /// Next button
            StreamBuilder<SequenceState?>(
              stream: state.sequenceStateStream,
              builder: (_, __) {
                return _nextButton(context);
              },
            ),

            /// Repeat button
            StreamBuilder<LoopMode>(
              stream: state.loopModeStream,
              builder: (context, snapshot) {
                return _repeatButton(context, snapshot.data ?? LoopMode.off);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _playPauseButton(BuildContext context, PlayerState playerState) {
    final bloc = BlocProvider.of<PlayBackBloc>(context);
    final processingState = playerState.processingState;
    if (processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {
      return Container(
        key: const Key('loading'),
        margin: const EdgeInsets.all(8.0),
        width: 64.0,
        height: 64.0,
        child: const CircularProgressIndicator(),
      );
    } else if (bloc.state.playing != true) {
      return IconButton(
        key: const Key('play_button'),
        icon: const Icon(Icons.play_arrow),
        iconSize: 64.0,
        onPressed: () => {bloc.add(const PlayBackPlay())},
      );
    } else if (processingState != ProcessingState.completed) {
      return IconButton(
        key: const Key('pause_button'),
        icon: const Icon(Icons.pause),
        iconSize: 64.0,
        onPressed: () => {bloc.add(const PlayBackPause())},
      );
    } else {
      return IconButton(
        key: const Key('replay_button'),
        icon: const Icon(Icons.replay),
        iconSize: 64.0,
        onPressed: () => {bloc.add(const PlayBackReplay())},
      );
    }
  }

  Widget _shuffleButton(BuildContext context, bool isEnabled) {
    return IconButton(
      icon: isEnabled
          ? Icon(Icons.shuffle, color: Theme.of(context).primaryColor)
          : const Icon(Icons.shuffle),
      onPressed: () async {
        BlocProvider.of<PlayBackBloc>(context).add(PlayBackShuffle(isEnabled));
      },
    );
  }

  Widget _previousButton(BuildContext context) {
    final bloc = BlocProvider.of<PlayBackBloc>(context);
    return IconButton(
      icon: const Icon(Icons.skip_previous),
      onPressed: bloc.state.hasPrevious
          ? () {
              bloc.add(const PlayBackSkipToPrevious());
            }
          : null,
    );
  }

  Widget _nextButton(BuildContext context) {
    final bloc = BlocProvider.of<PlayBackBloc>(context);
    return IconButton(
      icon: const Icon(Icons.skip_next),
      onPressed: bloc.state.hasNext
          ? () {
              bloc.add(const PlayBackSkipToNext());
            }
          : null,
    );
  }

  Widget _repeatButton(BuildContext context, LoopMode loopMode) {
    final icons = [
      const Icon(Icons.repeat),
      Icon(Icons.repeat, color: Theme.of(context).primaryColor),
      Icon(Icons.repeat_one, color: Theme.of(context).primaryColor),
    ];
    const cycleModes = [
      LoopMode.off,
      LoopMode.all,
      LoopMode.one,
    ];
    final index = cycleModes.indexOf(loopMode);
    return IconButton(
      icon: icons[index],
      onPressed: () {
        BlocProvider.of<PlayBackBloc>(context).add(
            PlayBackSetLoopMode(cycleModes[(index + 1) % cycleModes.length]));
      },
    );
  }
}
