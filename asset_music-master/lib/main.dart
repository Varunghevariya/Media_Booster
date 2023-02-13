import 'package:asset_music/Global.dart';
import 'package:asset_music/MusicList.dart';
import 'package:asset_music/VideoList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Category.dart';
import 'LoginPage.dart';
import 'MusicPlay.dart';
import 'Staggared.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(

    MaterialApp(

      initialRoute:  (prefs.getBool('Intro') == true) ?
          (prefs.getBool('Login') == true ) ?
                                         'home' :
                                        'login'
                                           : '/' ,
      routes: {
        '/' : (context) => const Music(),

        'home'  : (context) => const Category(),
        'login'  : (context) => const Login(),
        'musicList'  : (context) => const MusicList(),
        'musicPlay'  : (context) => const MusicPlay(),
        'VideoList'  : (context) => const VideoList(),
        'Staggered'  : (context) => const Staggered(),
      },
    ),
  );
}

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        pageBackgroundGradient: const LinearGradient(colors: [
          // Color(0xff001938),
          // Color(0xff3A5A81),
          // Colors.white,




          Color(0xff001938),
          Color(0xff3A5A81),

          Colors.white,
          //Color(0xFF052843),
          //Color(0xFF1F3C5F)

        ], begin: Alignment.center, end: Alignment.bottomRight),
        //pageBackgroundColor: Color(0xff3A5A81),
        headerBackgroundColor:   const Color(0xff001938),
        finishButtonText: 'Login',
        finishButtonColor: const Color(0xFF052843),
        skipTextButton: const Text('Skip',
        style: TextStyle(
          //color: Color(0xFF052843),
            color: Colors.white,
          fontWeight: FontWeight.w600
        ),
        ),
        onFinish: ()async {
        final prefs = await SharedPreferences.getInstance();
          isIntro = true;
          prefs.setBool('Intro', isIntro);
          setState(() {
            Navigator.pushNamed(context, 'login');
          });
        },
        // trailing: Text('Login',
        //   style: TextStyle(
        //       color: Color(0xFF052843)
        //   ),
        // ),
        controllerColor: const Color(0xFF052843),
        background: [
          Container(
            height: 400,
            width: 425,
            //color: Colors.black,
            alignment: Alignment.center,
            child: Image.asset('images/intro 1.png', scale: 1.3),
          ),
          Container(
              height: 400,
              width: 425,
              //color: Colors.black,
              alignment: Alignment.center,
              child: Image.asset(
                'images/intro 2.png',
                scale: 1.3,
              )),
          Container(
              height: 400,
              width: 425,
              //color: Colors.black,
              alignment: Alignment.center,
              child: Image.asset(
                'images/intro 3.png',
                scale: 1.3,
              )),
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 440,
                  ),
                  Text(
                    'Create Your Music',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                      //color: Color(0xff001938),
                      color: Colors.white
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      wordSpacing: 0.2,
                      //color: Colors.black45,
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(
                  height: 440,
                ),
                Text(
                  'Enjoy Your Music',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                    //color: Color(0xff001938),
                    color: Colors.white
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                    //color: Colors.black45,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(
                  height: 440,
                ),
                Text(
                  'Shared Your Playlists',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                    //color: Color(0xff001938),
                      color: Colors.white
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                    //color: Colors.black45,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
