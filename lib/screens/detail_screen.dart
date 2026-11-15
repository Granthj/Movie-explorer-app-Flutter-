import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';
import '../providers/favorites_provider.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;
  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // watch = rebuild this widget whenever favorites change
    final favorites = context.watch<FavoritesProvider>();
    final isFav = favorites.isFavorite(movie);

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.read<FavoritesProvider>().toggle(movie),
        icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
        label: Text(isFav ? 'Remove favorite' : 'Add to favorites'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.posterUrl != null)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(movie.posterUrl!, height: 380),
                ),
              ),
            const SizedBox(height: 16),
            Text(movie.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text('${movie.rating.toStringAsFixed(1)} / 10'),
                const SizedBox(width: 16),
                Text('Released: ${movie.releaseDate.isEmpty ? '—' : movie.releaseDate}'),
              ],
            ),
            const SizedBox(height: 16),
            Text('Overview', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(movie.overview.isEmpty ? 'No overview available.' : movie.overview),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
