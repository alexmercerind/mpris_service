/// This file is a part of mpris_service (https://github.com/alexmercerind/mpris_service).
///
/// Copyright © 2021 & onwards, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:dbus/dbus.dart';

/// {@template mpris}
///
/// MPRIS
/// -----
/// See: https://specifications.freedesktop.org/mpris-spec/latest/Media_Player.html.
///
/// The MPRIS specification defines a set of interfaces that can be implemented by media players to allow remote control by other applications.
/// The interfaces are designed to be as generic as possible, so that they can be implemented by a wide range of media players.
///
/// This class provides an abstraction over the `org.mpris.MediaPlayer2` & `org.mpris.MediaPlayer2.Player` interfaces.
///
///  Following arguments are required to create an instance of [MPRIS]:
///
/// * **busName**: The name of the bus that the media player is running on. For example:
///   * `org.mpris.MediaPlayer2.harmonoid`
///   * `org.mpris.MediaPlayer2.vlc`
///   * `org.mpris.MediaPlayer2.mpv`
/// * **identity**: The name of the media player. For example:
///   * `Harmonoid`
///   * `VLC Media Player`
///   * `mpv`
/// * **desktopEntry**: The basename of an installed .desktop file which complies with the Desktop entry specification, with the ".desktop" extension stripped.
/// * **supportedUriSchemes**: A list of URI schemes that the media player supports.
/// * **supportedMimeTypes**: A list of MIME types that the media player supports.
///
/// {@endtemplate}
class MPRIS {
  /// The `org.mpris.MediaPlayer2` & `org.mpris.MediaPlayer2.Player` interfaces.
  final MediaPlayer2 _mediaPlayer2;

  /// The DBus client.
  final DBusClient _client;

  MPRIS._(this._mediaPlayer2, this._client);

  /// {@macro mpris}
  static Future<MPRIS> create({
    required String busName,
    required String identity,
    required String desktopEntry,
    Set<String> supportedUriSchemes = kDefaultSupportedUriSchemes,
    Set<String> supportedMimeTypes = kDefaultSupportedMimeTypes,
  }) async {
    final mediaPlayer2 = MediaPlayer2(
      DBusObjectPath('/org/mpris/MediaPlayer2'),
      identity,
      desktopEntry,
      supportedUriSchemes,
      supportedMimeTypes,
    );
    final client = DBusClient.session();
    await client.requestName(busName);
    await client.registerObject(mediaPlayer2);
    return MPRIS._(mediaPlayer2, client);
  }

  /// Disposes the [MPRIS] instance & closes the DBus client.
  /// Allocated resources are released back to the system.
  Future<void> dispose() {
    return _client.close();
  }

  /// Sets event handler.
  void setEventHandler(MPRISEventHandler handler) {
    _mediaPlayer2.handler = handler;
  }

  // Getters.

  bool get canQuit => _mediaPlayer2.CanQuit;
  bool get fullscreen => _mediaPlayer2.Fullscreen;
  bool get canSetFullscreen => _mediaPlayer2.CanSetFullscreen;
  bool get canRaise => _mediaPlayer2.CanRaise;
  bool get hasTrackList => _mediaPlayer2.HasTrackList;
  MPRISPlaybackStatus get playbackStatus => _mediaPlayer2.PlaybackStatus;
  MPRISLoopStatus get loopStatus => _mediaPlayer2.LoopStatus;
  double get rate => _mediaPlayer2.Rate;
  bool get shuffle => _mediaPlayer2.Shuffle;
  MPRISMetadata get metadata => _mediaPlayer2.Metadata;
  double get volume => _mediaPlayer2.Volume;
  Duration get position => _mediaPlayer2.Position;
  double get minimumRate => _mediaPlayer2.MinimumRate;
  double get maximumRate => _mediaPlayer2.MaximumRate;
  bool get canGoNext => _mediaPlayer2.CanGoNext;
  bool get canGoPrevious => _mediaPlayer2.CanGoPrevious;
  bool get canPlay => _mediaPlayer2.CanPlay;
  bool get canPause => _mediaPlayer2.CanPause;
  bool get canSeek => _mediaPlayer2.CanSeek;
  bool get canControl => _mediaPlayer2.CanControl;

  // Setters.

  set canQuit(bool value) {
    _mediaPlayer2.CanQuit = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2', changedProperties: {'CanQuit': DBusBoolean(value)});
  }

  set fullscreen(bool value) {
    _mediaPlayer2.Fullscreen = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2', changedProperties: {'Fullscreen': DBusBoolean(value)});
  }

  set canSetFullscreen(bool value) {
    _mediaPlayer2.CanSetFullscreen = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2', changedProperties: {'CanSetFullscreen': DBusBoolean(value)});
  }

  set canRaise(bool value) {
    _mediaPlayer2.CanRaise = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2', changedProperties: {'CanRaise': DBusBoolean(value)});
  }

  set hasTrackList(bool value) {
    _mediaPlayer2.HasTrackList = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2', changedProperties: {'HasTrackList': DBusBoolean(value)});
  }

  set playbackStatus(MPRISPlaybackStatus value) {
    _mediaPlayer2.PlaybackStatus = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'PlaybackStatus': DBusString(value.name[0].toUpperCase() + value.name.substring(1))});
  }

  set loopStatus(MPRISLoopStatus value) {
    _mediaPlayer2.LoopStatus = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'LoopStatus': DBusString(value.name[0].toUpperCase() + value.name.substring(1))});
  }

  set rate(double value) {
    _mediaPlayer2.Rate = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'Rate': DBusDouble(value)});
  }
  
  set shuffle(bool value) {
    _mediaPlayer2.Shuffle = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'Shuffle': DBusBoolean(value)});
  }

  set metadata(MPRISMetadata value) {
    _mediaPlayer2.Metadata = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'Metadata': value.toDBusDict()});
  }

  set volume(double value) {
    _mediaPlayer2.Volume = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'Volume': DBusDouble(value)});
  }

  set position(Duration value) {
    _mediaPlayer2.Position = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'Position': DBusInt64(value.inMicroseconds)});
  }

  set minimumRate(double value) {
    _mediaPlayer2.MinimumRate = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'MinimumRate': DBusDouble(value)});
  }

  set maximumRate(double value) {
    _mediaPlayer2.MaximumRate = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'MaximumRate': DBusDouble(value)});
  }

  set canGoNext(bool value) {
    _mediaPlayer2.CanGoNext = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'CanGoNext': DBusBoolean(value)});
  }

  set canGoPrevious(bool value) {
    _mediaPlayer2.CanGoPrevious = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'CanGoPrevious': DBusBoolean(value)});
  }

  set canPlay(bool value) {
    _mediaPlayer2.CanPlay = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'CanPlay': DBusBoolean(value)});
  }

  set canPause(bool value) {
    _mediaPlayer2.CanPause = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'CanPause': DBusBoolean(value)});
  }

  set canSeek(bool value) {
    _mediaPlayer2.CanSeek = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'CanSeek': DBusBoolean(value)});
  }
  
  set canControl(bool value) {
    _mediaPlayer2.CanControl = value;
    _mediaPlayer2.emitPropertiesChanged('org.mpris.MediaPlayer2.Player', changedProperties: {'CanControl': DBusBoolean(value)});
  }

  static const Set<String> kDefaultSupportedUriSchemes = {
    'ftp',
    'file',
    'rtmp',
    'rtsp',
    'http',
    'https',
  };

  static const Set<String> kDefaultSupportedMimeTypes =  {
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
  };
}

/// Playback status of the media player.
enum MPRISPlaybackStatus { playing, paused, stopped }

/// Loop status of the media player.
enum MPRISLoopStatus { none, track, playlist }

/// {@template mpris_event_handler}
/// 
/// MPRISEventHandler
/// -----------------
/// 
/// This class is used for listening to MPRIS events.
/// 
/// {@endtemplate}
class MPRISEventHandler {
  // org.mpris.MediaPlayer2

  // Methods

  Future<void> Function()? raise;
  Future<void> Function()? quit;
  
  // Properties

  Future<void> Function(bool value)? fullscreen;

  // org.mpris.MediaPlayer2.Player

  // Methods

  Future<void> Function()? next;
  Future<void> Function()? previous;
  Future<void> Function()? pause;
  Future<void> Function()? playPause;
  Future<void> Function()? stop;
  Future<void> Function()? play;
  Future<void> Function(Duration offset)? seek;
  Future<void> Function(Uri trackId, int position)? setPosition;
  Future<void> Function(Uri uri)? openUri;

  // Properties

  Future<void> Function(MPRISLoopStatus value)? loopStatus;
  Future<void> Function(double value)? rate;
  Future<void> Function(bool value)? shuffle;
  Future<void> Function(double value)? volume;

  /// {@macro mpris_event_handler}
  MPRISEventHandler({
    this.raise,
    this.quit,
    this.fullscreen,
    this.next,
    this.previous,
    this.pause,
    this.playPause,
    this.stop,
    this.play,
    this.seek,
    this.setPosition,
    this.openUri,
    this.loopStatus,
    this.rate,
    this.shuffle,
    this.volume,
  });
}

/// {@template mpris_metadata}
/// 
/// Metadata
/// --------
/// 
/// This represents the [Metadata](https://specifications.freedesktop.org/mpris-spec/latest/Player_Interface.html#Property:Metadata) property in `org.mpris.MediaPlayer2.Player` interface.
/// 
/// Some attributes have been abstracted into more user-friendly types.
/// 
/// {@endtemplate}
class MPRISMetadata {
  
  // MPRIS-specific.
  
  final Uri uri;
  final Duration? length;
  final Uri? artUrl;

  // xesam-specific.

  final String? album;
  final List<String>? albumArtist;
  final List<String>? artist;
  final String? lyrics;
  final int? audioBPM;
  final double? autoRating;
  final List<String>? comment;
  final List<String>? composer;
  final DateTime? contentCreated;
  final int? discNumber;
  final DateTime? firstUsed;
  final List<String>? genre;
  final DateTime? lastUsed;
  final List<String>? lyricist;
  final String? title;
  final int? trackNumber;
  final int? useCount;
  final double? userRating;

  /// {@macro mpris_metadata}
  MPRISMetadata(
    this.uri, {
    this.length,
    this.artUrl,
    this.album,
    this.albumArtist,
    this.artist,
    this.lyrics,
    this.audioBPM,
    this.autoRating,
    this.comment,
    this.composer,
    this.contentCreated,
    this.discNumber,
    this.firstUsed,
    this.genre,
    this.lastUsed,
    this.lyricist,
    this.title,
    this.trackNumber,
    this.useCount,
    this.userRating,
  });

  DBusDict toDBusDict() {
    // According to https://www.freedesktop.org/wiki/Specifications/mpris-spec/metadata.
    return DBusDict(
      DBusSignature('s'),
      DBusSignature('v'),
      {
        // Assigning `mpris:trackid` based on the URL itself.
        // This will avoid any misunderstanding to the developers using this library.
        DBusString('mpris:trackid'): DBusVariant(DBusObjectPath('/${base64.encode(utf8.encode(uri.toString()))}')),
        if (length != null) DBusString('mpris:length'): DBusVariant(DBusInt64(length!.inMicroseconds)),
        if (artUrl != null) DBusString('mpris:artUrl'): DBusVariant(DBusString(artUrl!.toString())),
        if (album != null) DBusString('xesam:album'): DBusVariant(DBusString(album!)),
        if (albumArtist != null) DBusString('xesam:albumArtist'): DBusVariant(DBusArray.string(albumArtist!)),
        if (artist != null) DBusString('xesam:artist'): DBusVariant(DBusArray.string(artist!)),
        if (lyrics != null) DBusString('xesam:asText'): DBusVariant(DBusString(lyrics!)),
        if (audioBPM != null) DBusString('xesam:audioBPM'): DBusVariant(DBusInt32(audioBPM!)),
        if (autoRating != null) DBusString('xesam:autoRating'): DBusVariant(DBusDouble(autoRating!)),
        if (comment != null) DBusString('xesam:comment'): DBusVariant(DBusArray.string(comment!)),
        if (composer != null) DBusString('xesam:composer'): DBusVariant(DBusArray.string(composer!)),
        if (contentCreated != null) DBusString('xesam:contentCreated'): DBusVariant(DBusString(contentCreated!.toIso8601String())),
        if (discNumber != null) DBusString('xesam:discNumber'): DBusVariant(DBusInt32(discNumber!)),
        if (firstUsed != null) DBusString('xesam:firstUsed'): DBusVariant(DBusString(firstUsed!.toIso8601String())),
        if (genre != null) DBusString('xesam:genre'): DBusVariant(DBusArray.string(genre!)),
        if (lastUsed != null) DBusString('xesam:lastUsed'): DBusVariant(DBusString(lastUsed!.toIso8601String())),
        if (lyricist != null) DBusString('xesam:lyricist'): DBusVariant(DBusArray.string(lyricist!)),
        if (title != null) DBusString('xesam:title'): DBusVariant(DBusString(title!)),
        if (trackNumber != null) DBusString('xesam:trackNumber'): DBusVariant(DBusInt32(trackNumber!)),
        DBusString('xesam:url'): DBusVariant(DBusString(uri.toString())),
        if (useCount != null) DBusString('xesam:useCount'): DBusVariant(DBusInt32(useCount!)),
        if (userRating != null) DBusString('xesam:userRating'): DBusVariant(DBusDouble(userRating!)),
      },
    );
  }

  MPRISMetadata copyWith({
    Uri? uri,
    Duration? length,
    Uri? artUrl,
    String? album,
    List<String>? albumArtist,
    List<String>? artist,
    String? lyrics,
    int? audioBPM,
    double? autoRating,
    List<String>? comment,
    List<String>? composer,
    DateTime? contentCreated,
    int? discNumber,
    DateTime? firstUsed,
    List<String>? genre,
    DateTime? lastUsed,
    List<String>? lyricist,
    String? title,
    int? trackNumber,
    int? useCount,
    double? userRating,
  }) {
    return MPRISMetadata(
      uri ?? this.uri,
      length: length ?? this.length,
      artUrl: artUrl ?? this.artUrl,
      album: album ?? this.album,
      albumArtist: albumArtist ?? this.albumArtist,
      artist: artist ?? this.artist,
      lyrics: lyrics ?? this.lyrics,
      audioBPM: audioBPM ?? this.audioBPM,
      autoRating: autoRating ?? this.autoRating,
      comment: comment ?? this.comment,
      composer: composer ?? this.composer,
      contentCreated: contentCreated ?? this.contentCreated,
      discNumber: discNumber ?? this.discNumber,
      firstUsed: firstUsed ?? this.firstUsed,
      genre: genre ?? this.genre,
      lastUsed: lastUsed ?? this.lastUsed,
      lyricist: lyricist ?? this.lyricist,
      title: title ?? this.title,
      trackNumber: trackNumber ?? this.trackNumber,
      useCount: useCount ?? this.useCount,
      userRating: userRating ?? this.userRating,
    );
  }
}


/// {@template media_player_2}
/// 
/// MediaPlayer2
/// ------------
/// This implements `org.mpris.MediaPlayer2` & `org.mpris.MediaPlayer2.Player` interfaces.
/// 
/// See: https://specifications.freedesktop.org/mpris-spec/latest/Media_Player.html
/// 
/// The MPRIS specification defines a set of interfaces that can be implemented by media players to allow remote control by other applications.
/// The interfaces are designed to be as generic as possible, so that they can be implemented by a wide range of media players.
/// 
/// Part of this class' code was automatically generated using `package:dbus`.
/// 
/// {@endtemplate}
class MediaPlayer2 extends DBusObject {

  // org.mpris.MediaPlayer2

  bool CanQuit = true;
  bool Fullscreen = false;
  bool CanSetFullscreen = true;
  bool CanRaise = true;
  bool HasTrackList = true;

  // org.mpris.MediaPlayer2.Player

  MPRISPlaybackStatus PlaybackStatus = MPRISPlaybackStatus.paused;
  MPRISLoopStatus LoopStatus = MPRISLoopStatus.none;
  double Rate = 1.0;
  bool Shuffle = false;
  MPRISMetadata Metadata = MPRISMetadata(Uri.parse(''));
  double Volume = 1.0;
  Duration Position = Duration.zero;
  double MinimumRate = 1.0;
  double MaximumRate = 1.0;
  bool CanGoNext = true;
  bool CanGoPrevious = true;
  bool CanPlay = true;
  bool CanPause = true;
  bool CanSeek = true;
  bool CanControl = true;

  final String Identity;
  final String DesktopEntry;
  final Set<String> SupportedUriSchemes;
  final Set<String> SupportedMimeTypes;

  MPRISEventHandler? handler;

  /// {@macro media_player_2}
  MediaPlayer2(
    DBusObjectPath path,
    this.Identity,
    this.DesktopEntry,
    this.SupportedUriSchemes,
    this.SupportedMimeTypes,
  ) : super(path);

  Future<DBusMethodResponse> getCanQuit() async {
    return DBusMethodSuccessResponse([DBusBoolean(CanQuit)]);
  }

  Future<DBusMethodResponse> getFullscreen() async {
    return DBusMethodSuccessResponse([DBusBoolean(Fullscreen)]);
  }

  Future<DBusMethodResponse> setFullscreen(bool Value) async {
    await handler?.fullscreen?.call(Value);
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> getCanSetFullscreen() async {
    return DBusMethodSuccessResponse([DBusBoolean(CanSetFullscreen)]);
  }

  Future<DBusMethodResponse> getCanRaise() async {
    return DBusMethodSuccessResponse([DBusBoolean(CanRaise)]);
  }

  Future<DBusMethodResponse> getHasTrackList() async {
    return DBusMethodSuccessResponse([DBusBoolean(HasTrackList)]);
  }

  Future<DBusMethodResponse> getIdentity() async {
    return DBusMethodSuccessResponse([DBusString(Identity)]);
  }

  Future<DBusMethodResponse> getDesktopEntry() async {
    return DBusMethodSuccessResponse([DBusString(DesktopEntry)]);
  }

  Future<DBusMethodResponse> getSupportedUriSchemes() async {
    return DBusMethodSuccessResponse([DBusArray.string(SupportedUriSchemes)]);
  }

  Future<DBusMethodResponse> getSupportedMimeTypes() async {
    return DBusMethodSuccessResponse([DBusArray.string(SupportedMimeTypes)]);
  }

  Future<DBusMethodResponse> doRaise() async {
    await handler?.raise?.call();
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> doQuit() async {
    await handler?.quit?.call();
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> getPlaybackStatus() async {
    return DBusMethodSuccessResponse([DBusString(PlaybackStatus.name[0].toUpperCase() + PlaybackStatus.name.substring(1))]);
  }

  Future<DBusMethodResponse> getLoopStatus() async {
    return DBusMethodSuccessResponse([DBusString(LoopStatus.name[0].toUpperCase() + LoopStatus.name.substring(1))]);
  }

  Future<DBusMethodResponse> setLoopStatus(String Value) async {
    await handler?.loopStatus?.call({
      'None': MPRISLoopStatus.none,
      'Track': MPRISLoopStatus.track,
      'Playlist': MPRISLoopStatus.playlist,
    }[Value]!);
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> getRate() async {
    return DBusMethodSuccessResponse([DBusDouble(Rate)]);
  }

  Future<DBusMethodResponse> setRate(double Value) async {
    await handler?.rate?.call(Value);
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> getShuffle() async {
    return DBusMethodSuccessResponse([DBusBoolean(Shuffle)]);
  }

  Future<DBusMethodResponse> setShuffle(bool Value) async {
    await handler?.shuffle?.call(Value);
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> getMetadata() async {
    return DBusMethodSuccessResponse([Metadata.toDBusDict()]);
  }

  Future<DBusMethodResponse> getVolume() async {
    return DBusMethodSuccessResponse([DBusDouble(Volume)]);
  }

  Future<DBusMethodResponse> setVolume(double Value) async {
    await handler?.volume?.call(Value);
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> getPosition() async {
    return DBusMethodSuccessResponse([DBusInt64(Position.inMicroseconds)]);
  }

  Future<DBusMethodResponse> getMinimumRate() async {
    return DBusMethodSuccessResponse([DBusDouble(MinimumRate)]);
  }

  Future<DBusMethodResponse> getMaximumRate() async {
    return DBusMethodSuccessResponse([DBusDouble(MaximumRate)]);
  }

  Future<DBusMethodResponse> getCanGoNext() async {
    return DBusMethodSuccessResponse([DBusBoolean(CanGoNext)]);
  }

  Future<DBusMethodResponse> getCanGoPrevious() async {
    return DBusMethodSuccessResponse([DBusBoolean(CanGoPrevious)]);
  }

  Future<DBusMethodResponse> getCanPlay() async {
    return DBusMethodSuccessResponse([DBusBoolean(CanPlay)]);
  }

  Future<DBusMethodResponse> getCanPause() async {
    return DBusMethodSuccessResponse([DBusBoolean(CanPause)]);
  }

  Future<DBusMethodResponse> getCanSeek() async {
    return DBusMethodSuccessResponse([DBusBoolean(CanSeek)]);
  }

  Future<DBusMethodResponse> getCanControl() async {
    return DBusMethodSuccessResponse([DBusBoolean(CanControl)]);
  }

  Future<DBusMethodResponse> doNext() async {
    await handler?.next?.call();
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> doPrevious() async {
    await handler?.previous?.call();
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> doPause() async {
    await handler?.pause?.call();
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> doPlayPause() async {
    await handler?.playPause?.call();
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> doStop() async {
    await handler?.stop?.call();
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> doPlay() async {
    await handler?.play?.call();
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> doSeek(int Offset) async {
    await handler?.seek?.call(Duration(microseconds: Offset));
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> doSetPosition(String TrackId, int Position) async {
    await handler?.setPosition?.call(Uri.parse(utf8.decode(base64.decode(TrackId.substring(1)))), Position);
    return DBusMethodSuccessResponse([]);
  }

  Future<DBusMethodResponse> doOpenUri(String Uri_) async {
    await handler?.openUri?.call(Uri.parse(Uri_));
    return DBusMethodErrorResponse.failed();
  }

  Future<void> emitSeeked(int Offset) async {
    await emitSignal('org.mpris.MediaPlayer2.Player', 'Seeked', [DBusInt64(Offset)]);
  }

  @override
  List<DBusIntrospectInterface> introspect() {
    return [
      DBusIntrospectInterface(
        'org.mpris.MediaPlayer2',
        methods: [
          DBusIntrospectMethod('Raise'),
          DBusIntrospectMethod('Quit')
        ],
        properties: [
          DBusIntrospectProperty('CanQuit', DBusSignature('b'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('Fullscreen', DBusSignature('b'), access: DBusPropertyAccess.readwrite),
          DBusIntrospectProperty('CanSetFullscreen', DBusSignature('b'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('CanRaise', DBusSignature('b'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('HasTrackList', DBusSignature('b'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('Identity', DBusSignature('s'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('DesktopEntry', DBusSignature('s'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('SupportedUriSchemes', DBusSignature('as'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('SupportedMimeTypes', DBusSignature('as'), access: DBusPropertyAccess.read)
        ]
      ),
      DBusIntrospectInterface(
        'org.mpris.MediaPlayer2.Player',
        methods: [
          DBusIntrospectMethod('Next'),
          DBusIntrospectMethod('Previous'),
          DBusIntrospectMethod('Pause'),
          DBusIntrospectMethod('PlayPause'),
          DBusIntrospectMethod('Stop'),
          DBusIntrospectMethod('Play'),
          DBusIntrospectMethod('Seek', args: [DBusIntrospectArgument(DBusSignature('x'), DBusArgumentDirection.in_, name: 'Offset')]),
          DBusIntrospectMethod('SetPosition', args: [DBusIntrospectArgument(DBusSignature('o'), DBusArgumentDirection.in_, name: 'TrackId'), DBusIntrospectArgument(DBusSignature('x'), DBusArgumentDirection.in_, name: 'Position')]),
          DBusIntrospectMethod('OpenUri', args: [DBusIntrospectArgument(DBusSignature('s'), DBusArgumentDirection.in_, name: 'Uri')]),
        ],
        signals: [
          DBusIntrospectSignal('Seeked', args: [DBusIntrospectArgument(DBusSignature('x'), DBusArgumentDirection.out, name: 'Position')]),
        ],
        properties: [
          DBusIntrospectProperty('PlaybackStatus', DBusSignature('s'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('LoopStatus', DBusSignature('s'), access: DBusPropertyAccess.readwrite),
          DBusIntrospectProperty('Rate', DBusSignature('d'), access: DBusPropertyAccess.readwrite),
          DBusIntrospectProperty('Shuffle', DBusSignature('b'), access: DBusPropertyAccess.readwrite),
          DBusIntrospectProperty('Metadata', DBusSignature('a{sv}'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('Volume', DBusSignature('d'), access: DBusPropertyAccess.readwrite),
          DBusIntrospectProperty('Position', DBusSignature('x'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('MinimumRate', DBusSignature('d'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('MaximumRate', DBusSignature('d'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('CanGoNext', DBusSignature('b'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('CanGoPrevious', DBusSignature('b'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('CanPlay', DBusSignature('b'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('CanPause', DBusSignature('b'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('CanSeek', DBusSignature('b'), access: DBusPropertyAccess.read),
          DBusIntrospectProperty('CanControl', DBusSignature('b'), access: DBusPropertyAccess.read),
        ],
      ),
    ];
  }

  @override
  Future<DBusMethodResponse> handleMethodCall(DBusMethodCall methodCall) async {
    if (methodCall.interface == 'org.mpris.MediaPlayer2') {
      if (methodCall.name == 'Raise') {
        if (methodCall.values.isNotEmpty) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return doRaise();
      } else if (methodCall.name == 'Quit') {
        if (methodCall.values.isNotEmpty) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return doQuit();
      } else {
        return DBusMethodErrorResponse.unknownMethod();
      }
    } else if (methodCall.interface == 'org.mpris.MediaPlayer2.Player') {
      if (methodCall.name == 'Next') {
        if (methodCall.values.isNotEmpty) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return doNext();
      } else if (methodCall.name == 'Previous') {
        if (methodCall.values.isNotEmpty) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return doPrevious();
      } else if (methodCall.name == 'Pause') {
        if (methodCall.values.isNotEmpty) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return doPause();
      } else if (methodCall.name == 'PlayPause') {
        if (methodCall.values.isNotEmpty) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return doPlayPause();
      } else if (methodCall.name == 'Stop') {
        if (methodCall.values.isNotEmpty) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return doStop();
      } else if (methodCall.name == 'Play') {
        if (methodCall.values.isNotEmpty) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return doPlay();
      } else if (methodCall.name == 'Seek') {
        if (methodCall.signature != DBusSignature('x')) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return doSeek((methodCall.values[0] as DBusInt64).value);
      } else if (methodCall.name == 'SetPosition') {
        if (methodCall.signature != DBusSignature('ox')) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return doSetPosition((methodCall.values[0] as DBusObjectPath).value, (methodCall.values[1] as DBusInt64).value);
      } else if (methodCall.name == 'OpenUri') {
        if (methodCall.signature != DBusSignature('s')) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return doOpenUri((methodCall.values[0] as DBusString).value);
      } else {
        return DBusMethodErrorResponse.unknownMethod();
      }
    } else {
      return DBusMethodErrorResponse.unknownInterface();
    }
  }

  @override
  Future<DBusMethodResponse> getProperty(String interface, String name) async {
    if (interface == 'org.mpris.MediaPlayer2') {
      if (name == 'CanQuit') {
        return getCanQuit();
      } else if (name == 'Fullscreen') {
        return getFullscreen();
      } else if (name == 'CanSetFullscreen') {
        return getCanSetFullscreen();
      } else if (name == 'CanRaise') {
        return getCanRaise();
      } else if (name == 'HasTrackList') {
        return getHasTrackList();
      } else if (name == 'Identity') {
        return getIdentity();
      } else if (name == 'DesktopEntry') {
        return getDesktopEntry();
      } else if (name == 'SupportedUriSchemes') {
        return getSupportedUriSchemes();
      } else if (name == 'SupportedMimeTypes') {
        return getSupportedMimeTypes();
      } else {
        return DBusMethodErrorResponse.unknownProperty();
      }
    } else if (interface == 'org.mpris.MediaPlayer2.Player') {
      if (name == 'PlaybackStatus') {
        return getPlaybackStatus();
      } else if (name == 'LoopStatus') {
        return getLoopStatus();
      } else if (name == 'Rate') {
        return getRate();
      } else if (name == 'Shuffle') {
        return getShuffle();
      } else if (name == 'Metadata') {
        return getMetadata();
      } else if (name == 'Volume') {
        return getVolume();
      } else if (name == 'Position') {
        return getPosition();
      } else if (name == 'MinimumRate') {
        return getMinimumRate();
      } else if (name == 'MaximumRate') {
        return getMaximumRate();
      } else if (name == 'CanGoNext') {
        return getCanGoNext();
      } else if (name == 'CanGoPrevious') {
        return getCanGoPrevious();
      } else if (name == 'CanPlay') {
        return getCanPlay();
      } else if (name == 'CanPause') {
        return getCanPause();
      } else if (name == 'CanSeek') {
        return getCanSeek();
      } else if (name == 'CanControl') {
        return getCanControl();
      } else {
        return DBusMethodErrorResponse.unknownProperty();
      }
    } else {
      return DBusMethodErrorResponse.unknownProperty();
    }
  }

  @override
  Future<DBusMethodResponse> setProperty(
      String interface, String name, DBusValue value) async {
    if (interface == 'org.mpris.MediaPlayer2') {
      if (name == 'CanQuit') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'Fullscreen') {
        if (value.signature != DBusSignature('b')) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return setFullscreen((value as DBusBoolean).value);
      } else if (name == 'CanSetFullscreen') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'CanRaise') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'HasTrackList') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'Identity') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'DesktopEntry') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'SupportedUriSchemes') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'SupportedMimeTypes') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else {
        return DBusMethodErrorResponse.unknownProperty();
      }
    } else if (interface == 'org.mpris.MediaPlayer2.Player') {
      if (name == 'PlaybackStatus') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'LoopStatus') {
        if (value.signature != DBusSignature('s')) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return setLoopStatus((value as DBusString).value);
      } else if (name == 'Rate') {
        if (value.signature != DBusSignature('d')) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return setRate((value as DBusDouble).value);
      } else if (name == 'Shuffle') {
        if (value.signature != DBusSignature('b')) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return setShuffle((value as DBusBoolean).value);
      } else if (name == 'Metadata') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'Volume') {
        if (value.signature != DBusSignature('d')) {
          return DBusMethodErrorResponse.invalidArgs();
        }
        return setVolume((value as DBusDouble).value);
      } else if (name == 'Position') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'MinimumRate') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'MaximumRate') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'CanGoNext') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'CanGoPrevious') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'CanPlay') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'CanPause') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'CanSeek') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else if (name == 'CanControl') {
        return DBusMethodErrorResponse.propertyReadOnly();
      } else {
        return DBusMethodErrorResponse.unknownProperty();
      }
    } else {
      return DBusMethodErrorResponse.unknownProperty();
    }
  }

  @override
  Future<DBusMethodResponse> getAllProperties(String interface) async {
    var properties = <String, DBusValue>{};
    if (interface == 'org.mpris.MediaPlayer2') {
      properties['CanQuit'] = (await getCanQuit()).returnValues[0];
      properties['Fullscreen'] = (await getFullscreen()).returnValues[0];
      properties['CanSetFullscreen'] = (await getCanSetFullscreen()).returnValues[0];
      properties['CanRaise'] = (await getCanRaise()).returnValues[0];
      properties['HasTrackList'] = (await getHasTrackList()).returnValues[0];
      properties['Identity'] = (await getIdentity()).returnValues[0];
      properties['DesktopEntry'] = (await getDesktopEntry()).returnValues[0];
      properties['SupportedUriSchemes'] = (await getSupportedUriSchemes()).returnValues[0];
      properties['SupportedMimeTypes'] = (await getSupportedMimeTypes()).returnValues[0];
    }
    if (interface == 'org.mpris.MediaPlayer2.Player') {
      properties['PlaybackStatus'] = (await getPlaybackStatus()).returnValues[0];
      properties['LoopStatus'] = (await getLoopStatus()).returnValues[0];
      properties['Rate'] = (await getRate()).returnValues[0];
      properties['Shuffle'] = (await getShuffle()).returnValues[0];
      properties['Metadata'] = (await getMetadata()).returnValues[0];
      properties['Volume'] = (await getVolume()).returnValues[0];
      properties['Position'] = (await getPosition()).returnValues[0];
      properties['MinimumRate'] = (await getMinimumRate()).returnValues[0];
      properties['MaximumRate'] = (await getMaximumRate()).returnValues[0];
      properties['CanGoNext'] = (await getCanGoNext()).returnValues[0];
      properties['CanGoPrevious'] = (await getCanGoPrevious()).returnValues[0];
      properties['CanPlay'] = (await getCanPlay()).returnValues[0];
      properties['CanPause'] = (await getCanPause()).returnValues[0];
      properties['CanSeek'] = (await getCanSeek()).returnValues[0];
      properties['CanControl'] = (await getCanControl()).returnValues[0];
    }
    return DBusMethodSuccessResponse([DBusDict.stringVariant(properties)]);
  }
}