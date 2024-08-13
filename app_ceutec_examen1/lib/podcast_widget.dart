import 'package:flutter/material.dart';

class PodcastWidget extends StatefulWidget {
  const PodcastWidget({super.key});

  @override
  PodcastWidgetState createState() => PodcastWidgetState();
}

class PodcastWidgetState extends State<PodcastWidget> {
  bool isPlaying = false;
  bool isRepeat = false;
  bool isShuffle = false;
  double playbackPosition = 0.0;

  void _togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App CEUTEC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Text('Song'),
                    subtitle: Text('Card content'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: const Text('BUTTON 1'),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {},
                        child: const Text('BUTTON 2'),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.fast_rewind),
                  iconSize: 36,
                  onPressed: () {
                    // Acción de retroceder
                  },
                ),
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 50,
                  onPressed: _togglePlayPause,
                ),
                IconButton(
                  icon: const Icon(Icons.fast_forward),
                  iconSize: 36,
                  onPressed: () {
                    // Acción de avanzar
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Slider(
              value: playbackPosition,
              min: 0.0,
              max: 1.0,
              onChanged: (value) {
                setState(() {
                  playbackPosition = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                const Expanded(child: Text('Repeat')),
                Checkbox(
                  value: isRepeat,
                  onChanged: (bool? value) {
                    setState(() {
                      isRepeat = value!;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const Expanded(child: Text('Shuffle')),
                Checkbox(
                  value: isShuffle,
                  onChanged: (bool? value) {
                    setState(() {
                      isShuffle = value!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
