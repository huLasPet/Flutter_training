import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicPlayer(
                    videoID: 'OwG0J78ibMw',
                    title: 'Endarkenment',
                  ),
                ),
              );
            },
            child: Ink.image(
              fit: BoxFit.fitWidth,
              height: 200,
              image: const NetworkImage(
                'https://i.ytimg.com/vi/OwG0J78ibMw/maxresdefault.jpg',
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Endarkenment',
                    style: TextStyle(color: Colors.red.shade900, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicPlayer(
                    videoID: 'bjR0B79Mz1w',
                    title: 'Create Art, Though the World May Perish',
                  ),
                ),
              );
            },
            child: Ink.image(
              fit: BoxFit.fitWidth,
              height: 200,
              image: const NetworkImage(
                  'https://i.ytimg.com/vi/mg8StjT_xiE/maxresdefault.jpg'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Create Art, Though the World May Perish',
                    style: TextStyle(color: Colors.red.shade900, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  final String videoID;
  final String title;

  const MusicPlayer({super.key, required this.videoID, required this.title});
  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  YoutubePlayerController? _controller;
  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoID,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Colors.black,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [player],
          ),
          backgroundColor: Colors.black,
        );
      },
    );
  }
}
