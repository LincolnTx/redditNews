class RedditPostModel {
  String title;
  String thumbnail;
  String domain;
  String url;

  RedditPostModel({this.title, this.thumbnail, this.domain, this.url});

  RedditPostModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumbnail = json['thumbnail'];
    domain = json['domain'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['domain'] = this.domain;
    data['url'] = this.url;
    return data;
  }
}