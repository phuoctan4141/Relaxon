// ignore_for_file: must_be_immutable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildWaveAnimation(context),
        _buildArtist(),
      ],
    );
  }

  _buildArtist() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          'Image by Денис Марчук from Pixabay',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/colorful-2174045.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _buildWaveAnimation(BuildContext context) {
    const _backgroundColor = Colors.transparent;

    final _colors = [
      Colors.amberAccent.withOpacity(0.4),
      Colors.pinkAccent.withOpacity(0.5),
      Colors.indigoAccent.withOpacity(0.6),
    ];

    final _durations = [
      4000,
      6000,
      5000,
    ];

    final _heightPercentages = [
      0.50,
      0.60,
      0.70,
    ];

    return WaveWidget(
      config: CustomConfig(
        colors: _colors,
        durations: _durations,
        heightPercentages: _heightPercentages,
      ),
      backgroundColor: _backgroundColor,
      size: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      waveAmplitude: 0,
    );
  }
}
