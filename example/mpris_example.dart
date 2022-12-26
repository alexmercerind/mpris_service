import 'package:mpris_service/mpris_service.dart';

Future<void> main() async {
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
        'https://lh3.googleusercontent.com/jvgMIjgbvnqnwLwjtqNa0euo9WStdIxrJnpQURgbwuPazT2OpZUdYPZe1gss2fK39oC8ITofFmeGxKY'),
    album: 'Collage',
    albumArtist: ['The Chainsmokers'],
    artist: ['The Chainsmokers'],
    discNumber: 1,
    title: 'All We Know',
    trackNumber: 2,
  );
}
