# meal-app

A Flutter application for meal planning and management.

## Development

```sh
flutter pub get
flutter run
```

Before pushing, run the same checks as CI:

```sh
dart format --output=none --set-exit-if-changed .
flutter analyze --fatal-infos
flutter test
```

The Flutter version is pinned in `pubspec.yaml`; CI reads it from there.
