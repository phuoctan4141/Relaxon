import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

import 'package:relaxon/src/constants/playlist.dart';
import 'package:rxdart/rxdart.dart';

import 'package:relaxon/src/models/position_data.dart';

part 'play_back_event.dart';
part 'play_back_state.dart';

class PlayBackBloc extends Bloc<PlayBackEvent, PlayBackState> {
  PlayBackBloc() : super(PlayBackState()) {
    on<PlayBackPlay>(_doPlay);
    on<PlayBackPause>(_doPause);
    on<PlayBackStop>(_doStop);
    on<PlayBackReplay>(_doReplay);
    on<PlayBackSkipToNext>(_doSkipToNext);
    on<PlayBackSkipToPrevious>(_doSkipToPrevious);
    on<PlayBackShuffle>(_doShuffle);
    on<PlayBackSetLoopMode>(_setLoopMode);
  }

  FutureOr<void> _doPlay(PlayBackPlay event, Emitter<PlayBackState> emit) {
    emit(state..doPlay);
  }

  FutureOr<void> _doPause(PlayBackPause event, Emitter<PlayBackState> emit) {
    emit(state..doPause);
  }

  FutureOr<void> _doStop(PlayBackStop event, Emitter<PlayBackState> emit) {
    emit(state..doStop);
  }

  FutureOr<void> _doReplay(PlayBackReplay event, Emitter<PlayBackState> emit) {
    emit(state..doReplay);
  }

  FutureOr<void> _doSkipToNext(
      PlayBackSkipToNext event, Emitter<PlayBackState> emit) {
    emit(state..doSkipToNext);
  }

  FutureOr<void> _doSkipToPrevious(
      PlayBackSkipToPrevious event, Emitter<PlayBackState> emit) {
    emit(state..doSkipToPrevious);
  }

  FutureOr<void> _doShuffle(
      PlayBackShuffle event, Emitter<PlayBackState> emit) {
    final enable = !event.enable;
    emit(state..setShuffleMode(enable));
    if (enable) {
      emit(state..doShuffle);
    }
  }

  FutureOr<void> _setLoopMode(
      PlayBackSetLoopMode event, Emitter<PlayBackState> emit) {
    emit(state..setLoopMode(event.loopMode));
  }
}
