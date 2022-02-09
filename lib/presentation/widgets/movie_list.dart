import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../common/constants.dart';
import '../pages/movie_detail_page.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.0,
      padding: const EdgeInsets.only(left: 8.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MovieDetailPage.ROUTE_NAME,
                      arguments: movie.id,
                    );
                  },
                  child: Column(children: [
                    movie.posterPath == null
                        ? Container(
                            width: 120.0,
                            height: 180.0,
                            decoration: const BoxDecoration(
                                color: kMikadoYellow,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)),
                                shape: BoxShape.rectangle),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  EvaIcons.filmOutline,
                                  color: Colors.white,
                                  size: 50.0,
                                )
                              ],
                            ),
                          )
                        : Container(
                            width: 120.0,
                            height: 180.0,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(2.0)),
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w200/" +
                                            movie.posterPath!),
                                    fit: BoxFit.cover)),
                          ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 100.0,
                        child: Text(
                          movie.title!,
                          maxLines: 2,
                          style: const TextStyle(
                              height: 1.4,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Text(
                            movie.voteAverage.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          RatingBar.builder(
                            itemSize: 8.0,
                            initialRating: movie.voteAverage! / 2,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              EvaIcons.star,
                              color: kMikadoYellow,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      ),
                    )
                  ]),
                ));
          }),
    );

    //OLD CODE
    // return Container(
    //   height: 200,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (context, index) {
    //       final movie = movies[index];
    //       //OLD CODE
    //       // return Container(
    //       //   padding: const EdgeInsets.all(8),
    //       //   child: InkWell(
    //       //     onTap: () {
    //       //       Navigator.pushNamed(
    //       //         context,
    //       //         MovieDetailPage.ROUTE_NAME,
    //       //         arguments: movie.id,
    //       //       );
    //       //     },
    //       //     child: Column(
    //       //       children: [
    //       //         Flexible(
    //       //           child: ClipRRect(
    //       //             borderRadius: BorderRadius.all(Radius.circular(16)),
    //       //             child: CachedNetworkImage(
    //       //               imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
    //       //               placeholder: (context, url) => Center(
    //       //                 child: CircularProgressIndicator(),
    //       //               ),
    //       //               errorWidget: (context, url, error) => Icon(Icons.error),
    //       //             ),
    //       //           ),
    //       //         ),
    //       //         Flexible(
    //       //           child: Row(
    //       //             children: [
    //       //               Text(movie.voteAverage.toString(), style: const TextStyle(
    //       //                   color: Colors.white,
    //       //                   fontSize: 10.0,
    //       //                   fontWeight: FontWeight.bold
    //       //               ),),
    //       //               const SizedBox(width: 5.0,),
    //       //               RatingBar.builder(
    //       //                 itemSize: 8.0,
    //       //                 initialRating: movies[index].voteAverage! / 2,
    //       //                 minRating: 1,
    //       //                 direction: Axis.horizontal,
    //       //                 allowHalfRating: true,
    //       //                 itemCount: 5,
    //       //                 itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
    //       //                 itemBuilder: (context, _) => const Icon(
    //       //                   EvaIcons.star,
    //       //                   color: kMikadoYellow,
    //       //                 ),
    //       //                 onRatingUpdate: (rating) {
    //       //                   print(rating);
    //       //                 },)
    //       //
    //       //             ],
    //       //           ),
    //       //         )
    //       //       ],
    //       //     ),
    //       //   ),
    //       // );
    //     },
    //     itemCount: movies.length,
    //   ),
    // );
  }
}
