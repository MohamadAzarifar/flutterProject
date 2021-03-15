class PostModel {
  final int id;
  final String title;
  final String body;

  PostModel({this.id, this.title, this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class PostsModel {
  final List<PostModel> posts;

  PostsModel({this.posts});

  factory PostsModel.fromJson(List<dynamic> json) {
    return PostsModel(posts: json.map((e) => PostModel.fromJson(e)).toList());
  }
}
