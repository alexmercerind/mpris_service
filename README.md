# [package:mpris_service](https://github.com/alexmercerind/mpris_service)

A package to integrate [Media Player Remote Interfacing Specification (MPRIS)](https://specifications.freedesktop.org/mpris-spec/latest/) in Dart.
<br></br>

![Screenshot from 2022-12-26 07 23 01](https://user-images.githubusercontent.com/28951144/209481093-a067d628-0911-484c-9684-0924e834613a.jpeg)

This package makes use of [`package:dbus`](https://pub.dev/packages/dbus) internally. Following interfaces have been implemented:

- [org.mpris.MediaPlayer2](https://specifications.freedesktop.org/mpris-spec/latest/Media_Player.html)
- [org.mpris.MediaPlayer2.Player](https://specifications.freedesktop.org/mpris-spec/latest/Player_Interface.html)

## Example

```dart
final instance = await MPRIS.create(
  busName: 'org.mpris.MediaPlayer2.harmonoid',
  identity: 'Harmonoid',
  desktopEntry: '/usr/share/applications/harmonoid',
);
instance.setEventHandler(
  MPRISEventHandler(
    playPause: () async {
      print('Play/Pause');
      instance.playbackStatus =
          instance.playbackStatus == MPRISPlaybackStatus.playing
              ? MPRISPlaybackStatus.paused
              : MPRISPlaybackStatus.playing;
    },
    play: () async {
      print('Play');
      instance.playbackStatus = MPRISPlaybackStatus.playing;
    },
    pause: () async {
      print('Pause');
      instance.playbackStatus = MPRISPlaybackStatus.paused;
    },
    next: () async {
      print('Next');
    },
    previous: () async {
      print('Previous');
    },
  ),
);
instance.metadata = MPRISMetadata(
  Uri.parse('https://music.youtube.com/watch?v=Gr6g3-6VQoE'),
  length: Duration(minutes: 3, seconds: 15),
  artUrl: Uri.parse(
    'https://lh3.googleusercontent.com/jvgMIjgbvnqnwLwjtqNa0euo9WStdIxrJnpQURgbwuPazT2OpZUdYPZe1gss2fK39oC8ITofFmeGxKY',
  ),
  album: 'Collage',
  albumArtist: ['The Chainsmokers'],
  artist: ['The Chainsmokers', 'Phoebe Ryan'],
  discNumber: 1,
  title: 'All We Know',
  trackNumber: 2,
);
```

## License

Copyright © 2021 & onwards, Hitesh Kumar Saini <<saini123hitesh@gmail.com>>

This project & the work under this repository is governed by MIT license that can be found in the [LICENSE](./LICENSE) file.
