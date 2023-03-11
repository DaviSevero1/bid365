import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Contents {
  //int id;
  String url;
  Contents({
    //required this.id,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      //'id': id,
      'url': url,
    };
  }

  factory Contents.fromMap(Map<String, dynamic> map) {
    return Contents(
     // id: map['id'] as int,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contents.fromJson(String source) => Contents.fromMap(json.decode(source) as Map<String, dynamic>);
}
