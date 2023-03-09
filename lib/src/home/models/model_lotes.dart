// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'images.dart';

class ModelLotes {
  int? id;
  int? type;
  String? name;
  String? age;
  String? location;
  String? dateInit;
  String? dateEnd;
  String? hourInit;
  String? hourEnd;
  int? status;
  List<Images> images;

  ModelLotes(
      {this.id,
      this.type,
      this.name,
      this.age,
      this.location,
      this.dateInit,
      this.dateEnd,
      this.hourInit,
      this.hourEnd,
      this.status,
      required this.images});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'name': name,
      'age': age,
      'location': location,
      'dateInit': dateInit,
      'dateEnd': dateEnd,
      'hourInit': hourInit,
      'hourEnd': hourEnd,
      'status': status,
      'images': images.map((x) => x.toMap()).toList(),
    };
  }

  factory ModelLotes.fromMap(Map<String, dynamic> map) {
    return ModelLotes(
      id: map['id'] ?? 0,
      type:map['type'] != null ? map['type'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      age: map['age'] != null ? map['age'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      dateInit: map['dateInit'] != null ? map['dateInit'] as String : null,
      dateEnd: map['dateEnd'] != null ? map['dateEnd'] as String : null,
      hourInit: map['hourInit'] != null ? map['hourInit'] as String : null,
      hourEnd: map['hourEnd'] != null ? map['hourEnd'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
      images: map['images']?.map<Images>(
        (imageMap) => Images.fromMap(imageMap)
      ).toList() ?? <Images>[],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelLotes.fromJson(String source) => ModelLotes.fromMap(json.decode(source) as Map<String, dynamic>);
}
