import 'package:flutter/material.dart';

class Movie{
  String title;
  String overview;
  double popularity;
  String release;
  String poster;

  Movie({
    required this.title,
    required this.overview,
    required this.popularity,
    required this.release,
    required this.poster,
  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(title: json['title'], 
      overview: json['overview'], 
      popularity: json['popularity'], 
      release: json['release_date'], 
      poster: json['poster_path']);
    }
 
}