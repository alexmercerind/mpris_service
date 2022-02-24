/// [mpris_service.dart](https://github.com/harmonoid/mpris_service.dart)
/// ---------------------------------------------------------------------
///
/// This class can be used to expose a media player functionalities to The Media Player Remote Interfacing Specification (MPRIS) in standard D-Bus interface.
///
/// _Example_
/// ```dart
/// class Harmonoid extends MPRISService {
///   Harmonoid()
///       : super(
///           'harmonoid',
///           identity: 'Harmonoid',
///           desktopEntry: '/usr/share/applications/harmonoid.desktop',
///         );
///
///   @override
///   void doPlayPause() {
///      isPlaying = !isPlaying;
///   }
///
///   @override
///   void doNext() {
///     index++;
///   }
///
///   @override
///   void doPrevious() {
///     index--;
///   }
/// }
/// ```
///
///
library mpris_service;

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

export 'package:mpris_service/src/mpris_service.dart';
