import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final player = BetterPlayer.network(
    "https://live-org-01-cdn.mcot.net/RegionRadio/Surin.stream_aac/playlist.m3u8",
    betterPlayerConfiguration: BetterPlayerConfiguration(
      autoPlay: false,
      fullScreenByDefault: false,
    ),
  );

  bool isPlaying() {
    if (this.player.controller.isPlaying() == null) {
      return false;
    } else {
      if (this.player.controller.isPlaying()!) {
        return true;
      } else {
        return false;
      }
    }
  }

  void toggleState() {
    setState(() {
      if (isPlaying()) {
        this.player.controller.pause();
      } else {
        this.player.controller.play();
      }
    });
  }

  var mainColor = Colors.orange[300];
  var textColor = Colors.blueGrey[900];

  playIcon() {
    return Icon(
      Icons.play_arrow,
      color: textColor,
      size: 60.0,
    );
  }

  pauseIcon() {
    return Icon(
      Icons.pause,
      color: textColor,
      size: 60.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/back.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: appScreen(),
    );
  }

  appScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "4 Jazz only",
          style: TextStyle(color: textColor),
        ),
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Container(
          child: Opacity(
            child: player,
            opacity: 0.0,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      floatingActionButton: Container(
        height: 100.0,
        width: 100.0,
        child: FloatingActionButton(
          onPressed: () => {toggleState()},
          child: isPlaying() ? pauseIcon() : playIcon(),
          backgroundColor: mainColor,
        ),
      ),
    );
  }
}
