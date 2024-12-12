class Post {
  final int id;
  String title;
  String description;
  String imagePath;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  // Factory constructor for JSON parsing
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imagePath: json['imagePath'],

    );
  }

  // Convert a Post object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imagePath': imagePath,
      'description': description,
    };
  }
}

