import 'package:flutter/cupertino.dart';

///Base Url
const String kBaseURL = "https://api.themoviedb.org/3/movie";
const String kBaseURL2 = "https://api.themoviedb.org/3/genre";

///EndPoints
const String kGetNowPlayingEndPoint = "/now_playing";
const String kGetPopularMovieList = "/popular";
const String kActor = "/person/popular";
const String kMovieList = "/movie/list";

///Api Key
@PageStorageKey(kApiToken)
const String kApiToken = "c2eef9e6bea0793dd58068f60a3f59ef";

/// Strings
const String kApiKey = "api_key";

const String kPage = "page";

const String kImageURL = "https://image.tmdb.org/t/p/w500/";
