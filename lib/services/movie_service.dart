import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/movie.dart';

/// Talks to the TMDB REST API. UI code never calls http directly.
class MovieService {
  Future<List<Movie>> fetchPopular() => _get('/3/movie/popular', {});

  Future<List<Movie>> search(String query) =>
      _get('/3/search/movie', {'query': query});

  Future<List<Movie>> _get(String path, Map<String, String> params) async {
    final uri = Uri.https(
      ApiConfig.baseHost,
      path,
      {'api_key': ApiConfig.apiKey, ...params},
    );

    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Request failed (${response.statusCode}). Check your API key.');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final results = data['results'] as List<dynamic>;
    return results
        .map((json) => Movie.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
