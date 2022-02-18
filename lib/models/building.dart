class Building {
  Building({
    required this.id,
    required this.buildingName,
    required this.imgThumbnail,
    required this.price,
    required this.rating,
    required this.province,
    required this.city,
    required this.district,
  });

  final int id;
  final String buildingName;
  final String imgThumbnail;
  final int price;
  final double rating;
  final String province;
  final String city;
  final String district;

  Building.fromJson(Map<String, Object?> json)
      : this(
          id: json['id'] == null ? -1 : json['id'] as int,
          buildingName: json['buildingName'] == null
              ? ""
              : json['buildingName'] as String,
          imgThumbnail: json['imgThumbnail'] == null
              ? ""
              : json['imgThumbnail'] as String,
          price: json['price'] == null ? 0 : json['price'] as int,
          rating: json['rating'] == null ? 0 : json['rating'] as double,
          province: json['province'] == null ? "" : json['province'] as String,
          city: json['city'] == null ? "" : json['city'] as String,
          district: json['district'] == null ? "" : json['district'] as String,
        );

  Map<String, Object?> toJson() {
    return {
      // 'id': id,
      'buildingName': buildingName,
      'imgThumbnail': imgThumbnail,
      'price': price,
      'rating': rating,
      'province': province,
      'city': city,
      'district': district,
    };
  }
}
