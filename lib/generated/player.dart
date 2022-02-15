// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object ../mpris-spec/spec/org.mpris.MediaPlayer2.Player.xml

// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:dbus/dbus.dart';

/// Signal data for org.mpris.MediaPlayer2.Player.Seeked.
class Player_InterfaceSeeked extends DBusSignal {
  int get Position => (values[0] as DBusInt64).value;

  Player_InterfaceSeeked(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

class Player_Interface extends DBusRemoteObject {
  /// Stream of org.mpris.MediaPlayer2.Player.Seeked signals.
  late final Stream<Player_InterfaceSeeked> seeked;

  Player_Interface(DBusClient client, String destination,
      {DBusObjectPath path =
          const DBusObjectPath.unchecked('/Player_Interface')})
      : super(client, name: destination, path: path) {
    seeked = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.mpris.MediaPlayer2.Player',
            name: 'Seeked',
            signature: DBusSignature('x'))
        .asBroadcastStream()
        .map((signal) => Player_InterfaceSeeked(signal));
  }

  /// Gets org.mpris.MediaPlayer2.Player.PlaybackStatus
  Future<String> getPlaybackStatus() async {
    var value = await getProperty(
        'org.mpris.MediaPlayer2.Player', 'PlaybackStatus',
        signature: DBusSignature('s'));
    return (value as DBusString).value;
  }

  /// Gets org.mpris.MediaPlayer2.Player.LoopStatus
  Future<String> getLoopStatus() async {
    var value = await getProperty('org.mpris.MediaPlayer2.Player', 'LoopStatus',
        signature: DBusSignature('s'));
    return (value as DBusString).value;
  }

  /// Sets org.mpris.MediaPlayer2.Player.LoopStatus
  Future<void> setLoopStatus(String value) async {
    await setProperty(
        'org.mpris.MediaPlayer2.Player', 'LoopStatus', DBusString(value));
  }

  /// Gets org.mpris.MediaPlayer2.Player.Rate
  Future<double> getRate() async {
    var value = await getProperty('org.mpris.MediaPlayer2.Player', 'Rate',
        signature: DBusSignature('d'));
    return (value as DBusDouble).value;
  }

  /// Sets org.mpris.MediaPlayer2.Player.Rate
  Future<void> setRate(double value) async {
    await setProperty(
        'org.mpris.MediaPlayer2.Player', 'Rate', DBusDouble(value));
  }

  /// Gets org.mpris.MediaPlayer2.Player.Shuffle
  Future<bool> getShuffle() async {
    var value = await getProperty('org.mpris.MediaPlayer2.Player', 'Shuffle',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Sets org.mpris.MediaPlayer2.Player.Shuffle
  Future<void> setShuffle(bool value) async {
    await setProperty(
        'org.mpris.MediaPlayer2.Player', 'Shuffle', DBusBoolean(value));
  }

  /// Gets org.mpris.MediaPlayer2.Player.Metadata
  Future<Map<String, DBusValue>> getMetadata() async {
    var value = await getProperty('org.mpris.MediaPlayer2.Player', 'Metadata',
        signature: DBusSignature('a{sv}'));
    return (value as DBusDict).children.map((key, value) =>
        MapEntry((key as DBusString).value, (value as DBusVariant).value));
  }

  /// Gets org.mpris.MediaPlayer2.Player.Volume
  Future<double> getVolume() async {
    var value = await getProperty('org.mpris.MediaPlayer2.Player', 'Volume',
        signature: DBusSignature('d'));
    return (value as DBusDouble).value;
  }

  /// Sets org.mpris.MediaPlayer2.Player.Volume
  Future<void> setVolume(double value) async {
    await setProperty(
        'org.mpris.MediaPlayer2.Player', 'Volume', DBusDouble(value));
  }

  /// Gets org.mpris.MediaPlayer2.Player.Position
  Future<int> getPosition() async {
    var value = await getProperty('org.mpris.MediaPlayer2.Player', 'Position',
        signature: DBusSignature('x'));
    return (value as DBusInt64).value;
  }

  /// Gets org.mpris.MediaPlayer2.Player.MinimumRate
  Future<double> getMinimumRate() async {
    var value = await getProperty(
        'org.mpris.MediaPlayer2.Player', 'MinimumRate',
        signature: DBusSignature('d'));
    return (value as DBusDouble).value;
  }

  /// Gets org.mpris.MediaPlayer2.Player.MaximumRate
  Future<double> getMaximumRate() async {
    var value = await getProperty(
        'org.mpris.MediaPlayer2.Player', 'MaximumRate',
        signature: DBusSignature('d'));
    return (value as DBusDouble).value;
  }

  /// Gets org.mpris.MediaPlayer2.Player.CanGoNext
  Future<bool> getCanGoNext() async {
    var value = await getProperty('org.mpris.MediaPlayer2.Player', 'CanGoNext',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Gets org.mpris.MediaPlayer2.Player.CanGoPrevious
  Future<bool> getCanGoPrevious() async {
    var value = await getProperty(
        'org.mpris.MediaPlayer2.Player', 'CanGoPrevious',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Gets org.mpris.MediaPlayer2.Player.CanPlay
  Future<bool> getCanPlay() async {
    var value = await getProperty('org.mpris.MediaPlayer2.Player', 'CanPlay',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Gets org.mpris.MediaPlayer2.Player.CanPause
  Future<bool> getCanPause() async {
    var value = await getProperty('org.mpris.MediaPlayer2.Player', 'CanPause',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Gets org.mpris.MediaPlayer2.Player.CanSeek
  Future<bool> getCanSeek() async {
    var value = await getProperty('org.mpris.MediaPlayer2.Player', 'CanSeek',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Gets org.mpris.MediaPlayer2.Player.CanControl
  Future<bool> getCanControl() async {
    var value = await getProperty('org.mpris.MediaPlayer2.Player', 'CanControl',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Invokes org.mpris.MediaPlayer2.Player.Next()
  Future<void> callNext(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.mpris.MediaPlayer2.Player', 'Next', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.mpris.MediaPlayer2.Player.Previous()
  Future<void> callPrevious(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.mpris.MediaPlayer2.Player', 'Previous', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.mpris.MediaPlayer2.Player.Pause()
  Future<void> callPause(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.mpris.MediaPlayer2.Player', 'Pause', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.mpris.MediaPlayer2.Player.PlayPause()
  Future<void> callPlayPause(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.mpris.MediaPlayer2.Player', 'PlayPause', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.mpris.MediaPlayer2.Player.Stop()
  Future<void> callStop(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.mpris.MediaPlayer2.Player', 'Stop', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.mpris.MediaPlayer2.Player.Play()
  Future<void> callPlay(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.mpris.MediaPlayer2.Player', 'Play', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.mpris.MediaPlayer2.Player.Seek()
  Future<void> callSeek(int Offset,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod(
        'org.mpris.MediaPlayer2.Player', 'Seek', [DBusInt64(Offset)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.mpris.MediaPlayer2.Player.SetPosition()
  Future<void> callSetPosition(String TrackId, int Position,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.mpris.MediaPlayer2.Player', 'SetPosition',
        [DBusObjectPath(TrackId), DBusInt64(Position)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.mpris.MediaPlayer2.Player.OpenUri()
  Future<void> callOpenUri(String Uri,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod(
        'org.mpris.MediaPlayer2.Player', 'OpenUri', [DBusString(Uri)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
