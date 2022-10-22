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
      alignment: Alignment.center,
      children: [
        Scaffold(
          appBar: AppBar(title: const Text('Confetti Widget')),
          body: Center(
            child: MaterialButton(
              onPressed: () {
                if (isPlaying) {
                  setState(() {
                    _controller.stop();
                  });
                } else {
                  setState(() {
                    _controller.play();
                  });
                }
                isPlaying = !isPlaying;
              },
              child: Text('Party Time'),
              color: Colors.deepPurple,
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
        ),
      ],
    );
  }
}
