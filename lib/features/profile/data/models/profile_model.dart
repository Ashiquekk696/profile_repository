class ProfileModel {
  final String? id;
  final String? name;
  final String? bio;
  final String? email;
  final String? phone;
  final String? city;
  final String? country;
  final String? avatar;
  final String? eventName;
  final String? createdAt;

  const ProfileModel({
    this.id,
    this.name,
    this.bio,
    this.email,
    this.phone,
    this.city,
    this.country,
    this.avatar,
    this.eventName,
    this.createdAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id']?.toString(),
      name: json['name']?.toString(),
      bio: json['bio']?.toString(),
      email: json['Email']?.toString(),
      phone: json['phone']?.toString(),
      city: json['city']?.toString(),
      country: json['country']?.toString(),
      avatar: json['avatar']?.toString(),
      eventName: json['event_name']?.toString(),
      createdAt: json['createdAt']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bio': bio,
      'Email': email,
      'phone': phone,
      'city': city,
      'country': country,
      'avatar': avatar,
      'event_name': eventName,
      'createdAt': createdAt,
    }..removeWhere((key, value) => value == null);
  }

  ProfileModel copyWith({
    String? name,
    String? bio,
    String? email,
    String? phone,
    String? city,
    String? country,
    String? avatar,
    String? eventName,
    String? createdAt,
  }) {
    return ProfileModel(
      id: id,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      country: country ?? this.country,
      avatar: avatar ?? this.avatar,
      eventName: eventName ?? this.eventName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static ProfileModel get empty => const ProfileModel();
}