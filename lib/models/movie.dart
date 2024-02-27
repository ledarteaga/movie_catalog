class Movie {
  final int id;
  final String title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final bool adult;
  final List<dynamic> genreIds;
  final String originalLanguage;
  final String originalTitle;
  final double popularity;
  final DateTime releaseDate;
  final bool video;
  final num voteAverage;
  final num voteCount;

  Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath,
      required this.backdropPath, // Se agrega el parámetro backdropPath para que coincida con el JSON.
      required this.adult, // Se agrega el parámetro adult para que coincida con el JSON.
      required this.genreIds, // Se agrega el parámetro genreIds para que coincida con el JSON.  											   // Se agrega el parámetro originalLanguage para que coincida con el JSON.  				       // Se agrega el parámetro originalTitle para que coincida con el JSON.  	     // Se agrega el parámetro popularity para que coincida con el JSON.  	     // Se agrega el parámetro releaseDate para que coincida con el JSON.  	     // Se agrega el parámetro video para que coincida con el JSON.  	     // Se agrega el parámetro voteAverage para que coincida con el JSON.  	     // Se agrega el parámetro voteCount para que coincida con el JSON.

      required this.originalLanguage,
      required this.originalTitle,
      required this.popularity,
      required this.releaseDate,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  Movie.fromJson(Map item)
      : id = item["id"],
        title = item["title"],
        overview = item["overview"],
        backdropPath = item["backdrop_path"],
        posterPath = item["poster_path"],
        adult = item["adult"],
        originalLanguage = item["original_language"],
        originalTitle = item["original_title"],
        popularity = item["popularity"].toDouble(),
        releaseDate = DateTime.parse(item["release_date"]),
        video = item["video"],
        voteAverage = item["vote_average"],
        genreIds = item['genre_ids'],
        voteCount = item['vote_count'];
}
