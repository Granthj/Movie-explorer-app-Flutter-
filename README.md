# Movie Explorer

A small Flutter app to browse popular movies, search, view details and save favorites. Data comes from the [TMDB API](https://www.themoviedb.org/documentation/api).

## Features
- Popular movies grid
- Debounced search
- Movie detail screen
- Favorites (Provider state management)
- Loading, error and empty states

## Tech
Flutter, Dart, `http`, `provider`

## Project structure
```
lib/
├── main.dart                         # entry point, theme, Provider setup
├── config/api_config.dart            # API key and URLs
├── models/movie.dart                 # Movie data class + JSON parsing
├── services/movie_service.dart       # network calls
├── providers/favorites_provider.dart # favorites state
├── screens/                          # home, detail, favorites
└── widgets/movie_card.dart           # reusable poster card
```

## Run it
1. Get a free API key at https://www.themoviedb.org/settings/api
2. Put it in `lib/config/api_config.dart`
3. `flutter pub get`
4. `flutter run`
