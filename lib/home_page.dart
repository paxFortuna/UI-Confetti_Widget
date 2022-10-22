import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ConfettiController();
  bool isPlaying = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.center, // 가운데서 뿌려짐
      alignment: Alignment.topCenter, // 하늘에서 뿌려짐
      children: [
        Scaffold(
          appBar: AppBar(title: const Text('Confetti Widget')),
          body: Center(
            child: MaterialButton(
              onPressed: () {
                if (isPlaying) {
                  _controller.stop();

                } else {
                  _controller.play();

                }
                isPlaying = !isPlaying;
              },
              child: Text('Party Time'),
              color: Colors.deepPurple[300],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          // pi : left, 0: right, pi/2: below, -pi/2: up
          blastDirection: pi/2,
          colors: [
            Colors.deepPurple, Colors.yellow, Colors.red,
          ],
          gravity: 0.01,
          emissionFrequency: 0.1,

        ),
      ],
    );
  }
}
