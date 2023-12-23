class urlBase{
  String url;
  String key;
  String languageBr;
  String languageEn;
  String poster;

  urlBase({
   this.url = 'https://api.themoviedb.org/3/search/movie?query=',
    this.key = "&api_key=65eb24d3d4ad7bfdd3aa23d86fc0cf6a",
    this.languageBr = "&language=pt-BR",
    this.languageEn = "&language=en-EN",
    this.poster = "https://image.tmdb.org/t/p/original/"
  });
}