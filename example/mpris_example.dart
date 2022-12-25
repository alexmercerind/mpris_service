import 'package:mpris_service/mpris_service.dart';



void main() {
  MPRIS? ref;
  ref = MPRIS(
    busName: 'org.mpris.MediaPlayer2.harmonoid',
    identity: 'Harmonoid',
    desktopEntry: '/usr/share/applications/harmonoid',
    eventListeners: MPRISEventListeners(
      playPause: () async {
        print('Play/Pause');
        ref?.playbackStatus = MPRISPlaybackStatus.playing;
      },
      next: () async {
        print('Next');
      },
      previous: () async {
        print('Previous');
      },
    ),
  );
  ref.metadata = MPRISMetadata(
    Uri.parse('https://music.youtube.com/watch?v=Gr6g3-6VQoE'),
    length: Duration(minutes: 3, seconds: 15),
    artUrl: Uri.parse('https://lh3.googleusercontent.com/jvgMIjgbvnqnwLwjtqNa0euo9WStdIxrJnpQURgbwuPazT2OpZUdYPZe1gss2fK39oC8ITofFmeGxKY'),
    album: 'Collage',
    albumArtist: ['The Chainsmokers'],
    artist: ['The Chainsmokers', 'Phoebe Ryan'],
    discNumber: 1,
    title: 'All We Know',
    trackNumber: 2,
  );
}
