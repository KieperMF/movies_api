//URL de pesquisa: https://api.themoviedb.org/3/search/movie?query="nomedo filme"&api_key=65eb24d3d4ad7bfdd3aa23d86fc0cf6a&language=pt-BR
//se nao especificar a lingua, por padrão vai vir em ingles

//URl de filmes lançados rencetemente: https://api.themoviedb.org/3/movie/now_playing?&api_key=65eb24d3d4ad7bfdd3aa23d86fc0cf6a

class urlBase{
  String urlSeach;
  String urlNowPlaying;
  String urlTopMovies;
  String key;
  String languageBr;
  String languageEn;
  String poster;

  urlBase({
   this.urlSeach = 'https://api.themoviedb.org/3/search/movie?query=',
   this.urlNowPlaying ="https://api.themoviedb.org/3/movie/now_playing?",
   this.urlTopMovies = "https://api.themoviedb.org/3/movie/top_rated?",
    this.key = "&api_key=65eb24d3d4ad7bfdd3aa23d86fc0cf6a",
    this.languageBr = "&language=pt-BR",
    this.languageEn = "&language=en-EN",
    this.poster = "https://image.tmdb.org/t/p/original/"
  });
}