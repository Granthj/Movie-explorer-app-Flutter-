import 'package:flutter/foundation.dart';
import '../models/movie.dart';

/// App-wide state for favorite movies (managed with Provider).
class FavoritesProvider extends ChangeNotifier {
  final Map<int, Movie> _favorites = {};

  List<Movie> get favorites => _favorites.values.toList();

  bool isFavorite(Movie movie) => _favorites.containsKey(movie.id);

  void toggle(Movie movie) {
    if (isFavorite(movie)) {
      _favorites.remove(movie.id);
    } else {
      _favorites[movie.id] = movie;
    }
    notifyListeners(); 
  }
}
