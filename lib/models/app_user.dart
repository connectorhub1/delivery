class AppUser {
  final String uid;
  final String name;
  final String email;
  final String role;
  final String? photoUrl;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
    this.photoUrl,
  });

  factory AppUser.fromMap(Map<String, dynamic> data) => AppUser(
        uid: data['uid'],
        name: data['name'] ?? '',
        email: data['email'] ?? '',
        role: data['role'] ?? 'customer',
        photoUrl: data['photoUrl'],
      );
}