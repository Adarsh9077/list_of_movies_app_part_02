import 'package:flutter/material.dart';

class MoviesModal with ChangeNotifier {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MoviesModal({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  //
  factory MoviesModal.fromJson(Map<String, dynamic> json) {
    return MoviesModal(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? "",
      genreIds: json['genreIds']??[],
      id: json['id'],
      originalLanguage: json['originalLanguage']??"",
      originalTitle: json['originalTitle']??"",
      overview: json['overview']??"",
      popularity: json['popularity']??0.0,
      posterPath: json['posterPath'] ?? '',
      releaseDate: json['release_date']??"",
      title: json['title']??"",
      video: json['video']??"",
      voteAverage: json['vote_average']??0.0,
      voteCount: json['vote_count']??0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }

  @override
  String toString() {
    return "MoviesModal(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount) ";
  }
}
