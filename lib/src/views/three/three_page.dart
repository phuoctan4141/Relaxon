import 'package:flutter/material.dart';
import 'package:rain_falling/rain_falling.dart';

class ThreePage extends StatefulWidget {
  const ThreePage({super.key});

  @override
  State<ThreePage> createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildRainAnimation(context),
        _buildArtist(),
      ],
    );
  }

  _buildArtist() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text('Image by Bruno /Germany from Pixabay',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            )),
      ),
    );
  }

  _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/heaven-5114501_1920.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _buildRainAnimation(BuildContext context) {
    return RainFalling(
      duration: 1000,
    );
  }
}
