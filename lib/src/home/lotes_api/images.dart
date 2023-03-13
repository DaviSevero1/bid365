import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Images {
  final int id;
  final String created_at;
  final String url;
  final String filename;
  Images({
    required this.id,
    required this.created_at,
    required this.url,
    required this.filename,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at,
      'file_url': url,
      'filename': filename,
    };
  }

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      id: map['id'] as int,
      created_at: map['created_at'] as String,
      url: map['file_url'] ?? '',
      filename: map['filename'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Images.fromJson(String source) => Images.fromMap(json.decode(source) as Map<String, dynamic>);
}
