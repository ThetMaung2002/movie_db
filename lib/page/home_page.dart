import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/constants/api_constants.dart';
import 'package:movie_db/constants/string.dart';
import 'package:movie_db/data/apply/tmdb_apply.dart';
import 'package:movie_db/data/apply/tmdb_apply_impl.dart';
import 'package:movie_db/widgets/ui/rating_star_ui.dart';
import 'package:movie_db/widgets/ui/text_ui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/vos/movie_vo/movie_vo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// HomePage Main Widget
class _HomePageState extends State<HomePage> {
  final TMDBApply tmdbApply = TMDBApplyImpl();
  final PageController _controller = PageController();
  List<MovieVo> bestPopularMovies = [];

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder<List<MovieVo>?>(
              future: tmdbApply.getNowPlayingMovie(1),
              builder: (context, snapshot) {
                ///Show loading circle when loading data
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: LinearProgressIndicator(
                      color: Colors.amber,
                    ),
                  );
                }

                /// Show error
                if (snapshot.hasError) {
                  return const Center(
                    child: Icon(Icons.error_outline_outlined),
                  );
                }

                /// Create list of movie backdrop path from database...
                final List<MovieVo>? bannerMovieList =
                    snapshot.data?.take(5).toList();

                /// Finally return BannerMovieItemView...
                return BannerMovieItemView(
                  movies: bannerMovieList ?? [],
                  pageController: _controller,
                  onDotClicked: (index) {
                    _controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                    );
                  },
                );
              }),
          const SizedBox(height: 16),
          const BestPopularMovieView(),
          const SizedBox(height: 16),
          const CheckMovieShowtimesCard(),
          const SizedBox(height: 16),
        ],
      ),
    ));
  }
}

/// Banner Movie Item Widget
class BannerMovieItemView extends StatelessWidget {
  const BannerMovieItemView({
    super.key,
    required this.movies,
    required this.pageController,
    required this.onDotClicked,
  });

  final List<MovieVo> movies;
  final PageController pageController;
  final Function(int) onDotClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  var image = movies[index].backdropPath;
                  return BannerImageView(
                    movieTitle: movies[index].originalTitle ?? "",
                    imageUrl:
                        (image != null) ? '$kImageURL$image' : kDefaultImage,
                  );
                }),
          ),
          const SizedBox(height: 20),
          Center(
            child: SmoothPageIndicator(
              onDotClicked: onDotClicked,
              controller: pageController,
              count: 5,
              axisDirection: Axis.horizontal,
              effect: const SlideEffect(
                  spacing: 20.0,
                  radius: 20.0,
                  dotHeight: 10.0,
                  dotWidth: 10.0,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

/// Banner Image Widget
class BannerImageView extends StatelessWidget {
  const BannerImageView(
      {super.key, required this.imageUrl, required this.movieTitle});

  final String imageUrl;
  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const Align(
            alignment: Alignment.topCenter,
            child: LinearProgressIndicator(
              color: Colors.yellow,
            ),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error_outline),
          ),
          fit: BoxFit.cover,
        ),
      ),
      Positioned.fill(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      const Positioned.fill(
        child: Icon(
          Icons.play_circle,
          size: 46,
          color: Color.fromRGBO(255, 255, 255, 0.6),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: TextUI(
            label: movieTitle,
            color: const Color.fromRGBO(255, 255, 255, 0.6),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ]);
  }
}

/// Best Popular Movie Items here...
class BestPopularMoviesItemView extends StatelessWidget {
  const BestPopularMoviesItemView({super.key, required this.movie});

  final MovieVo movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 5,
            child: BestPopularImageView(
                imageUrl: (movie.backdropPath != null)
                    ? '$kImageURL${movie.backdropPath}'
                    : kDefaultImage),
          ),
          BestPopularMovieTitleView(movieName: movie.originalTitle ?? ''),
          const SizedBox(
            height: 20,
          ),
          RatingStarUI(
            rate: movie.voteAverage?.toDouble() ?? 0.0,
          )
        ],
      ),
    );
  }
}

///  Best Popular Movie Title Widget
class BestPopularMovieTitleView extends StatelessWidget {
  const BestPopularMovieTitleView({
    super.key,
    required this.movieName,
  });

  final String movieName;

  @override
  Widget build(BuildContext context) {
    return TextUI(
      label: movieName,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.grey[600],
    );
  }
}

/// Best Popular Image Widget
class BestPopularImageView extends StatelessWidget {
  const BestPopularImageView({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const Align(
        alignment: Alignment.topCenter,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.yellow,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.error_outline),
      ),
      fit: BoxFit.cover,
    );
  }
}

/// Check Movie Showtime Card Widget
class CheckMovieShowtimesCard extends StatelessWidget {
  const CheckMovieShowtimesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.maxFinite,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextUI(
                    label: "Check Movie Showtimes",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (kDebugMode) print("See more");
                    },
                    child: const TextUI(
                      label: "See more",
                      fontWeight: FontWeight.w600,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.location_on,
              size: 80,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}

/// Popular Title Top Bar
class PopularMovieListTopBarTitles extends StatelessWidget {
  const PopularMovieListTopBarTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextUI(
            label: kShowcases,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
          const TextUI(
            label: kMoreShowcases,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

/// Best Popular Movie View
class BestPopularMovieView extends StatefulWidget {
  const BestPopularMovieView({super.key});

  @override
  State<BestPopularMovieView> createState() => _BestPopularMovieViewState();
}

class _BestPopularMovieViewState extends State<BestPopularMovieView> {
  final TMDBApply tmdbApply = TMDBApplyImpl();
  final ScrollController scrollController = ScrollController();
  List<MovieVo> bestPopularMovies = [];

  int page = 1;

  @override
  void initState() {
    tmdbApply.getNowPlayingMovie(page).then((value) {
      setState(() {
        bestPopularMovies = value ?? [];
      });
    });
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          page++;
          tmdbApply.getNowPlayingMovie(page).then((value) {
            final temp = value ?? [];
            if (temp.isNotEmpty) {
              for (var movie in temp) {
                bestPopularMovies.add(movie);
              }
            }
            setState(() {});
          });
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextUI(
              label: kBestPopularTitle,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[300],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(16.0),
                scrollDirection: Axis.horizontal,
                itemCount: bestPopularMovies.length,
                itemBuilder: (context, index) {
                  return BestPopularMoviesItemView(
                    movie: bestPopularMovies[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
