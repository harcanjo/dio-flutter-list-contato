class Contact {
  final String name;
  final String email;
  final String phoneNumber;
  final String photoPath;

  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.photoPath,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'photoPath': photoPath,
      };

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        photoPath: json['photoPath'],
      );
}
