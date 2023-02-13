import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'Global.dart';


class VideoPlay extends StatefulWidget {
  int? index;
  VideoPlay({super.key, required this.index});

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {

  late VideoPlayerController controller;
   late ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network("${Video[widget.index!]['path']}")..initialize().then((value)
    {
      setState(() {

    });});

    chewieController = ChewieController(videoPlayerController: controller);


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                 height: 10,
               ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,top: 10),
                  child: Icon(Icons.arrow_back_outlined,
                    size: 22,
                    color:  Color(0xff001938),
                  ),
                ),
              ),
               SizedBox(height: 230,),
              (controller.value.isInitialized) ?
              AspectRatio(
                aspectRatio: controller.value.aspectRatio ,
                child: Chewie(
                  controller: chewieController,
                ),
              ) : Container(),

            ],
          ),
        ),
      ),
    );
  }
}

