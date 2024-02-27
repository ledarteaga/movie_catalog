import 'dart:convert';

class MovieImage {
  double? aspectRatio;
  int? height;
  dynamic iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  MovieImage({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory MovieImage.fromMap(Map<String, dynamic> data) => MovieImage(
        aspectRatio: (data['aspect_ratio'] as num?)?.toDouble(),
        height: data['height'] as int?,
        iso6391: data['iso_639_1'] as dynamic,
        filePath: data['file_path'] as String?,
        voteAverage: (data['vote_average'] as num?)?.toDouble(),
        voteCount: data['vote_count'] as int?,
        width: data['width'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'aspect_ratio': aspectRatio,
        'height': height,
        'iso_639_1': iso6391,
        'file_path': filePath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'width': width,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MovieImage].
  factory MovieImage.fromJson(String data) {
    return MovieImage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MovieImage] to a JSON string.
  String toJson() => json.encode(toMap());
}
