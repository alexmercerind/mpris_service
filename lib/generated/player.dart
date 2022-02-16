// This file was generated using the following command and may be overwritten.
// dart-dbus generate-object ../mpris-spec/spec/org.mpris.MediaPlayer2.Player.xml

// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:dbus/dbus.dart';
import 'package:mpris_service/src/mpris_service_base.dart';

class Player_Interface extends DBusObject {
  final MPRISServiceState state;

  /// Creates a new object to expose on [path].
  Player_Interface(this.state,
      {DBusObjectPath path =
          const DBusObjectPath.unchecked('/Player_Interface')})
      : super(path);

  /// Gets value of property org.mpris.MediaPlayer2.Player.PlaybackStatus
  Future<DBusMethodResponse> getPlaybackStatus() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.PlaybackStatus not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.LoopStatus
  Future<DBusMethodResponse> getLoopStatus() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.LoopStatus not implemented');
  }

  /// Sets property org.mpris.MediaPlayer2.Player.LoopStatus
  Future<DBusMethodResponse> setLoopStatus(String value) async {
    return DBusMethodErrorResponse.failed(
        'Set org.mpris.MediaPlayer2.Player.LoopStatus not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.Rate
  Future<DBusMethodResponse> getRate() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.Rate not implemented');
  }

  /// Sets property org.mpris.MediaPlayer2.Player.Rate
  Future<DBusMethodResponse> setRate(double value) async {
    return DBusMethodErrorResponse.failed(
        'Set org.mpris.MediaPlayer2.Player.Rate not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.Shuffle
  Future<DBusMethodResponse> getShuffle() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.Shuffle not implemented');
  }

  /// Sets property org.mpris.MediaPlayer2.Player.Shuffle
  Future<DBusMethodResponse> setShuffle(bool value) async {
    return DBusMethodErrorResponse.failed(
        'Set org.mpris.MediaPlayer2.Player.Shuffle not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.Metadata
  Future<DBusMethodResponse> getMetadata() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.Metadata not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.Volume
  Future<DBusMethodResponse> getVolume() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.Volume not implemented');
  }

  /// Sets property org.mpris.MediaPlayer2.Player.Volume
  Future<DBusMethodResponse> setVolume(double value) async {
    return DBusMethodErrorResponse.failed(
        'Set org.mpris.MediaPlayer2.Player.Volume not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.Position
  Future<DBusMethodResponse> getPosition() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.Position not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.MinimumRate
  Future<DBusMethodResponse> getMinimumRate() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.MinimumRate not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.MaximumRate
  Future<DBusMethodResponse> getMaximumRate() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.MaximumRate not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.CanGoNext
  Future<DBusMethodResponse> getCanGoNext() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.CanGoNext not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.CanGoPrevious
  Future<DBusMethodResponse> getCanGoPrevious() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.CanGoPrevious not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.CanPlay
  Future<DBusMethodResponse> getCanPlay() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.CanPlay not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.CanPause
  Future<DBusMethodResponse> getCanPause() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.CanPause not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.CanSeek
  Future<DBusMethodResponse> getCanSeek() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.CanSeek not implemented');
  }

  /// Gets value of property org.mpris.MediaPlayer2.Player.CanControl
  Future<DBusMethodResponse> getCanControl() async {
    return DBusMethodErrorResponse.failed(
        'Get org.mpris.MediaPlayer2.Player.CanControl not implemented');
  }

  /// Implementation of org.mpris.MediaPlayer2.Player.Next()
  Future<DBusMethodResponse> doNext() async {
    return DBusMethodErrorResponse.failed(
        'org.mpris.MediaPlayer2.Player.Next() not implemented');
  }

  /// Implementation of org.mpris.MediaPlayer2.Player.Previous()
  Future<DBusMethodResponse> doPrevious() async {
    return DBusMethodErrorResponse.failed(
        'org.mpris.MediaPlayer2.Player.Previous() not implemented');
  }

  /// Implementation of org.mpris.MediaPlayer2.Player.Pause()
  Future<DBusMethodResponse> doPause() async {
    return DBusMethodErrorResponse.failed(
        'org.mpris.MediaPlayer2.Player.Pause() not implemented');
  }

  /// Implementation of org.mpris.MediaPlayer2.Player.PlayPause()
  Future<DBusMethodResponse> doPlayPause() async {
    return DBusMethodErrorResponse.failed(
        'org.mpris.MediaPlayer2.Player.PlayPause() not implemented');
  }

  /// Implementation of org.mpris.MediaPlayer2.Player.Stop()
  Future<DBusMethodResponse> doStop() async {
    return DBusMethodErrorResponse.failed(
        'org.mpris.MediaPlayer2.Player.Stop() not implemented');
  }

  /// Implementation of org.mpris.MediaPlayer2.Player.Play()
  Future<DBusMethodResponse> doPlay() async {
    return DBusMethodErrorResponse.failed(
        'org.mpris.MediaPlayer2.Player.Play() not implemented');
  }

  /// Implementation of org.mpris.MediaPlayer2.Player.Seek()
  Future<DBusMethodResponse> doSeek(int Offset) async {
    return DBusMethodErrorResponse.failed(
        'org.mpris.MediaPlayer2.Player.Seek() not implemented');
  }

  /// Implementation of org.mpris.MediaPlayer2.Player.SetPosition()
  Future<DBusMethodResponse> doSetPosition(String TrackId, int Position) async {
    return DBusMethodErrorResponse.failed(
        'org.mpris.MediaPlayer2.Player.SetPosition() not implemented');
  }

  /// Implementation of org.mpris.MediaPlayer2.Player.OpenUri()
  Future<DBusMethodResponse> doOpenUri(String Uri) async {
    return DBusMethodErrorResponse.failed(
        'org.mpris.MediaPlayer2.Player.OpenUri() not implemented');
  }

  /// Emits signal org.mpris.MediaPlayer2.Player.Seeked
  Future<void> emitSeeked(int Position) async {
    await emitSignal(
        'org.mpris.MediaPlayer2.Player', 'Seeked', [DBusInt64(Position)]);
  }

  @override
  List<DBusIntrospectInterface> introspect() {
    return [
      DBusIntrospectInterface('org.mpris.MediaPlayer2.Player', methods: [
        DBusIntrospectMethod('Next'),
        DBusIntrospectMethod('Previous'),
        DBusIntrospectMethod('Pause'),
        DBusIntrospectMethod('PlayPause'),
        DBusIntrospectMethod('Stop'),
        DBusIntrospectMethod('Play'),
        DBusIntrospectMethod('Seek', args: [
          DBusIntrospectArgument(DBusSignature('x'), DBusArgumentDirection.in_,
              name: 'Offset')
        ]),
        DBusIntrospectMethod('SetPosition', args: [
          DBusIntrospectArgument(DBusSignature('o'), DBusArgumentDirection.in_,
              name: 'TrackId'),
          DBusIntrospectArgument(DBusSignature('x'), DBusArgumentDirection.in_,
              name: 'Position')
        ]),
        DBusIntrospectMethod('OpenUri', args: [
          DBusIntrospectArgument(DBusSignature('s'), DBusArgumentDirection.in_,
              name: 'Uri')
        ])
      ], signals: [
        DBusIntrospectSignal('Seeked', args: [
          DBusIntrospectArgument(DBusSignature('x'), DBusArgumentDirection.out,
              name: 'Position')
        ])
      ], properties: [
        DBusIntrospectProperty('PlaybackStatus', DBusSignature('s'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('LoopStatus', DBusSignature('s'),
            access: DBusPropertyAccess.readwrite),
        DBusIntrospectProperty('Rate', DBusSignature('d'),
            access: DBusPropertyAccess.readwrite),
        DBusIntrospectProperty('Shuffle', DBusSignature('b'),
            access: DBusPropertyAccess.readwrite),
        DBusIntrospectProperty('Metadata', DBusSignature('a{sv}'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('Volume', DBusSignature('d'),
            access: DBusPropertyAccess.readwrite),
        DBusIntrospectProperty('Position', DBusSignature('x'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('MinimumRate', DBusSignature('d'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('MaximumRate', DBusSignature('d'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('CanGoNext', DBusSignature('b'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('CanGoPrevious', DBusSignature('b'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('CanPlay', DBusSignature('b'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('CanPause', DBusSignature('b'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('CanSeek', DBusSignature('b'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('CanControl', DBusSignature('b'),
            access: DBusPropertyAccess.read)
      ])
    ];
  }

  @override
  Future<DBusMethodResponse> handleMethodCall(DBusMethodCall methodCall) async {
    if (methodCall.interface == 'org.mpris.MediaPlayer2.Player') {
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
        return doSetPosition((methodCall.values[0] as DBusObjectPath).value,
            (methodCall.values[1] as DBusInt64).value);
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
    if (interface == 'org.mpris.MediaPlayer2.Player') {
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
    if (interface == 'org.mpris.MediaPlayer2.Player') {
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
    if (interface == 'org.mpris.MediaPlayer2.Player') {
      // properties['PlaybackStatus'] =
      //     (await getPlaybackStatus()).returnValues[0];
      // properties['LoopStatus'] = (await getLoopStatus()).returnValues[0];
      // properties['Rate'] = (await getRate()).returnValues[0];
      // properties['Shuffle'] = (await getShuffle()).returnValues[0];
      // properties['Metadata'] = (await getMetadata()).returnValues[0];
      // properties['Volume'] = (await getVolume()).returnValues[0];
      // properties['Position'] = (await getPosition()).returnValues[0];
      // properties['MinimumRate'] = (await getMinimumRate()).returnValues[0];
      // properties['MaximumRate'] = (await getMaximumRate()).returnValues[0];
      // properties['CanGoNext'] = (await getCanGoNext()).returnValues[0];
      // properties['CanGoPrevious'] = (await getCanGoPrevious()).returnValues[0];
      // properties['CanPlay'] = (await getCanPlay()).returnValues[0];
      // properties['CanPause'] = (await getCanPause()).returnValues[0];
      // properties['CanSeek'] = (await getCanSeek()).returnValues[0];
      // properties['CanControl'] = (await getCanControl()).returnValues[0];
    }
    return DBusMethodSuccessResponse([DBusDict.stringVariant(properties)]);
  }
}

// // This file was generated using the following command and may be overwritten.
// // dart-dbus generate-remote-object ../mpris-spec/spec/org.mpris.MediaPlayer2.Player.xml

// // ignore_for_file: camel_case_types, non_constant_identifier_names

// import 'package:dbus/dbus.dart';

// /// Signal data for org.mpris.MediaPlayer2.Player.Seeked.
// class Player_InterfaceSeeked extends DBusSignal {
//   int get Position => (values[0] as DBusInt64).value;

//   Player_InterfaceSeeked(DBusSignal signal)
//       : super(
//             sender: signal.sender,
//             path: signal.path,
//             interface: signal.interface,
//             name: signal.name,
//             values: signal.values);
// }

// class Player_Interface extends DBusRemoteObject {
//   /// Stream of org.mpris.MediaPlayer2.Player.Seeked signals.
//   late final Stream<Player_InterfaceSeeked> seeked;

//   Player_Interface(DBusClient client, String destination,
//       {DBusObjectPath path =
//           const DBusObjectPath.unchecked('/Player_Interface')})
//       : super(client, name: destination, path: path) {
//     seeked = DBusRemoteObjectSignalStream(
//             object: this,
//             interface: 'org.mpris.MediaPlayer2.Player',
//             name: 'Seeked',
//             signature: DBusSignature('x'))
//         .asBroadcastStream()
//         .map((signal) => Player_InterfaceSeeked(signal));
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.PlaybackStatus
//   Future<String> getPlaybackStatus() async {
//     var value = await getProperty(
//         'org.mpris.MediaPlayer2.Player', 'PlaybackStatus',
//         signature: DBusSignature('s'));
//     return (value as DBusString).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.LoopStatus
//   Future<String> getLoopStatus() async {
//     var value = await getProperty('org.mpris.MediaPlayer2.Player', 'LoopStatus',
//         signature: DBusSignature('s'));
//     return (value as DBusString).value;
//   }

//   /// Sets org.mpris.MediaPlayer2.Player.LoopStatus
//   Future<void> setLoopStatus(String value) async {
//     await setProperty(
//         'org.mpris.MediaPlayer2.Player', 'LoopStatus', DBusString(value));
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.Rate
//   Future<double> getRate() async {
//     var value = await getProperty('org.mpris.MediaPlayer2.Player', 'Rate',
//         signature: DBusSignature('d'));
//     return (value as DBusDouble).value;
//   }

//   /// Sets org.mpris.MediaPlayer2.Player.Rate
//   Future<void> setRate(double value) async {
//     await setProperty(
//         'org.mpris.MediaPlayer2.Player', 'Rate', DBusDouble(value));
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.Shuffle
//   Future<bool> getShuffle() async {
//     var value = await getProperty('org.mpris.MediaPlayer2.Player', 'Shuffle',
//         signature: DBusSignature('b'));
//     return (value as DBusBoolean).value;
//   }

//   /// Sets org.mpris.MediaPlayer2.Player.Shuffle
//   Future<void> setShuffle(bool value) async {
//     await setProperty(
//         'org.mpris.MediaPlayer2.Player', 'Shuffle', DBusBoolean(value));
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.Metadata
//   Future<Map<String, DBusValue>> getMetadata() async {
//     var value = await getProperty('org.mpris.MediaPlayer2.Player', 'Metadata',
//         signature: DBusSignature('a{sv}'));
//     return (value as DBusDict).children.map((key, value) =>
//         MapEntry((key as DBusString).value, (value as DBusVariant).value));
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.Volume
//   Future<double> getVolume() async {
//     var value = await getProperty('org.mpris.MediaPlayer2.Player', 'Volume',
//         signature: DBusSignature('d'));
//     return (value as DBusDouble).value;
//   }

//   /// Sets org.mpris.MediaPlayer2.Player.Volume
//   Future<void> setVolume(double value) async {
//     await setProperty(
//         'org.mpris.MediaPlayer2.Player', 'Volume', DBusDouble(value));
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.Position
//   Future<int> getPosition() async {
//     var value = await getProperty('org.mpris.MediaPlayer2.Player', 'Position',
//         signature: DBusSignature('x'));
//     return (value as DBusInt64).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.MinimumRate
//   Future<double> getMinimumRate() async {
//     var value = await getProperty(
//         'org.mpris.MediaPlayer2.Player', 'MinimumRate',
//         signature: DBusSignature('d'));
//     return (value as DBusDouble).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.MaximumRate
//   Future<double> getMaximumRate() async {
//     var value = await getProperty(
//         'org.mpris.MediaPlayer2.Player', 'MaximumRate',
//         signature: DBusSignature('d'));
//     return (value as DBusDouble).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.CanGoNext
//   Future<bool> getCanGoNext() async {
//     var value = await getProperty('org.mpris.MediaPlayer2.Player', 'CanGoNext',
//         signature: DBusSignature('b'));
//     return (value as DBusBoolean).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.CanGoPrevious
//   Future<bool> getCanGoPrevious() async {
//     var value = await getProperty(
//         'org.mpris.MediaPlayer2.Player', 'CanGoPrevious',
//         signature: DBusSignature('b'));
//     return (value as DBusBoolean).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.CanPlay
//   Future<bool> getCanPlay() async {
//     var value = await getProperty('org.mpris.MediaPlayer2.Player', 'CanPlay',
//         signature: DBusSignature('b'));
//     return (value as DBusBoolean).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.CanPause
//   Future<bool> getCanPause() async {
//     var value = await getProperty('org.mpris.MediaPlayer2.Player', 'CanPause',
//         signature: DBusSignature('b'));
//     return (value as DBusBoolean).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.CanSeek
//   Future<bool> getCanSeek() async {
//     var value = await getProperty('org.mpris.MediaPlayer2.Player', 'CanSeek',
//         signature: DBusSignature('b'));
//     return (value as DBusBoolean).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.Player.CanControl
//   Future<bool> getCanControl() async {
//     var value = await getProperty('org.mpris.MediaPlayer2.Player', 'CanControl',
//         signature: DBusSignature('b'));
//     return (value as DBusBoolean).value;
//   }

//   /// Invokes org.mpris.MediaPlayer2.Player.Next()
//   Future<void> callNext(
//       {bool noAutoStart = false,
//       bool allowInteractiveAuthorization = false}) async {
//     await callMethod('org.mpris.MediaPlayer2.Player', 'Next', [],
//         replySignature: DBusSignature(''),
//         noAutoStart: noAutoStart,
//         allowInteractiveAuthorization: allowInteractiveAuthorization);
//   }

//   /// Invokes org.mpris.MediaPlayer2.Player.Previous()
//   Future<void> callPrevious(
//       {bool noAutoStart = false,
//       bool allowInteractiveAuthorization = false}) async {
//     await callMethod('org.mpris.MediaPlayer2.Player', 'Previous', [],
//         replySignature: DBusSignature(''),
//         noAutoStart: noAutoStart,
//         allowInteractiveAuthorization: allowInteractiveAuthorization);
//   }

//   /// Invokes org.mpris.MediaPlayer2.Player.Pause()
//   Future<void> callPause(
//       {bool noAutoStart = false,
//       bool allowInteractiveAuthorization = false}) async {
//     await callMethod('org.mpris.MediaPlayer2.Player', 'Pause', [],
//         replySignature: DBusSignature(''),
//         noAutoStart: noAutoStart,
//         allowInteractiveAuthorization: allowInteractiveAuthorization);
//   }

//   /// Invokes org.mpris.MediaPlayer2.Player.PlayPause()
//   Future<void> callPlayPause(
//       {bool noAutoStart = false,
//       bool allowInteractiveAuthorization = false}) async {
//     await callMethod('org.mpris.MediaPlayer2.Player', 'PlayPause', [],
//         replySignature: DBusSignature(''),
//         noAutoStart: noAutoStart,
//         allowInteractiveAuthorization: allowInteractiveAuthorization);
//   }

//   /// Invokes org.mpris.MediaPlayer2.Player.Stop()
//   Future<void> callStop(
//       {bool noAutoStart = false,
//       bool allowInteractiveAuthorization = false}) async {
//     await callMethod('org.mpris.MediaPlayer2.Player', 'Stop', [],
//         replySignature: DBusSignature(''),
//         noAutoStart: noAutoStart,
//         allowInteractiveAuthorization: allowInteractiveAuthorization);
//   }

//   /// Invokes org.mpris.MediaPlayer2.Player.Play()
//   Future<void> callPlay(
//       {bool noAutoStart = false,
//       bool allowInteractiveAuthorization = false}) async {
//     await callMethod('org.mpris.MediaPlayer2.Player', 'Play', [],
//         replySignature: DBusSignature(''),
//         noAutoStart: noAutoStart,
//         allowInteractiveAuthorization: allowInteractiveAuthorization);
//   }

//   /// Invokes org.mpris.MediaPlayer2.Player.Seek()
//   Future<void> callSeek(int Offset,
//       {bool noAutoStart = false,
//       bool allowInteractiveAuthorization = false}) async {
//     await callMethod(
//         'org.mpris.MediaPlayer2.Player', 'Seek', [DBusInt64(Offset)],
//         replySignature: DBusSignature(''),
//         noAutoStart: noAutoStart,
//         allowInteractiveAuthorization: allowInteractiveAuthorization);
//   }

//   /// Invokes org.mpris.MediaPlayer2.Player.SetPosition()
//   Future<void> callSetPosition(String TrackId, int Position,
//       {bool noAutoStart = false,
//       bool allowInteractiveAuthorization = false}) async {
//     await callMethod('org.mpris.MediaPlayer2.Player', 'SetPosition',
//         [DBusObjectPath(TrackId), DBusInt64(Position)],
//         replySignature: DBusSignature(''),
//         noAutoStart: noAutoStart,
//         allowInteractiveAuthorization: allowInteractiveAuthorization);
//   }

//   /// Invokes org.mpris.MediaPlayer2.Player.OpenUri()
//   Future<void> callOpenUri(String Uri,
//       {bool noAutoStart = false,
//       bool allowInteractiveAuthorization = false}) async {
//     await callMethod(
//         'org.mpris.MediaPlayer2.Player', 'OpenUri', [DBusString(Uri)],
//         replySignature: DBusSignature(''),
//         noAutoStart: noAutoStart,
//         allowInteractiveAuthorization: allowInteractiveAuthorization);
//   }
// }
