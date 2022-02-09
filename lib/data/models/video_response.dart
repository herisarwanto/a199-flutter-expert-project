import 'package:ditonton/data/models/video_model.dart';
import 'package:equatable/equatable.dart';

class VideoResponse extends Equatable {
  final List<VideoModel> videoList;

  VideoResponse({required this.videoList});

  factory VideoResponse.fromJson(Map<String, dynamic> json) => VideoResponse(
    videoList: List<VideoModel>.from((json["results"] as List)
        .map((x) => VideoModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(videoList.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [videoList];

}