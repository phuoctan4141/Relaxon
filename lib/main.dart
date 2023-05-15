import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relaxon/src/app/relaxon.dart';
import 'package:relaxon/src/blocs/play_back/bloc/play_back_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<PlayBackBloc>(
        create: (context) => PlayBackBloc(),
      ),
    ], child: const Relaxon()),
  );
}
