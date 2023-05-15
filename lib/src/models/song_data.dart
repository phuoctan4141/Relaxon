// ignore_for_file: public_member_api_docs, sort_constructors_first,, prefer_if_null_operators
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';

class SongData {
  String? trackName;
  List<String>? trackArtistNames;
  String? albumName;
  String? albumArtistName;
  int? trackNumber;
  int? albumLength;
  int? year;
  String? genre;
  String? authorName;
  String? writerName;
  int? discNumber;
  String? mimeType;
  int? trackDuration;
  int? bitrate;
  Uint8List? albumArt;
  String? trackPath;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'trackName': trackName,
      'trackArtistNames': trackArtistNames,
      'albumName': albumName,
      'albumArtistName': albumArtistName,
      'trackNumber': trackNumber,
      'albumLength': albumLength,
      'year': year,
      'genre': genre,
      'authorName': authorName,
      'writerName': writerName,
      'discNumber': discNumber,
      'mimeType': mimeType,
      'trackDuration': trackDuration,
      'bitrate': bitrate,
      'albumArt': albumArt as List<int>,
      'trackPath': trackPath,
    };
  }

  factory SongData.fromMap(Map<String, dynamic> map) {
    return SongData(
      trackName: map['trackName'] != null ? map['trackName'] as String : null,
      trackArtistNames: map['trackArtistNames'] != null
          ? List<String>.from((map['trackArtistNames'] as List<String>))
          : null,
      albumName: map['albumName'] != null ? map['albumName'] as String : null,
      albumArtistName: map['albumArtistName'] != null
          ? map['albumArtistName'] as String
          : null,
      trackNumber:
          map['trackNumber'] != null ? map['trackNumber'] as int : null,
      albumLength:
          map['albumLength'] != null ? map['albumLength'] as int : null,
      year: map['year'] != null ? map['year'] as int : null,
      genre: map['genre'] != null ? map['genre'] as String : null,
      authorName:
          map['authorName'] != null ? map['authorName'] as String : null,
      writerName:
          map['writerName'] != null ? map['writerName'] as String : null,
      discNumber: map['discNumber'] != null ? map['discNumber'] as int : null,
      mimeType: map['mimeType'] != null ? map['mimeType'] as String : null,
      trackDuration:
          map['trackDuration'] != null ? map['trackDuration'] as int : null,
      bitrate: map['bitrate'] != null ? map['bitrate'] as int : null,
      albumArt: map['albumArt'] != null
          ? Uint8List.fromList(map['albumArt'] as List<int>)
          : null,
      trackPath: map['trackPath'] != null ? map['trackPath'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongData.fromJson(String source) =>
      SongData.fromMap(json.decode(source) as Map<String, dynamic>);

  factory SongData.fromMetadata(Metadata metadata) {
    return SongData(
      trackName: metadata.trackName != null ? metadata.trackName : null,
      trackArtistNames:
          metadata.trackArtistNames != null ? metadata.trackArtistNames : null,
      albumName: metadata.albumName != null ? metadata.albumName : null,
      albumArtistName:
          metadata.albumArtistName != null ? metadata.albumArtistName : null,
      trackNumber:
          metadata.trackNumber != null ? metadata.trackNumber as int : null,
      albumLength: metadata.albumLength != null ? metadata.albumLength : null,
      year: metadata.year != null ? metadata.year : null,
      genre: metadata.genre != null ? metadata.genre : null,
      authorName: metadata.authorName != null ? metadata.authorName : null,
      writerName: metadata.writerName != null ? metadata.writerName : null,
      discNumber: metadata.discNumber != null ? metadata.discNumber : null,
      mimeType: metadata.mimeType != null ? metadata.mimeType : null,
      trackDuration:
          metadata.trackDuration != null ? metadata.trackDuration : null,
      bitrate: metadata.bitrate != null ? metadata.bitrate : null,
      albumArt: metadata.albumArt != null ? metadata.albumArt : null,
      trackPath: metadata.filePath != null ? metadata.filePath : null,
    );
  }

  SongData({
    this.trackName,
    this.trackArtistNames,
    this.albumName,
    this.albumArtistName,
    this.trackNumber,
    this.albumLength,
    this.year,
    this.genre,
    this.authorName,
    this.writerName,
    this.discNumber,
    this.mimeType,
    this.trackDuration,
    this.bitrate,
    this.albumArt,
    this.trackPath,
  });

  SongData copyWith({
    String? trackName,
    List<String>? trackArtistNames,
    String? albumName,
    String? albumArtistName,
    int? trackNumber,
    int? albumLength,
    int? year,
    String? genre,
    String? authorName,
    String? writerName,
    int? discNumber,
    String? mimeType,
    int? trackDuration,
    int? bitrate,
    Uint8List? albumArt,
    String? trackPath,
  }) {
    return SongData(
      trackName: trackName ?? this.trackName,
      trackArtistNames: trackArtistNames ?? this.trackArtistNames,
      albumName: albumName ?? this.albumName,
      albumArtistName: albumArtistName ?? this.albumArtistName,
      trackNumber: trackNumber ?? this.trackNumber,
      albumLength: albumLength ?? this.albumLength,
      year: year ?? this.year,
      genre: genre ?? this.genre,
      authorName: authorName ?? this.authorName,
      writerName: writerName ?? this.writerName,
      discNumber: discNumber ?? this.discNumber,
      mimeType: mimeType ?? this.mimeType,
      trackDuration: trackDuration ?? this.trackDuration,
      bitrate: bitrate ?? this.bitrate,
      albumArt: albumArt ?? this.albumArt,
      trackPath: trackPath ?? this.trackPath,
    );
  }
}
