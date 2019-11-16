import 'package:dio/dio.dart';
import 'package:redditnews/src/shared/custom_dio/custom_dio.dart';
import 'package:redditnews/src/shared/models/reddit_post_model.dart';

class HomeGateway {
  final CustomDio _dioClient;

  HomeGateway (this._dioClient);

  Future<List<RedditPostModel>> getRedditPosts() async {
    try {
      var response = await _dioClient.get("/new.json");
      // print("Imprimindo a resposta  ${response.data['data']['children']}");
       var feeds = response.data['data']['children'];
       print("Imprimindo resultado de json $feeds");
       
      
      return (feeds as List)
        .map((item) => RedditPostModel.fromJson(item['data']))
        .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}