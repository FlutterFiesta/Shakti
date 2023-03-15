import 'package:flutter/material.dart';
import 'package:power_she_pre/components/EndDrawer.dart';
import 'package:power_she_pre/constants.dart';
import '../components/AppBarHome.dart';
import '../components/BottomBar.dart';

class Puberty extends StatelessWidget {
  static const String id = "puberty";
  Puberty({Key? key}) : super(key: key);

  List<String> factors = ['Good nutrition and general health.', 'Starts earlier in slightly overweight girls.', 'Occurs earlier in girls whose mothers matured early.', 'Starts earlier in blacks and hispanics than in Asians and whites.'];
  List<String> changes = ['Feeling overly sensitive', 'Looking for an identity', 'Feeling uncertain','Peer pressure', 'Conflicting thoughts', 'Mood swings', 'Feeling conscious about self', 'Getting sexual feelings'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: kpink,
      title: Padding(
        padding: const EdgeInsets.only(right: 0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('PUBERTY'))
            ],
          ),
        ),
      ),
    ),
      endDrawer: EndDrawer(),
      bottomNavigationBar: BottomBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
            // Center(
            //     child: Text(
            //       "PUBERTY",
            //       style: TextStyle(
            //         fontWeight: FontWeight.w900,
            //         fontSize: 25,
            //       ),
            //     ),
            //   ),
              
            //   SizedBox(
            //     height: 10,
            //   ),

              Expanded(
                child: ListView(
                  children: [
                              
                      
              
                      ClipRRect(
                        child: Image.asset('images/Puberty1.webp'),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
              
                      SizedBox(
                        height: 10,
                      ),
              
                      ClipRRect(
                        child: Image.asset('images/Puberty2.jpg'),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
              
                      SizedBox(
                        height: 10,
                      ),
              
                      Text(
                        "Puberty is a sequence of events in which physical changes occur, resulting in adult physical characteristics and capacity to reproduce. These physical changes are regulated by changes in the levels of hormones that are produced by the pituitary gland—luteinizing hormone and follicle-stimulating hormone.",
                        style: TextStyle(
                          height: 2.0,
                        ),
                        textAlign: TextAlign.justify,
                      ),
              
                      SizedBox(
                        height: 10,
                      ),
              
                      Text(
                        'Influential factors for female puberty starts quickly',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              
                      SizedBox(
                        height: 10,
                      ),
              
                      Column(
                        children: factors.map((strone){
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Text("\u2022", style: TextStyle(height: 2.0),), //bullet text
                                  SizedBox(width: 10,), //space between bullet and text
                                  Expanded( 
                                    child:Text(strone, style: TextStyle(height: 2.0,), textAlign: TextAlign.justify,), //text
                                  )
                                ]
                            );
                        }).toList(),
                      ),
              
                    SizedBox(
                        height: 10,
                      ),
              
                      Text(
                        'Emotional changes that occur during puberty',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              
                      SizedBox(
                        height: 10,
                      ),
              
                      Column(
                        children: changes.map((strone){
                            return Row(
                                children:[
                                  Text("\u2022", style: TextStyle(height: 2.0,),), //bullet text
                                  SizedBox(width: 10,), //space between bullet and text
                                  Expanded( 
                                    child:Text(strone, style: TextStyle(height: 2.0,), textAlign: TextAlign.justify,), //text
                                  )
                                ]
                            );
                        }).toList(),
                      ),
              
                ]),
              ),

        ],),
      )
      
      
    );
  }
}