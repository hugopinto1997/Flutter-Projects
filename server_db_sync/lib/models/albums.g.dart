// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Albums _$AlbumsFromJson(Map<String, dynamic> json) {
  return Albums()
    ..albums = (json['albums'] as List)
        ?.map(
            (e) => e == null ? null : Album.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$AlbumsToJson(Albums instance) =>
    <String, dynamic>{'albums': instance.albums};
