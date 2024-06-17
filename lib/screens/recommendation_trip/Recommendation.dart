// lib/models/recommendation.dart

class Recommendation {
  final String name;
  final String address;
  final String photoUrl;

  Recommendation({
    required this.name,
    required this.address,
    required this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'address': address,
    'photo_url': photoUrl,
  };

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      name: json['name'] ?? 'No Name',
      address: json['address'] ?? 'No Address',
      photoUrl: json['photo_url'] ?? '',
    );
  }
}
