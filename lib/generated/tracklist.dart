// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object ../mpris-spec/spec/org.mpris.MediaPlayer2.TrackList.xml

// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:dbus/dbus.dart';

/// Signal data for org.mpris.MediaPlayer2.TrackList.TrackListReplaced.
class Track_List_InterfaceTrackListReplaced extends DBusSignal {
  List<String> get Tracks => (values[0] as DBusArray)
      .children
      .map((child) => (child as DBusObjectPath).value)
      .toList();
  String get CurrentTrack => (values[1] as DBusObjectPath).value;

  Track_List_InterfaceTrackListReplaced(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

/// Signal data for org.mpris.MediaPlayer2.TrackList.TrackAdded.
class Track_List_InterfaceTrackAdded extends DBusSignal {
  Map<String, DBusValue> get Metadata =>
      (values[0] as DBusDict).children.map((key, value) =>
          MapEntry((key as DBusString).value, (value as DBusVariant).value));
  String get AfterTrack => (values[1] as DBusObjectPath).value;

  Track_List_InterfaceTrackAdded(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

/// Signal data for org.mpris.MediaPlayer2.TrackList.TrackRemoved.
class Track_List_InterfaceTrackRemoved extends DBusSignal {
  String get TrackId => (values[0] as DBusObjectPath).value;

  Track_List_InterfaceTrackRemoved(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

/// Signal data for org.mpris.MediaPlayer2.TrackList.TrackMetadataChanged.
class Track_List_InterfaceTrackMetadataChanged extends DBusSignal {
  String get TrackId => (values[0] as DBusObjectPath).value;
  Map<String, DBusValue> get Metadata =>
      (values[1] as DBusDict).children.map((key, value) =>
          MapEntry((key as DBusString).value, (value as DBusVariant).value));

  Track_List_InterfaceTrackMetadataChanged(DBusSignal signal)
      : super(
            sender: signal.sender,
            path: signal.path,
            interface: signal.interface,
            name: signal.name,
            values: signal.values);
}

class Track_List_Interface extends DBusRemoteObject {
  /// Stream of org.mpris.MediaPlayer2.TrackList.TrackListReplaced signals.
  late final Stream<Track_List_InterfaceTrackListReplaced> trackListReplaced;

  /// Stream of org.mpris.MediaPlayer2.TrackList.TrackAdded signals.
  late final Stream<Track_List_InterfaceTrackAdded> trackAdded;

  /// Stream of org.mpris.MediaPlayer2.TrackList.TrackRemoved signals.
  late final Stream<Track_List_InterfaceTrackRemoved> trackRemoved;

  /// Stream of org.mpris.MediaPlayer2.TrackList.TrackMetadataChanged signals.
  late final Stream<Track_List_InterfaceTrackMetadataChanged>
      trackMetadataChanged;

  Track_List_Interface(DBusClient client, String destination,
      {DBusObjectPath path =
          const DBusObjectPath.unchecked('/Track_List_Interface')})
      : super(client, name: destination, path: path) {
    trackListReplaced = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.mpris.MediaPlayer2.TrackList',
            name: 'TrackListReplaced',
            signature: DBusSignature('aoo'))
        .asBroadcastStream()
        .map((signal) => Track_List_InterfaceTrackListReplaced(signal));

    trackAdded = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.mpris.MediaPlayer2.TrackList',
            name: 'TrackAdded',
            signature: DBusSignature('a{sv}o'))
        .asBroadcastStream()
        .map((signal) => Track_List_InterfaceTrackAdded(signal));

    trackRemoved = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.mpris.MediaPlayer2.TrackList',
            name: 'TrackRemoved',
            signature: DBusSignature('o'))
        .asBroadcastStream()
        .map((signal) => Track_List_InterfaceTrackRemoved(signal));

    trackMetadataChanged = DBusRemoteObjectSignalStream(
            object: this,
            interface: 'org.mpris.MediaPlayer2.TrackList',
            name: 'TrackMetadataChanged',
            signature: DBusSignature('oa{sv}'))
        .asBroadcastStream()
        .map((signal) => Track_List_InterfaceTrackMetadataChanged(signal));
  }

  /// Gets org.mpris.MediaPlayer2.TrackList.Tracks
  Future<List<String>> getTracks() async {
    var value = await getProperty('org.mpris.MediaPlayer2.TrackList', 'Tracks',
        signature: DBusSignature('ao'));
    return (value as DBusArray)
        .children
        .map((child) => (child as DBusObjectPath).value)
        .toList();
  }

  /// Gets org.mpris.MediaPlayer2.TrackList.CanEditTracks
  Future<bool> getCanEditTracks() async {
    var value = await getProperty(
        'org.mpris.MediaPlayer2.TrackList', 'CanEditTracks',
        signature: DBusSignature('b'));
    return (value as DBusBoolean).value;
  }

  /// Invokes org.mpris.MediaPlayer2.TrackList.GetTracksMetadata()
  Future<List<Map<String, DBusValue>>> callGetTracksMetadata(
      List<String> TrackIds,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.mpris.MediaPlayer2.TrackList',
        'GetTracksMetadata',
        [DBusArray.objectPath(TrackIds.map((e) => DBusObjectPath(e)))],
        replySignature: DBusSignature('aa{sv}'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return (result.returnValues[0] as DBusArray)
        .children
        .map((child) => (child as DBusDict).children.map((key, value) =>
            MapEntry((key as DBusString).value, (value as DBusVariant).value)))
        .toList();
  }

  /// Invokes org.mpris.MediaPlayer2.TrackList.AddTrack()
  Future<void> callAddTrack(String Uri, String AfterTrack, bool SetAsCurrent,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod(
        'org.mpris.MediaPlayer2.TrackList',
        'AddTrack',
        [
          DBusString(Uri),
          DBusObjectPath(AfterTrack),
          DBusBoolean(SetAsCurrent)
        ],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.mpris.MediaPlayer2.TrackList.RemoveTrack()
  Future<void> callRemoveTrack(String TrackId,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.mpris.MediaPlayer2.TrackList', 'RemoveTrack',
        [DBusObjectPath(TrackId)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.mpris.MediaPlayer2.TrackList.GoTo()
  Future<void> callGoTo(String TrackId,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod(
        'org.mpris.MediaPlayer2.TrackList', 'GoTo', [DBusObjectPath(TrackId)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
