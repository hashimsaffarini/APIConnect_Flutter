class UserModels {
  final String profilePicture;
  final String email;
  final String name;
  final String phoneNumber;
  final Map<String, dynamic> address;

  UserModels({
    required this.profilePicture,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.address,
  });

  factory UserModels.fromJson(Map<String, dynamic> json) {
    return UserModels(
      profilePicture: json['profilePicture'],
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
    );
  }

}
