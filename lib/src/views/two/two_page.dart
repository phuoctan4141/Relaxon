// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

class TwoPage extends StatefulWidget {
  const TwoPage({super.key});

  @override
  State<TwoPage> createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildFloatingBubbles(),
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
          'Image by Michelle Raponi from Pixabay',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/4k-1330252_1920.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _buildFloatingBubbles() {
    return Positioned.fill(
      child: FloatingBubbles.alwaysRepeating(
        noOfBubbles: 25,
        colorsOfBubbles: List.generate(
          // ignore: prefer_const_constructors
          25,
          (index) => Colors.primaries[index % Colors.primaries.length]
              .withOpacity(Random().nextDouble() * 0.9 + 0.1),
        ),
        sizeFactor: 0.16,
        opacity: 70,
        paintingStyle: PaintingStyle.fill,
        shape: BubbleShape.circle,
        speed: BubbleSpeed.normal,
      ),
    );
  }
}
