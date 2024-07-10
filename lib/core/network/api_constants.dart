class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "5868ad7ec390a607f8665f24a74fc43d";

  static const String onTheAirTvsPath =
      "$baseUrl/tv/on_the_air?api_key=$apiKey";

  static const String popularTvsPath = "$baseUrl/tv/popular?api_key=$apiKey";

  static const String topRatedTvsPath =
      "https://api.themoviedb.org/3/tv/top_rated?api_key=5868ad7ec390a607f8665f24a74fc43d";

  static String tvDetailsPath(int tvId) => "$baseUrl/tv/$tvId?api_key=$apiKey";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
