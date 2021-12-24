class Blog {
  late String sId;
  late String title;
  late String text;
  late User user;
  late String? image;
  late List<String>? tags;
  late String createdAt;
  late String? updatedAt;

  Blog(
      {required this.sId,
      required this.title,
      required this.text,
      required this.user,
      this.image,
      this.tags,
      required this.createdAt,
      this.updatedAt});

  Blog.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    text = json['text'];
    user = User.fromJson(json['user']);
    image = json['image'];
    tags = json['tags'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['text'] = text;
    data['user'] = user.toJson();
    data['image'] = image;
    data['tags'] = tags;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class User {
  late String sId;
  late String name;
  late String email;

  User({required this.sId, required this.name, required this.email});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
