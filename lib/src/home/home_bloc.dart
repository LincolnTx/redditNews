import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:redditnews/src/home/home_gateway.dart';
import 'package:redditnews/src/shared/models/reddit_post_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBloc extends BlocBase {

  final HomeGateway _homeGateway;

  HomeBloc(this._homeGateway);

  var listPosts = BehaviorSubject<List<RedditPostModel>>();
  Sink<List<RedditPostModel>> get responseIn => listPosts.sink;
  Observable<List<RedditPostModel>> get responseOut => listPosts.stream;


  void getRedditPosts() async {
    responseIn.add(null);

    try {
      var redditResponse  = await _homeGateway.getRedditPosts();
      responseIn.add(redditResponse);
    } catch (e) {
      listPosts.add(e);
    }
  }

  void openPostUrl(String url) async {
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Não foi possível abrir essa url $url";
    }
  }
  @override
  void dispose() {
    listPosts.close();
    super.dispose();
  }
}