import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';

import '../entities/video.dart';

class GetMovieVideo {
  final MovieRepository repository;

  GetMovieVideo(this.repository);

  Future<Either<Failure, List<Video>>> execute(int id) {
    return repository.getMovieVideo(id);
  }
}