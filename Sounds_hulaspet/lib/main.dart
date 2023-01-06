import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.black,
        ),
        body: const HomePage(),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (var music in musicMap.entries)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MusicPlayer(
                      videoID: music.value.id,
                      title: music.key,
                    ),
                  ),
                );
              },
              child: Ink.image(
                fit: BoxFit.fitWidth,
                height: 200,
                image: NetworkImage(music.value.imageUrl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      music.key,
                      style: TextStyle(
                          color: Colors.red.shade900,
                          fontSize: 18,
                          backgroundColor: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class MyMusic {
  late String id;
  late String imageUrl;

  MyMusic({required this.id, required this.imageUrl});
}

Map<String, dynamic> musicMap = {
  'Endarkenment': MyMusic(
      id: 'OwG0J78ibMw',
      imageUrl: 'https://i.ytimg.com/vi/OwG0J78ibMw/maxresdefault.jpg'),
  'Create Art, Though the World May Perish': MyMusic(
      id: 'bjR0B79Mz1w',
      imageUrl: 'https://i.ytimg.com/vi/mg8StjT_xiE/maxresdefault.jpg'),
  ' The Age of Starlight Ends': MyMusic(
      id: 'KeZmnXrLs9w',
      imageUrl: 'https://i.ytimg.com/vi/KeZmnXrLs9w/maxresdefault.jpg')
};

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
