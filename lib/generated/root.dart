// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object ../mpris-spec/spec/org.mpris.MediaPlayer2.xml

// ignore_for_file: camel_case_types

import 'package:dbus/dbus.dart';

class Media_Player extends DBusRemoteObject {
  Media_Player(DBusClient client, String destination,
      {DBusObjectPath path = const DBusObjectPath.unchecked('/Media_Player')})
      : super(client, name: destination, path: path);

  /// Gets org.mpris.MediaPlayer2.CanQuit
  Future<bool> getCanQuit() async {
    var value = await getProperty('org.mpris.MediaPlayer2', 'CanQuit',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Gets org.mpris.MediaPlayer2.Fullscreen
  Future<bool> getFullscreen() async {
    var value = await getProperty('org.mpris.MediaPlayer2', 'Fullscreen',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Sets org.mpris.MediaPlayer2.Fullscreen
  Future<void> setFullscreen(bool value) async {
    await setProperty(
        'org.mpris.MediaPlayer2', 'Fullscreen', DBusBoolean(value));
  }

  /// Gets org.mpris.MediaPlayer2.CanSetFullscreen
  Future<bool> getCanSetFullscreen() async {
    var value = await getProperty('org.mpris.MediaPlayer2', 'CanSetFullscreen',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Gets org.mpris.MediaPlayer2.CanRaise
  Future<bool> getCanRaise() async {
    var value = await getProperty('org.mpris.MediaPlayer2', 'CanRaise',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Gets org.mpris.MediaPlayer2.HasTrackList
  Future<bool> getHasTrackList() async {
    var value = await getProperty('org.mpris.MediaPlayer2', 'HasTrackList',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Gets org.mpris.MediaPlayer2.Identity
  Future<String> getIdentity() async {
    var value = await getProperty('org.mpris.MediaPlayer2', 'Identity',
        signature: DBusSignature('s'));
    return (value as DBusString).value;
  }

  /// Gets org.mpris.MediaPlayer2.DesktopEntry
  Future<String> getDesktopEntry() async {
    var value = await getProperty('org.mpris.MediaPlayer2', 'DesktopEntry',
        signature: DBusSignature('s'));
    return (value as DBusString).value;
  }

  /// Gets org.mpris.MediaPlayer2.SupportedUriSchemes
  Future<List<String>> getSupportedUriSchemes() async {
    var value = await getProperty(
        'org.mpris.MediaPlayer2', 'SupportedUriSchemes',
        signature: DBusSignature('as'));
    return (value as DBusArray)
        .children
        .map((child) => (child as DBusString).value)
        .toList();
  }

  /// Gets org.mpris.MediaPlayer2.SupportedMimeTypes
  Future<List<String>> getSupportedMimeTypes() async {
    var value = await getProperty(
        'org.mpris.MediaPlayer2', 'SupportedMimeTypes',
        signature: DBusSignature('as'));
    return (value as DBusArray)
        .children
        .map((child) => (child as DBusString).value)
        .toList();
  }

  /// Invokes org.mpris.MediaPlayer2.Raise()
  Future<void> callRaise(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.mpris.MediaPlayer2', 'Raise', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.mpris.MediaPlayer2.Quit()
  Future<void> callQuit(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.mpris.MediaPlayer2', 'Quit', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
