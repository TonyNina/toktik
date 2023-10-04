
import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';

import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier{

  //TODO: Repository, Datasource

  bool initialLoading = true;
  
  //TODO: Y los añade aqui
 
  List<VideoPost> videos = [];


  Future<void> loadNextPage() async{

    //TODO: Metodo que espera dos segundos
    //await Future.delayed( const Duration(seconds: 2));

    //TODO: Metodo que carga los videos
    final List<VideoPost> newVideos = videoPosts.map(
      ( video ) => LocalVideoModel.fromJson(video).toVideoPostEntities()
      ).toList();

      videos.addAll( newVideos );
      initialLoading = false; 

    notifyListeners();
  }
}