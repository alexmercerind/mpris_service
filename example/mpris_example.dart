/// This file is a part of mpris_service.dart (https://github.com/harmonoid/mpris_service.dart).
///
/// Copyright (C) 2022 Hitesh Kumar Saini <saini123hitesh@gmail.com>
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

class Harmonoid extends MPRISService {
  Harmonoid()
      : super(
          'harmonoid',
          identity: 'Harmonoid',
          desktopEntry: '/usr/share/applications/harmonoid.desktop',
        );

  @override
  void doPlayPause() {
    print('[Harmonoid] doPlayPause');
    isPlaying = !isPlaying;
  }

  @override
  void doNext() {
    print('[Harmonoid] doNext');
    index++;
  }

  @override
  void doPrevious() {
    print('[Harmonoid] doPrevious');
    index--;
  }
}

void main() {
  final application = Harmonoid();
  application.playlist = List.generate(
    100,
    (index) => MPRISMedia(
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
          'https://lh3.googleusercontent.com/khT39Qh0-PYr4t9h3lWStqLfzab5NBeTeKiva_sC2s6LMvsaGHTVWvZlMlEEV9BrUSP4mpEbjPMBexdguw=w544-h544-l90-rj',
    ),
  );
}
