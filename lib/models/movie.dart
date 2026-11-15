import '../config/api_config.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String releaseDate;
  final double rating;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.rating,
  });

  /// Builds a Movie from the JSON map returned by the API.
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: (json['title'] ?? 'Untitled') as String,
      overview: (json['overview'] ?? '') as String,
      posterPath: json['poster_path'] as String?,
      releaseDate: (json['release_date'] ?? '') as String,
      rating: ((json['vote_average'] ?? 0) as num).toDouble(),
    );
  }

  String? get posterUrl =>
      posterPath == null ? null : '${ApiConfig.imageBase}$posterPath';

  String get year => releaseDate.length >= 4 ? releaseDate.substring(0, 4) : '—';
}
