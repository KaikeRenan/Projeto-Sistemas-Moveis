class User {
  final String id;
  final String nameFull;
  final String email;
  final bool active;
  final DateTime createdIn;

  User({
    required this.id,
    required this.nameFull,
    required this.email,
    required this.active,
    required String createdInStr,
  }) : createdIn = DateTime.parse(createdInStr);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      nameFull: json['name_full'] as String,
      email: json['email'] as String,
      active: json['active'] as bool,
      createdInStr: json['created_in'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_full': nameFull,
      'email': email,
      'active': active,
      'created_in': createdIn.toIso8601String(),
    };
  }

  User copyWith({String? id, String? nameFull, String? email, bool? active}) {
    return User(
      id: id ?? this.id,
      nameFull: nameFull ?? this.nameFull,
      email: email ?? this.email,
      active: active ?? this.active,
      createdInStr: createdIn.toIso8601String(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email;

  @override
  int get hashCode => id.hashCode ^ email.hashCode;

  @override
  String toString() {
    return 'User(id: $id, nameFull: $nameFull, email: $email, active: $active, createdIn: $createdIn)';
  }
}
