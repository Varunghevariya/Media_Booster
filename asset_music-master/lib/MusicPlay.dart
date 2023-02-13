import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'Global.dart';

class MusicPlay extends StatefulWidget {
  const MusicPlay({Key? key}) : super(key: key);

  @override
  State<MusicPlay> createState() => _MusicPlayState();
}

class _MusicPlayState extends State<MusicPlay> {


   Duration songDuration = Duration.zero;
   Duration currPosition = Duration.zero;
   bool isplaying  = false;

  void initState()
  {
    super.initState();


   assetsAudioPlayer.currentPosition.listen((event){
     setState(() {
       currPosition = event;
     });
   });

    //Listen to the current playing song
    print(currPosition);
    assetsAudioPlayer.current.listen((event) {
      setState(() {
        songDuration = event!.audio.duration;
      });
    });
      isplaying = true;


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 860,
        width: 420,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color(0xff3A5A81),
              Color(0xff001938),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Icon(Icons.arrow_back_outlined,
                    size: 22,
                      color:  Color(0xff001938),
                    ),
                  ),
                  SizedBox(width: 130,),
                  Text("Music",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff001938),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 50,),
              Container(
                height: 350,
                width: 350,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(15),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.shade800,
                     blurRadius: 5,
                     offset: Offset(1,3),
                   )
                 ],
                 image: DecorationImage(
                   image: AssetImage("${music[musicIndex]['muImage']}"),
                   fit: BoxFit.cover,
                 )
               ),
              ),
              const SizedBox(height: 40,),
              Text("${music[musicIndex]['musicName']}",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w800,
                fontSize: 22,
                letterSpacing: 0.5,
                color: Colors.white
              ),
              ),
              const SizedBox(height: 5,),
              Text("${music[musicIndex]['singer']}",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color(0xFFA3B2C4),
                ),
              ),
              Slider(
                min: 0,
                max: songDuration.inSeconds.toDouble(),
                  value: currPosition.inSeconds.toDouble(),
                  onChanged: (val)  {
                      setState(() {
                        assetsAudioPlayer.seek(Duration(seconds: val.toInt()));
                        print("heloo ${currPosition.inSeconds.toDouble()}");
                      });
                     // currPosition = val as Duration
                  }
              ),
              Padding(
                padding: const EdgeInsets.only(left:25,right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${currPosition.inMinutes.remainder(60)} : ${currPosition.inSeconds.remainder(60)}",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                    ),
                    Text("${songDuration.inMinutes.remainder(60)} : ${songDuration.inSeconds.remainder(60)}",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap : (){
                        setState(() {

                          musicIndex --;
                          if(musicIndex >= 0)
                            {
                            print("hello2 ${musicIndex}");
                              print("demo ${music[musicIndex]['music']}");
                              assetsAudioPlayer.open(
                                Audio(music[musicIndex]['music']),
                                autoStart: true,
                                showNotification: true,
                              );

                            }
                          else
                            {
                              setState(() {
                                musicIndex = 0;
                                print("mymymy === ${musicIndex}");
                              });
                            }
                        });
                      },
                      child: Icon(CupertinoIcons.backward_fill,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),



                    SizedBox(width: 15,),
                    IconButton(onPressed: (){
                      setState(() {
                        assetsAudioPlayer.playOrPause();
                        print("priiiiiiiiiiiii ${isplaying}");
                      });
                    }, icon: (assetsAudioPlayer.isPlaying.value) ?
                    Icon(Icons.pause,
                      size: 40,
                      color: Colors.white,
                    ) : Icon(Icons.play_arrow,
                      size: 40,
                      color: Colors.white,
                    ),

                    ) ,

                    SizedBox(width: 23),



                    GestureDetector(
                      onTap: () {
                        setState(() {
                          musicIndex++;
                          if(musicIndex < music.length)
                            {
                              print("hello1-------------");
                              print("demo ${music[musicIndex]['music']}");
                              assetsAudioPlayer.open(
                                Audio(music[musicIndex]['music']),
                                autoStart: true,
                                showNotification: true,
                              );
                              setState(() {});

                            }
                          else{
                            setState(() {
                              musicIndex = 11;
                            });
                          }

                          print("hello1 ${music.length + 1}");
                           //}

                        });
                         //assetsAudioPlayer.next();
                         //assetsAudioPlayer.prev();
                         //assetsAudioPlayer.playlistPlayAtIndex(1);
                      },
                      child: Icon(CupertinoIcons.forward_fill,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
