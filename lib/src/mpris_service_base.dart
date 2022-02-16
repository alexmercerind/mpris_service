/// This file is a part of mpris_service.dart (https://github.com/alexmercerind/mpris_service.dart).
///
/// Copyright (c) 2022, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.

// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:dbus/dbus.dart';
import 'package:path/path.dart' as path;
import 'package:mpris_service/generated/root.dart';
import 'package:mpris_service/generated/player.dart';

/// MPRISService
/// ------------
///
/// This class can be used to expose a media player functionalities to The Media Player Remote Interfacing Specification (MPRIS) in standard D-Bus interface.
///
class MPRISService {
  /// Each media player must request a unique bus name which begins with org.mpris.MediaPlayer2. For example:

  /// * `org.mpris.MediaPlayer2.harmonoid`
  /// * `org.mpris.MediaPlayer2.mpv`
  /// * `org.mpris.MediaPlayer2.vlc`
  final String busName;

  /// A friendly name to identify the media player to users.
  final String identity;

  /// The basename of an installed .desktop file which complies with the Desktop entry specification, with the ".desktop" extension stripped.
  final String desktopEntry;

  /// The URI schemes supported by the media player.
  /// This can be viewed as protocols supported by the player in almost all cases. Almost every media player will include support for the "file" scheme. Other common schemes are "http" and "rtsp".
  final List<String> supportedUriSchemes;

  /// The mime-types supported by the media player.
  /// Mime-types should be in the standard format (eg: audio/mpeg or application/ogg).
  final List<String> supportedMimeTypes;

  MPRISService({
    required this.busName,
    required this.identity,
    required this.desktopEntry,
    required this.supportedUriSchemes,
    required this.supportedMimeTypes,
  }) {
    if (Platform.isLinux) {
      _player = Media_Player(
        _state,
        path: DBusObjectPath('/org/mpris/MediaPlayer2'),
      );
      _interface = Player_Interface(
        _state,
        path: DBusObjectPath('/org/mpris/MediaPlayer2'),
      );
      _client = DBusClient.session()..requestName(busName);
      _client.registerObject(_player);
      _client.registerObject(_interface);
    }
  }

  final MPRISServiceState _state = MPRISServiceState();
  late DBusClient _client;
  late Media_Player _player;
  late Player_Interface _interface;
}

/// MPRISServiceState
/// -----------------
///
/// An object used to keep the present `org.mpris.MediaPlayer2` state.
/// More fields & attributes can be added in future.
class MPRISServiceState {
  int index = 0;
  List<MPRISMedia> playlist = [];
  double volume = 50.0;
  double rate = 1.0;
  String playlistLoopMode = 'None';
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  bool isMuted = false;
  bool isPlaying = false;
  bool isBuffering = false;
  bool isCompleted = false;
  bool isShuffling = false;
}

/// MPRISMedia
/// ----------
/// An object used to represent a media & retrieve/expose `org.mpris.MediaPlayer2.Player.Metadata`.
///
class MPRISMedia {
  Uri uri;
  String trackName;
  String albumName;
  int trackNumber;
  String albumArtistName;
  List<String> trackArtistNames;
  String year;
  String artworkUri;

  DateTime timeAdded;
  Duration? duration;
  int? bitrate;

  Map<String, dynamic> toJson() {
    return {
      'uri': uri.toString(),
      'trackName': trackName,
      'albumName': albumName,
      'trackNumber': trackNumber,
      'albumArtistName': albumArtistName,
      'trackArtistNames': trackArtistNames,
      'year': year,
      'timeAdded': timeAdded.millisecondsSinceEpoch,
      'duration': duration?.inMilliseconds,
      'bitrate': bitrate,
      'artworkUri': artworkUri,
    };
  }

  factory MPRISMedia.fromJson(dynamic json) => MPRISMedia(
        uri: Uri.parse(json['uri']),
        trackName: [null, ''].contains(json['trackName'])
            ? path.basename(Uri.parse(json['uri']).toFilePath())
            : json['trackName'],
        albumName: [null, ''].contains(json['albumName'])
            ? 'Unknown Album'
            : json['albumName'],
        trackNumber: json['trackNumber'] ?? 1,
        albumArtistName: [null, ''].contains(json['albumArtistName'])
            ? 'Unknown Artist'
            : json['albumArtistName'],
        trackArtistNames: json['trackArtistNames']?.cast<String>() ??
            <String>['Unknown Artist'],
        year: '${json['year'] ?? 'Unknown Year'}',
        timeAdded: () {
          final uri = Uri.parse(json['uri']);
          if (uri.isScheme('HTTP') || uri.isScheme('HTTPS')) {
            return DateTime.now();
          }
          if (File(uri.toFilePath()).existsSync()) {
            return File(uri.toFilePath()).lastModifiedSync();
          }
          return DateTime.now();
        }(),
        duration: Duration(milliseconds: json['duration'] ?? 0),
        bitrate: json['bitrate'],
        artworkUri: json['artworkUri'],
      );

  MPRISMedia({
    required this.uri,
    required this.trackName,
    required this.albumName,
    required this.trackNumber,
    required this.albumArtistName,
    required this.trackArtistNames,
    required this.year,
    required this.timeAdded,
    required this.duration,
    required this.bitrate,
    required this.artworkUri,
  });

  @override
  bool operator ==(Object other) {
    if (other is MPRISMedia) {
      return other.trackName == trackName &&
          other.trackNumber == other.trackNumber &&
          other.albumArtistName == albumArtistName;
    }
    throw FormatException();
  }

  @override
  int get hashCode =>
      trackName.hashCode ^ trackNumber.hashCode ^ albumArtistName.hashCode;
}
