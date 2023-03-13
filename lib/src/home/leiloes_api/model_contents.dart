import 'dart:convert';

class Contents {
  String url;
  Contents({
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory Contents.fromMap(Map<String, dynamic> map) {
    return Contents(
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contents.fromJson(String source) =>
      Contents.fromMap(json.decode(source) as Map<String, dynamic>);
}
