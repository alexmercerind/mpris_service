// This file was generated using the following command and may be overwritten.
// dart-dbus generate-object ../mpris-spec/spec/org.mpris.MediaPlayer2.xml

// ignore_for_file: camel_case_types

import 'package:dbus/dbus.dart';
import 'package:mpris_service/src/mpris_service_base.dart';

class Media_Player extends DBusObject {
  final MPRISServiceState state;

  /// Creates a new object to expose on [path].
  Media_Player(this.state,
      {DBusObjectPath path = const DBusObjectPath.unchecked('/Media_Player')})
      : super(path);

  /// Gets value of property org.mpris.MediaPlayer2.CanQuit
  Future<DBusMethodResponse> getCanQuit() async {
    return DBusMethodSuccessResponse([DBusBoolean(state.canQuit)]);
  }

  /// Gets value of property org.mpris.MediaPlayer2.Fullscreen
  Future<DBusMethodResponse> getFullscreen() async {
    return DBusMethodSuccessResponse([DBusBoolean(state.fullscreen)]);
  }

  /// Sets property org.mpris.MediaPlayer2.Fullscreen
  Future<DBusMethodResponse> setFullscreen(bool value) async {
    state.setFullscreen?.call(value);
    return DBusMethodSuccessResponse();
  }

  /// Gets value of property org.mpris.MediaPlayer2.CanSetFullscreen
  Future<DBusMethodResponse> getCanSetFullscreen() async {
    return DBusMethodSuccessResponse([DBusBoolean(state.canSetFullscreen)]);
  }

  /// Gets value of property org.mpris.MediaPlayer2.CanRaise
  Future<DBusMethodResponse> getCanRaise() async {
    return DBusMethodSuccessResponse([DBusBoolean(state.canRaise)]);
  }

  /// Gets value of property org.mpris.MediaPlayer2.HasTrackList
  Future<DBusMethodResponse> getHasTrackList() async {
    return DBusMethodSuccessResponse([DBusBoolean(state.hasTrackList)]);
  }

  /// Gets value of property org.mpris.MediaPlayer2.Identity
  Future<DBusMethodResponse> getIdentity() async {
    return DBusMethodSuccessResponse([DBusString(state.identity)]);
  }

  /// Gets value of property org.mpris.MediaPlayer2.DesktopEntry
  Future<DBusMethodResponse> getDesktopEntry() async {
    return DBusMethodSuccessResponse([DBusString(state.desktopEntry)]);
  }

  /// Gets value of property org.mpris.MediaPlayer2.SupportedUriSchemes
  Future<DBusMethodResponse> getSupportedUriSchemes() async {
    return DBusMethodSuccessResponse(
      [
        DBusArray(
          DBusSignature('s'),
          state.supportedUriSchemes.map((e) => DBusString(e)),
        )
      ],
    );
  }

  /// Gets value of property org.mpris.MediaPlayer2.SupportedMimeTypes
  Future<DBusMethodResponse> getSupportedMimeTypes() async {
    return DBusMethodSuccessResponse(
      [
        DBusArray(
          DBusSignature('s'),
          state.supportedMimeTypes.map((e) => DBusString(e)),
        )
      ],
    );
  }

  /// Implementation of org.mpris.MediaPlayer2.Raise()
  Future<DBusMethodResponse> doRaise() async {
    state.doRaise?.call();
    return DBusMethodSuccessResponse();
  }

  /// Implementation of org.mpris.MediaPlayer2.Quit()
  Future<DBusMethodResponse> doQuit() async {
    state.doQuit?.call();
    return DBusMethodSuccessResponse();
  }

  @override
  List<DBusIntrospectInterface> introspect() {
    return [
      DBusIntrospectInterface('org.mpris.MediaPlayer2', methods: [
        DBusIntrospectMethod('Raise'),
        DBusIntrospectMethod('Quit')
      ], properties: [
        DBusIntrospectProperty('CanQuit', DBusSignature('b'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('Fullscreen', DBusSignature('b'),
            access: DBusPropertyAccess.readwrite),
        DBusIntrospectProperty('CanSetFullscreen', DBusSignature('b'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('CanRaise', DBusSignature('b'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('HasTrackList', DBusSignature('b'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('Identity', DBusSignature('s'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('DesktopEntry', DBusSignature('s'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('SupportedUriSchemes', DBusSignature('as'),
            access: DBusPropertyAccess.read),
        DBusIntrospectProperty('SupportedMimeTypes', DBusSignature('as'),
            access: DBusPropertyAccess.read)
      ])
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
      properties['CanSetFullscreen'] =
          (await getCanSetFullscreen()).returnValues[0];
      properties['CanRaise'] = (await getCanRaise()).returnValues[0];
      properties['HasTrackList'] = (await getHasTrackList()).returnValues[0];
      properties['Identity'] = (await getIdentity()).returnValues[0];
      properties['DesktopEntry'] = (await getDesktopEntry()).returnValues[0];
      properties['SupportedUriSchemes'] =
          (await getSupportedUriSchemes()).returnValues[0];
      properties['SupportedMimeTypes'] =
          (await getSupportedMimeTypes()).returnValues[0];
    }
    return DBusMethodSuccessResponse([DBusDict.stringVariant(properties)]);
  }
}

// // This file was generated using the following command and may be overwritten.
// // dart-dbus generate-remote-object ../mpris-spec/spec/org.mpris.MediaPlayer2.xml

// // ignore_for_file: camel_case_types

// import 'package:dbus/dbus.dart';

// class Media_Player extends DBusRemoteObject {
//   Media_Player(DBusClient client, String destination,
//       {DBusObjectPath path = const DBusObjectPath.unchecked('/Media_Player')})
//       : super(client, name: destination, path: path);

//   /// Gets org.mpris.MediaPlayer2.CanQuit
//   Future<bool> getCanQuit() async {
//     var value = await getProperty('org.mpris.MediaPlayer2', 'CanQuit',
//         signature: DBusSignature('b'));
//     return (value as DBusBoolean).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.Fullscreen
//   Future<bool> getFullscreen() async {
//     var value = await getProperty('org.mpris.MediaPlayer2', 'Fullscreen',
//         signature: DBusSignature('b'));
//     return (value as DBusBoolean).value;
//   }

//   /// Sets org.mpris.MediaPlayer2.Fullscreen
//   Future<void> setFullscreen(bool value) async {
//     await setProperty(
//         'org.mpris.MediaPlayer2', 'Fullscreen', DBusBoolean(value));
//   }

//   /// Gets org.mpris.MediaPlayer2.CanSetFullscreen
//   Future<bool> getCanSetFullscreen() async {
//     var value = await getProperty('org.mpris.MediaPlayer2', 'CanSetFullscreen',
//         signature: DBusSignature('b'));
//     return (value as DBusBoolean).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.CanRaise
//   Future<bool> getCanRaise() async {
//     var value = await getProperty('org.mpris.MediaPlayer2', 'CanRaise',
//         signature: DBusSignature('b'));
//     return (value as DBusBoolean).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.HasTrackList
//   Future<bool> getHasTrackList() async {
//     var value = await getProperty('org.mpris.MediaPlayer2', 'HasTrackList',
//         signature: DBusSignature('b'));
//     return (value as DBusBoolean).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.Identity
//   Future<String> getIdentity() async {
//     var value = await getProperty('org.mpris.MediaPlayer2', 'Identity',
//         signature: DBusSignature('s'));
//     return (value as DBusString).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.DesktopEntry
//   Future<String> getDesktopEntry() async {
//     var value = await getProperty('org.mpris.MediaPlayer2', 'DesktopEntry',
//         signature: DBusSignature('s'));
//     return (value as DBusString).value;
//   }

//   /// Gets org.mpris.MediaPlayer2.SupportedUriSchemes
//   Future<List<String>> getSupportedUriSchemes() async {
//     var value = await getProperty(
//         'org.mpris.MediaPlayer2', 'SupportedUriSchemes',
//         signature: DBusSignature('as'));
//     return (value as DBusArray)
//         .children
//         .map((child) => (child as DBusString).value)
//         .toList();
//   }

//   /// Gets org.mpris.MediaPlayer2.SupportedMimeTypes
//   Future<List<String>> getSupportedMimeTypes() async {
//     var value = await getProperty(
//         'org.mpris.MediaPlayer2', 'SupportedMimeTypes',
//         signature: DBusSignature('as'));
//     return (value as DBusArray)
//         .children
//         .map((child) => (child as DBusString).value)
//         .toList();
//   }

//   /// Invokes org.mpris.MediaPlayer2.Raise()
//   Future<void> callRaise(
//       {bool noAutoStart = false,
//       bool allowInteractiveAuthorization = false}) async {
//     await callMethod('org.mpris.MediaPlayer2', 'Raise', [],
//         replySignature: DBusSignature(''),
//         noAutoStart: noAutoStart,
//         allowInteractiveAuthorization: allowInteractiveAuthorization);
//   }

//   /// Invokes org.mpris.MediaPlayer2.Quit()
//   Future<void> callQuit(
//       {bool noAutoStart = false,
//       bool allowInteractiveAuthorization = false}) async {
//     await callMethod('org.mpris.MediaPlayer2', 'Quit', [],
//         replySignature: DBusSignature(''),
//         noAutoStart: noAutoStart,
//         allowInteractiveAuthorization: allowInteractiveAuthorization);
//   }
// }
