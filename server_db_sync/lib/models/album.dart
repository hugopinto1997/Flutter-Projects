import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
    Album();

    num albumId;
    num id;
    String title;
    String url;
    String thumbnailUrl;
    
    factory Album.fromJson(Map<String,dynamic> json) => _$AlbumFromJson(json);
    Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
