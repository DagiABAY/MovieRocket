class Movie {
  final String? name;
  final String? language;
  final bool? isAdult;
  final String? description;
  final String? posterPath;
  final String? backdropPath;
  final num? rating;
  final String? releaseDate;
  Movie({
    this.name,
    this.language,
    this.isAdult,
    this.description,
    this.posterPath,
    this.backdropPath,
    this.rating,
    this.releaseDate,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        name: json['title'],
        description: json['overview'],
        language: json['original_language'],
        isAdult: json['adult'],
        backdropPath: json["backdrop_path"],
        posterPath: json['poster_path'],
        rating: json['vote_average'],
        releaseDate: json['release_date']);
  }

  // String posterURL() {
  //   final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
  //   return '${_appConfig.baseImageApiUrl}${this.posterPath}';
  // }
}
