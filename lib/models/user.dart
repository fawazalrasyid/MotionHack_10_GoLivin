class UserM {
  UserM({
    required this.id,
    required this.displayName,
    required this.email,
    required this.phoneNumber,
  });

  final String id;
  final String displayName;
  final String email;
  final String phoneNumber;

  UserM.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          displayName: json['displayName']! as String,
          email: json['email']! as String,
          phoneNumber: json['phoneNumber']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
