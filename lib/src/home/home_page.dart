import 'dart:ffi';
import 'package:redditnews/src/home/home_module.dart';
import 'package:redditnews/src/shared/models/reddit_post_model.dart';

import 'home_bloc.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage();


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var bloc = HomeModule.to.getBloc<HomeBloc>();
  String defaultImage = "https://www.redditstatic.com/icon.png";

  @override
  void initState() {
    bloc.getRedditPosts();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text("Reddit News"),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<RedditPostModel>>(
          stream: bloc.responseOut,
          builder: (context, snapshot) {
            if(snapshot.hasError) {
              print("Errro");
              return Center(child: Text(snapshot.error.toString()));
            }

            if(snapshot.hasData) {
              print(defaultImage);
              return Column(children: snapshot.data.map((redditItem) => Card(
                child: ListTile(
                  leading: Image.network(
                    redditItem.thumbnail.contains("self") ? defaultImage: redditItem.thumbnail
                    ),
                  title: Text(redditItem.title),
                  subtitle: Text(redditItem.domain),
                  onTap: () => bloc.openPostUrl(redditItem.url),
                ),
                
                )).toList(),
                
              );
            }
            else {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[CircularProgressIndicator()]
                  ),
              );
            }
          }
      )),
    );
  }
}
