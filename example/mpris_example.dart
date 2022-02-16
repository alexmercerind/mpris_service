import 'package:mpris_service/mpris_service.dart';

void main() {
  late MPRISService mpris;
  mpris = MPRISService(
    'harmonoid',
    identity: 'Harmonoid',
    desktopEntry: '/usr/share/applications/harmonoid.desktop',
    doPlay: () {
      print('Play.');
      mpris.isPlaying = true;
    },
    doPause: () {
      print('Pause.');
      mpris.isPlaying = false;
    },
    doPlayPause: () {
      print('Play/Pause.');
      mpris.isPlaying = !mpris.isPlaying;
    },
  );
  mpris.position = Duration(minutes: 2, seconds: 0);
  mpris.duration = Duration(minutes: 3, seconds: 16);
  mpris.playlist = [
    MPRISMedia(
      uri: Uri.parse('https://alexmercerind.github.io/music.m4a'),
      trackName: 'Make Me Move (feat. KARRA)',
      albumName: 'Make Me Move',
      trackNumber: 1,
      albumArtistName: 'Culture Code',
      trackArtistNames: ['Culture Code', 'KARRA'],
      year: '2016',
      timeAdded: DateTime.now(),
      duration: Duration(minutes: 3, seconds: 16),
      bitrate: 156,
      artworkUri:
          'https://ncsmusic.s3.eu-west-1.amazonaws.com/tracks/000/000/286/1000x0/make-me-move-feat-karra-1586948717-dTsA9So1cu.jpg',
    ),
  ];
}
