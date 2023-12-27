class Movie{
  String title;
  String overview;
  double popularity;
  String release;
  String poster;
  String background;

  Movie({
    required this.title,
    required this.overview,
    required this.popularity,
    required this.release,
    required this.poster,
    required this.background
  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(title: json['title'], 
      overview: json['overview'], 
      popularity: json['popularity'], 
      release: json['release_date'], 
      poster: json['poster_path'],
      background: json['backdrop_path']
      );
    }
 
}