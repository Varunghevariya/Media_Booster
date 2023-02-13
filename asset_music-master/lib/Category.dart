import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.arrow_back_ios_new,
        // color: Color(0xFFFAFAFA),
        // ),
        iconTheme: IconThemeData(color: Color(0xFF052843)),
        title: Text("Choose Your Category",
        style: GoogleFonts.poppins(
          color: Color(0xFF052843),
          fontWeight: FontWeight.w600,
          fontSize: 18
        )
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
      ),
      // drawer: Drawer(
      //   backgroundColor: Color(0xFF052843),
      //   width: 240,
      //   child: Column(
      //     children: [
      //       const SizedBox(height: 70,),
      //       Text("Mohannasd",
      //       style: GoogleFonts.poppins(
      //         fontWeight: FontWeight.w400,
      //         fontSize: 14,
      //         color: Colors.white70
      //       ),
      //       ),
      //       const SizedBox(height: 5,),
      //       Text("sanjaytarsariya2004@gmail.com",
      //         style: GoogleFonts.poppins(
      //             fontWeight: FontWeight.w600,
      //             fontSize: 12,
      //             color: Colors.white70
      //         ),
      //       ),
      //       const SizedBox(height: 30,),
      //       Container(
      //         height: 0.9,
      //         width: 450,
      //         color: Colors.white,
      //       ),
      //       const SizedBox(height: 5,),
      //       GestureDetector(
      //         onTap: () async {
      //          final prefs = await SharedPreferences.getInstance();
      //          islogin = false;
      //          prefs.setBool('Login', islogin);
      //          Navigator.pushNamedAndRemoveUntil(context, 'login' , (route) => false);
      //         },
      //         child: Padding(
      //           padding: const EdgeInsets.all(15),
      //           child: Row(
      //             children: [
      //               Icon(Icons.logout,
      //               size: 18,
      //                 color: Colors.white,
      //               ),
      //               SizedBox(width: 15,),
      //               Text("LOG OUT",
      //               style: GoogleFonts.poppins(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.w600,
      //                 fontSize: 15,
      //               ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'musicList');
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left : 10 ,top: 15),
                  child: CircleAvatar(
                    radius: 110,
                    backgroundImage: AssetImage('images/c1.gif'),
                  ),
                ),
                const SizedBox(width: 35,),
                Text("Music",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Color(0xFF052843),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1
                ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'VideoList');
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Text("Video",
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Color(0xFF052843),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1
                    ),
                  ),
                ),
                const SizedBox(width: 30,),
                const Padding(
                  padding:  EdgeInsets.only(right : 5 ,top: 15),
                  child: CircleAvatar(
                    radius: 110,
                    backgroundImage: AssetImage(
                      'images/c2.gif',
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
             Navigator.pushNamed(context, 'Staggered');
            },
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left : 10 ,top: 15),
                  child: CircleAvatar(
                    radius: 110,
                    backgroundImage: AssetImage('images/m3.png')
                  ),
                ),
                const SizedBox(width: 10,),
                Text("Staggered ",
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Color(0xFF052843),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}