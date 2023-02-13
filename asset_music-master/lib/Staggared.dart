import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class Staggered extends StatefulWidget {
  const Staggered({Key? key}) : super(key: key);

  @override
  State<Staggered> createState() => _StaggeredState();
}

class _StaggeredState extends State<Staggered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),
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
                SizedBox(width: 110,),
                Text("Staggered",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff001938),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.custom(
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 4,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                      pattern: [
                        QuiltedGridTile(2, 2),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 2),

                      ],
                    ),

                    childrenDelegate: SliverChildBuilderDelegate((context,index){
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network("https://source.unsplash.com/random?sig=$index",fit: BoxFit.cover,),
                      );
                    }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
