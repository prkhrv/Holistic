import 'package:audioplayers/audioplayers_api.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_app/home/mental_health/play_pause.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String url;
  final bool isAsset;

  const AudioPlayerWidget({
    Key? key,
    required this.url,
    this.isAsset = false,
  }) : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _audioPlayer;
  late AudioCache _audioCache;

  PlayerState _playerState = PlayerState.STOPPED;

  bool get _isPlaying => _playerState == PlayerState.PLAYING;
  bool get _isLocal => !widget.url.contains('https');

  @override
  void initState() {
    _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    _audioCache = AudioCache(fixedPlayer: _audioPlayer);
    _audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
      setState(() {
        _playerState = PlayerState.STOPPED;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlayPauseButton(isPlaying: _isPlaying, onPlay: () => _playPause()),
        IconButton(
          onPressed: () => _stop(),
          icon: Icon(
            Icons.stop,
            size: 32,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  _playPause() async {
    if (_playerState == PlayerState.PLAYING) {
      final playerResult = await _audioPlayer.pause();
      if (playerResult == 1) {
        setState(() {
          _playerState = PlayerState.PAUSED;
        });
      }
    } else if (_playerState == PlayerState.PAUSED) {
      final playerResult = await _audioPlayer.resume();
      if (playerResult == 1) {
        setState(() {
          _playerState = PlayerState.PLAYING;
        });
      }
    } else {
      if (widget.isAsset) {
        _audioPlayer = await _audioCache.play(widget.url);
        setState(() {
          _playerState = PlayerState.PLAYING;
        });
      } else {
        final playerResult =
            await _audioPlayer.play(widget.url, isLocal: _isLocal);
        if (playerResult == 1) {
          setState(() {
            _playerState = PlayerState.PLAYING;
          });
        }
      }
    }
  }

  _stop() async {
    final playerResult = await _audioPlayer.stop();
    if (playerResult == 1) {
      setState(() {
        _playerState = PlayerState.STOPPED;
      });
    }
  }
}
