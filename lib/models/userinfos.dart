class User {
  final String name;
  final bool isAdmin;
  final String profileUrl;

  User({
    required this.name,
    required this.isAdmin,
    required this.profileUrl,
  });
}

final List<User> users = [
  User(name: 'Admin User', isAdmin: true, profileUrl: 'https://m.media-amazon.com/images/I/41ONa5HOwfL.jpg'),
  User(name: 'User 2', isAdmin: false, profileUrl: 'https://m.media-amazon.com/images/I/31Cd9UQp6eL._AC_UF1000,1000_QL80_.jpg'),
  User(name: 'User 3', isAdmin: false, profileUrl: 'https://m.media-amazon.com/images/I/31jPSK41kEL.jpg'),
  User(name: 'User 4', isAdmin: false, profileUrl: 'https://m.media-amazon.com/images/I/41mSIgdsHvL._AC_UF1000,1000_QL80_.jpg'),
];