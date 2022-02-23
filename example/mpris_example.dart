/// This file is a part of mpris_service.dart (https://github.com/harmonoid/mpris_service.dart).
///
/// Copyright (C) 2020-2022 Hitesh Kumar Saini <saini123hitesh@gmail.com>
///
/// This program is free software: you can redistribute it and/or modify
/// it under the terms of the GNU Affero General Public License as
/// published by the Free Software Foundation, either version 3 of the
/// License, or (at your option) any later version.
///
/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU Affero General Public License for more details.
///
/// You should have received a copy of the GNU Affero General Public License
/// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:mpris_service/mpris_service.dart';

void main() {
  MPRISService mpris = MPRISService(
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
