import 'dart:convert';

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
  ModelLeiloes({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
    required this.is_online,
    required this.image,
    required this.phone,
    required this.city,
  });

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
    };
  }

  factory ModelLeiloes.fromMap(Map<String, dynamic> map) {
    return ModelLeiloes(
      id: map['id'] as int,
      name: map['name'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      is_online: map['is_online'] as int,
      image: map['image'] as String,
      phone: map['phone'] as String,
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelLeiloes.fromJson(String source) => ModelLeiloes.fromMap(json.decode(source) as Map<String, dynamic>);
}
