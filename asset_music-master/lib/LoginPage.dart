import 'package:asset_music/Global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Form(
            key: loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 90,),
                Text("Sign In",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  color: Color(0xFF052843),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5
                ),
                ),
                const SizedBox(height: 2,),
                Text("Welcome Back",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      //color: Color(0xFF052843),
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18,top: 90),
                  child: TextFormField(
                    onChanged: (val){},
                    validator: (val){
                      if(val!.isEmpty)
                        {
                          return "Please Enter The Email";
                        }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Color(0xFF052843),
                        fontWeight: FontWeight.w500,
                       letterSpacing: 0.5
                       // fontSize: 16
                      ),
                      fillColor: Color(0xFFFAFAFA),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                         color: Color(0xFFFAFAFA),
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            //color: Color(0xFFFAFAFA),
                            color: Color(0xFF052843),
                          )
                      ),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF052843),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18,top: 25),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        setPass = val;
                      });
                    },
                    validator: (val){
                      if(val!.isEmpty)
                      {
                        return "Please Enter The Password";
                      }
                      else if(val.length != 4){
                        return "Please Enter The 4 number";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: Color(0xFF052843),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5
                        // fontSize: 16
                      ),
                      fillColor: Color(0xFFFAFAFA),
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFFAFAFA),
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            //color: Color(0xFFFAFAFA),
                            color: Color(0xFF052843),
                          )
                      ),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF052843),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 11.0,top: 10),
                  child: Row(
                    children: [
                      Checkbox(
                          activeColor: Color(0xFF052843),
                          value: islogin,
                          onChanged: (val){
                            setState(() {
                              islogin = val!;
                              print(rememberMe);
                            });
                          }
                      ),
                      Text("Remember me",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2
                      ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80,),
                GestureDetector(
                  onTap: () async {
                    if(loginKey.currentState!.validate())
                      {
                        if(pass == setPass)
                          {
                            final prefs = await SharedPreferences.getInstance();
                            Navigator.pushNamed(context, 'home');
                            prefs.setBool('Login', islogin);
                          }
                      }
                    },
                  child: Container(
                    height: 58,
                    width: 365,
                    decoration: BoxDecoration(
                      color: Color(0xFF052843),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    alignment: Alignment.center,
                    child: Text("Login",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6
                    ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
