# meal-app

A Flutter application for meal planning and management.

## Overview

A multi-screen app with navigation between screens and a navigation drawer
for moving around the app.

> **Status:** early development. The project scaffold, tooling and CI are in
> place; the screens below are the planned structure.

## Features

- Multi-screen navigation (Navigator routes)
- Navigation drawer for switching between top-level screens
- Meal planning and management (planned)

## Planned screens

| Screen | Purpose |
| --- | --- |
| Home | Entry point and overview |
| Meals | Browse and manage meals |
| Planner | Plan meals across the week |
| Settings | App preferences |

The drawer links to each top-level screen; detail screens are pushed on top
with the Navigator.

## Tech stack

- [Flutter](https://flutter.dev) 3.41.7 (pinned in `pubspec.yaml`) / Dart 3.11
- Material design with `Theme` / `ColorScheme`-based styling
- GitHub Actions for CI, Dependabot for dependency updates

## Getting started

Prerequisites: the Flutter SDK version pinned in `pubspec.yaml`.

```sh
git clone git@github.com:binarytracer/meal-app.git
cd meal-app
flutter pub get
flutter run
```

## Quality checks

CI runs on every push to `main` and on pull requests. Run the same checks
locally before pushing:

```sh
dart format --output=none --set-exit-if-changed .
flutter analyze --fatal-infos
flutter test
```

The analyzer runs in strict mode (`strict-casts`, `strict-inference`,
`strict-raw-types`) with extra lint rules; see `analysis_options.yaml`.

## Project structure

Feature-first layout under `lib/`:

```
lib/
├── core/                 # shared theme, routing, widgets
└── features/<feature>/   # data / domain / presentation per feature
```

## Roadmap

- [ ] App shell: drawer and screen routing
- [ ] Meal list and detail screens
- [ ] Weekly planner
- [ ] Choose state management and persistence
- [ ] Widget tests for each screen
- [ ] Automated Android build and release in CI

## Development tooling

The repo includes Cursor/VS Code settings (`.vscode/`) and AI project rules
(`.cursor/rules/`) tuned for Flutter.
