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
class MPRISService extends MPRISServiceState {
  MPRISService(
    String busName, {
    required String identity,
    required String desktopEntry,
    List<String> supportedUriSchemes = kDefaultSupportedUriSchemes,
    List<String> supportedMimeTypes = kDefaultSupportedMimeTypes,
    void Function(bool)? setFullscreen,
    void Function()? doRaise,
    void Function()? doQuit,
    void Function(String)? setLoopStatus,
    void Function(double)? setRate,
    void Function(bool)? setShuffle,
    void Function(double)? setVolume,
    void Function()? doNext,
    void Function()? doPrevious,
    void Function()? doPause,
    void Function()? doPlayPause,
    void Function()? doStop,
    void Function()? doPlay,
    void Function(int)? doSeek,
    void Function(String, int)? doSetPosition,
    void Function(Uri)? doOpenUri,
  }) : super(
          busName,
          identity,
          desktopEntry,
          supportedUriSchemes,
          supportedMimeTypes,
          setFullscreen,
          doRaise,
          doQuit,
          setLoopStatus,
          setRate,
          setShuffle,
          setVolume,
          doNext,
          doPrevious,
          doPause,
          doPlayPause,
          doStop,
          doPlay,
          doSeek,
          doSetPosition,
          doOpenUri,
        ) {
    if (Platform.isLinux) {
      _player = Media_Player(
        this,
        path: DBusObjectPath('/org/mpris/MediaPlayer2'),
      );
      _interface = Player_Interface(
        this,
        path: DBusObjectPath('/org/mpris/MediaPlayer2'),
      );
      _client = DBusClient.session()
        ..requestName('org.mpris.MediaPlayer2.$busName');
      _client.registerObject(_player);
      _client.registerObject(_interface);
    }
  }

  late DBusClient _client;
  late Media_Player _player;
  late Player_Interface _interface;
}

/// MPRISServiceState
/// -----------------
///
/// An object used to keep the present `org.mpris.MediaPlayer2` state.
/// More fields & attributes can be added in future.
///
class MPRISServiceState {
  MPRISServiceState(
    this.busName,
    this.identity,
    this.desktopEntry,
    this.supportedUriSchemes,
    this.supportedMimeTypes,
    this.setFullscreen,
    this.doRaise,
    this.doQuit,
    this.setLoopStatus,
    this.setRate,
    this.setShuffle,
    this.setVolume,
    this.doNext,
    this.doPrevious,
    this.doPause,
    this.doPlayPause,
    this.doStop,
    this.doPlay,
    this.doSeek,
    this.doSetPosition,
    this.doOpenUri,
  );

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

  final void Function(bool)? setFullscreen;
  final void Function()? doRaise;
  final void Function()? doQuit;
  final void Function(String)? setLoopStatus;
  final void Function(double)? setRate;
  final void Function(bool)? setShuffle;
  final void Function(double)? setVolume;
  final void Function()? doNext;
  final void Function()? doPrevious;
  final void Function()? doPause;
  final void Function()? doPlayPause;
  final void Function()? doStop;
  final void Function()? doPlay;
  final void Function(int)? doSeek;
  final void Function(String, int)? doSetPosition;
  final void Function(Uri)? doOpenUri;

  /// Whether the media player can be quit.
  bool canQuit = true;

  /// Whether the media player is fullscreen.
  bool fullscreen = false;

  /// Whether the media player can be made fullscreen.
  bool canSetFullscreen = true;

  /// Whether the media player can be raised.
  bool canRaise = false;

  /// Whether the media player has a track list.
  bool get hasTrackList => playlist.isNotEmpty;

  int index = 0;
  List<MPRISMedia> playlist = [];
  double volume = 50.0;
  double rate = 1.0;
  String loopStatus = 'None';
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
///
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

const kDefaultSupportedUriSchemes = [
  'file',
  'ftp',
  'http',
  'https',
  'mms',
  'rtmp',
  'rtsp',
  'sftp',
  'smb',
];

const kDefaultSupportedMimeTypes = [
  'application/ogg',
  'application/x-ogg',
  'audio/ogg',
  'audio/vorbis',
  'audio/x-vorbis',
  'audio/x-vorbis+ogg',
  'video/ogg',
  'video/x-ogm',
  'video/x-ogm+ogg',
  'video/x-theora+ogg',
  'video/x-theora',
  'audio/x-speex',
  'audio/opus',
  'application/x-flac',
  'audio/flac',
  'audio/x-flac',
  'audio/x-ms-asf',
  'audio/x-ms-asx',
  'audio/x-ms-wax',
  'audio/x-ms-wma',
  'video/x-ms-asf',
  'video/x-ms-asf-plugin',
  'video/x-ms-asx',
  'video/x-ms-wm',
  'video/x-ms-wmv',
  'video/x-ms-wmx',
  'video/x-ms-wvx',
  'video/x-msvideo',
  'audio/x-pn-windows-acm',
  'video/divx',
  'video/msvideo',
  'video/vnd.divx',
  'video/avi',
  'video/x-avi',
  'application/vnd.rn-realmedia',
  'application/vnd.rn-realmedia-vbr',
  'audio/vnd.rn-realaudio',
  'audio/x-pn-realaudio',
  'audio/x-pn-realaudio-plugin',
  'audio/x-real-audio',
  'audio/x-realaudio',
  'video/vnd.rn-realvideo',
  'audio/mpeg',
  'audio/mpg',
  'audio/mp1',
  'audio/mp2',
  'audio/mp3',
  'audio/x-mp1',
  'audio/x-mp2',
  'audio/x-mp3',
  'audio/x-mpeg',
  'audio/x-mpg',
  'video/mp2t',
  'video/mpeg',
  'video/mpeg-system',
  'video/x-mpeg',
  'video/x-mpeg2',
  'video/x-mpeg-system',
  'application/mpeg4-iod',
  'application/mpeg4-muxcodetable',
  'application/x-extension-m4a',
  'application/x-extension-mp4',
  'audio/aac',
  'audio/m4a',
  'audio/mp4',
  'audio/x-m4a',
  'audio/x-aac',
  'video/mp4',
  'video/mp4v-es',
  'video/x-m4v',
  'application/x-quicktime-media-link',
  'application/x-quicktimeplayer',
  'video/quicktime',
  'application/x-matroska',
  'audio/x-matroska',
  'video/x-matroska',
  'video/webm',
  'audio/webm',
  'audio/3gpp',
  'audio/3gpp2',
  'audio/AMR',
  'audio/AMR-WB',
  'video/3gp',
  'video/3gpp',
  'video/3gpp2',
  'x-scheme-handler/mms',
  'x-scheme-handler/mmsh',
  'x-scheme-handler/rtsp',
  'x-scheme-handler/rtp',
  'x-scheme-handler/rtmp',
  'x-scheme-handler/icy',
  'x-scheme-handler/icyx',
  'application/x-cd-image',
  'x-content/video-vcd',
  'x-content/video-svcd',
  'x-content/video-dvd',
  'x-content/audio-cdda',
  'x-content/audio-player',
  'application/ram',
  'application/xspf+xml',
  'audio/mpegurl',
  'audio/x-mpegurl',
  'audio/scpls',
  'audio/x-scpls',
  'text/google-video-pointer',
  'text/x-google-video-pointer',
  'video/vnd.mpegurl',
  'application/vnd.apple.mpegurl',
  'application/vnd.ms-asf',
  'application/vnd.ms-wpl',
  'application/sdp',
  'audio/dv',
  'video/dv',
  'audio/x-aiff',
  'audio/x-pn-aiff',
  'video/x-anim',
  'video/x-nsv',
  'video/fli',
  'video/flv',
  'video/x-flc',
  'video/x-fli',
  'video/x-flv',
  'audio/wav',
  'audio/x-pn-au',
  'audio/x-pn-wav',
  'audio/x-wav',
  'audio/x-adpcm',
  'audio/ac3',
  'audio/eac3',
  'audio/vnd.dts',
  'audio/vnd.dts.hd',
  'audio/vnd.dolby.heaac.1',
  'audio/vnd.dolby.heaac.2',
  'audio/vnd.dolby.mlp',
  'audio/basic',
  'audio/midi',
  'audio/x-ape',
  'audio/x-gsm',
  'audio/x-musepack',
  'audio/x-tta',
  'audio/x-wavpack',
  'audio/x-shorten',
  'application/x-shockwave-flash',
  'application/x-flash-video',
  'misc/ultravox',
  'image/vnd.rn-realpix',
  'audio/x-it',
  'audio/x-mod',
  'audio/x-s3m',
  'audio/x-xm',
  'application/mxf',
];
