import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';

class PlayVideoExample extends StatefulWidget {
  const PlayVideoExample({Key? key}) : super(key: key);

  @override
  _PlayVideoExampleState createState() => _PlayVideoExampleState();
}

class _PlayVideoExampleState extends State<PlayVideoExample>
    implements YouTubePlayerListener {
  double _currentVideoSecond = 0.0;
  String _playerState = "";
  late FlutterYoutubeViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Column(
        children: [
          Expanded(
            child: Container(
                child: FlutterYoutubeView(
              onViewCreated: _onYoutubeCreated,
              listener: this,
              params: YoutubeParam(
                videoId: 'ABKLlryWbjY',
                showUI: true,
                startSeconds: 0,
                showYoutube: true,
                showFullScreen: true,
              ),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                child: FlutterYoutubeView(
              onViewCreated: _onYoutubeCreated,
              listener: this,
              params: YoutubeParam(
                videoId: 'gc58Z3pG0uI',
                showUI: true,
                startSeconds: 0,
                showYoutube: true,
                showFullScreen: false,
              ),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                child: FlutterYoutubeView(
              onViewCreated: _onYoutubeCreated,
              listener: this,
              params: YoutubeParam(
                videoId: 'IykQg3ztKHU',
                showUI: true,
                startSeconds: 0,
                showYoutube: false,
                showFullScreen: true,
              ),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                child: FlutterYoutubeView(
              onViewCreated: _onYoutubeCreated,
              listener: this,
              params: YoutubeParam(
                videoId: 'gc58Z3pG0uI',
                showUI: true,
                startSeconds: 0,
                showYoutube: false,
                showFullScreen: true,
              ),
            )),
          ),
        ],
      )
    ]));
  }

  @override
  void onCurrentSecond(double second) {
    print("onCurrentSecond second = $second");
    _currentVideoSecond = second;
  }

  @override
  void onError(String error) {
    print("onError error = $error");
  }

  @override
  void onReady() {
    print("onReady");
  }

  @override
  void onStateChange(String state) {
    print("onStateChange state = $state");
    setState(() {
      _playerState = state;
    });
  }

  @override
  void onVideoDuration(double duration) {
    print("onVideoDuration duration = $duration");
  }

  void _onYoutubeCreated(FlutterYoutubeViewController controller) {
    this._controller = controller;
  }

  void _loadOrCueVideo() {
    _controller.loadOrCueVideo('ABKLlryWbjY', _currentVideoSecond);
  }
}
