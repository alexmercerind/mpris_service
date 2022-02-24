# [mpris_service.dart](https://github.com/alexmercerind/mpris_service.dart)
Part of [Harmonoid](https://github.com/harmonoid/harmonoid) open-source project.

A Dart library to integrate Media Player Remote Interfacing Specification (MPRIS). 

![4](https://user-images.githubusercontent.com/28951144/155501181-65687693-dfb6-4df6-9e86-7ed29092b461.jpeg)


## Documentation

Following can be a minimal example demonstrating the package usage: 

```dart
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
    isPlaying = !isPlaying;
  }

  @override
  void doNext() {
    index++;
  }

  @override
  void doPrevious() {
    index--;
  }
}
```

## License

GNU Affero General Public License.

Copyright © 2022, [Hitesh Kumar Saini](https://github.com/alexmercerind) <<saini123hitesh@gmail.com>>.

Please check that [Harmonoid](https://github.com/harmonoid/harmonoid), the application itself is available under separate GNU Affero General Public License.
