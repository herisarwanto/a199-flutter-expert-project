import 'package:ditonton/domain/entities/video.dart';

class VideoModel {
  final String id;
  final String key;
  final String name;
  final String site;
  final String type;

  VideoModel(
      {required this.id,
      required this.key,
      required this.name,
      required this.site,
      required this.type});

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        key: json["key"],
        name: json["name"],
        site: json["site"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "name": name,
        "site": site,
        "type": type,
      };

  Video toEntity() {
    return Video(
        id: this.id,
        key: this.key,
        name: this.name,
        site: this.site,
        type: this.type);
  }

  @override
  List<Object?> get props => [id, key, name, site, type];
}
