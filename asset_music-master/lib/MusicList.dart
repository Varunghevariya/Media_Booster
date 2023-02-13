import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Global.dart';

class MusicList extends StatefulWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.arrow_back_ios_new,
        // color: Color(0xFFFAFAFA),
        // ),
        iconTheme: IconThemeData(color: Color(0xFF052843)),
        title: Text("Music",
            style: GoogleFonts.poppins(
                color: Color(0xFF052843),
                fontWeight: FontWeight.w700,
                fontSize: 18
            )
        ),
        actions: [
          GestureDetector(
            onTap: (){
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(Icons.category,
              size: 24,
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF052843),
        width: 240,
        child: Column(
          children: [
            const SizedBox(height: 70,),
            Text("Mohannasd",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white70
            ),
            ),
            const SizedBox(height: 5,),
            Text("sanjay1234@gmail.com",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.white70
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              height: 0.9,
              width: 450,
              color: Colors.white,
            ),
            const SizedBox(height: 5,),
            GestureDetector(
              onTap: () async {
               final prefs = await SharedPreferences.getInstance();
               islogin = false;
               prefs.setBool('Login', islogin);
               Navigator.pushNamedAndRemoveUntil(context, 'login' , (route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(Icons.logout,
                    size: 18,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15,),
                    Text("LOG OUT",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: SizedBox(
        height: 800,
        child: GridView.count(
          childAspectRatio: 2/2.61,
            crossAxisCount: 2,
        children: music.map((e){
          return GestureDetector(
            onTap: (){
              setState(() {
                assetsAudioPlayer.open(Audio("${e['music']}"),autoStart: true);
                musicIndex = music.indexOf(e);
                Navigator.pushNamed(context, 'musicPlay');

              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: Offset(1,5),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(e['muImage']),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text("${e['musicName']}",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      letterSpacing: 0.5,
                      color: Color(0xff001938),
                    ),
                    ),
                    Text("${e['singer']}",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0.5,
                        color: Colors.grey.shade500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
        ),
      ),
    );
  }
}