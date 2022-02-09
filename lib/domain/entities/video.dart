import 'package:equatable/equatable.dart';

class Video extends Equatable {
  String id;
  String key;
  String name;
  String site;
  String type;

  Video(
      {required this.id,
      required this.key,
      required this.name,
      required this.site,
      required this.type});

  @override
  List<Object> get props => [id, key, name, site, type];
}
