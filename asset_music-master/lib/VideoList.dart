import 'package:asset_music/Videoplay.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Global.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.arrow_back_ios_new,
        // color: Color(0xFFFAFAFA),
        // ),
        iconTheme: IconThemeData(color: Color(0xFF052843)),
        title: Text("Video",
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
            Text("sanjaytarsariya2004@gmail.com",
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: Video.map((e){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                      return VideoPlay(index: Video.indexOf(e),);
                    },
                ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                child: Container(
                  height: 280,
                  width: 410,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                        offset: Offset(1,3),
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage(e['image']),
                      fit: BoxFit.cover
                    )
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
