//Todo: El oobjetivo del video local model es 
//que nos ayude a nosotros a mapear como luce este local video Post  

import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel{
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0
  });

    //Todo: Con este fromJson yo voy a tomar un mapa de tipo string dynamic y voy a crear instancias de mi video model 
    //Todo: Objetivo de LocalVideoModel.fromJson: Cuando realicemos una respuesta HTTP a algun lugar van a tener un mapa de tipo Dynamic Dynamic o String dynamic  
    //Todo: Ese json es el JSON object que van a recibir de una respuesta HTTP, y van a querer crear una instancia de una clase con ese Factory Constructor
    //todo: Estamos creando una nueva instancia de nuestro local videoModel
  factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
    name: json['name'] ?? 'No name', 
    videoUrl: json['videoUrl'],
    likes: json['likes'] ?? 0,
    views: json['views'] ?? 0
    );

    //VideoPOST toVideoPostEntities... importarlo
    //todo: Es un mapper
    VideoPost toVideoPostEntities() => VideoPost(
      caption: name, 
      videoUrl: videoUrl,
      likes: likes,
      views: views
      );
}
