import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
 
  
   
   
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key, 
    required this.videos
    });

  @override
  Widget build(BuildContext context) {
    // Todo: PageView es un  
    // widget que nos permite hacer un scroll a pantalla completa
    // Gracias al PageView se puede lograr ese comportamiento
    //Todo: .builder sirve para construir bajo demanda 
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost= videos[index]; 

        return Stack(
          children: [
            //Video Player + gradiente
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              ),
            ),

            //Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: videoButtons(video: videoPost)),
          ],
        );
      },
    );
  }
}

