import 'dart:convert';

import 'package:bid365/src/home/leiloes_api/model_contents.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelLeiloes {
  final int id;
  final String name;
  final String date;
  final String time;
  final int is_online;
  final String image;
  final String phone;
  final String city;
  final String auctionhouse;
  final List<Contents> contents;
  ModelLeiloes(
      {required this.id,
      required this.name,
      required this.date,
      required this.time,
      required this.is_online,
      required this.image,
      required this.phone,
      required this.city,
      required this.auctionhouse,
      required this.contents});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'date': date,
      'time': time,
      'is_online': is_online,
      'image': image,
      'phone': phone,
      'city': city,
      'auctionhouse': auctionhouse,
      'contents': contents.map((content) => content.toMap()).toList(),
    };
  }

  factory ModelLeiloes.fromMap(Map<String, dynamic> map) {
    return ModelLeiloes(
      id: map['id'] as int,
      name: map['name'] as String,
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      is_online: map['is_online'] ?? 0,
      image: map['image'] ?? '',
      phone: map['phone'] ?? '',
      city: map['city'] ?? '',
      auctionhouse: map['auctionhouse'] ?? '',
      contents: map['contents']
              ?.map<Contents>((contentsMap) => Contents.fromMap(contentsMap))
              .toList() ??
          <Contents>[],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelLeiloes.fromJson(String source) =>
      ModelLeiloes.fromMap(json.decode(source) as Map<String, dynamic>);
}
