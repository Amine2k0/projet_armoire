import 'package:arm/pages/ajouter.dart';
import 'package:arm/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/color_utils.dart';


class listevetements extends StatefulWidget {

  @override
  State<listevetements> createState() => _listevetementsState();
}

class _listevetementsState extends State<listevetements> {
  List<String> data=[];
  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser;
    String? name=user?.email;
    name=name?.replaceAll("smurf1@gmail.com","").toUpperCase();
    print(name);
    data=  ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(

      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4"),],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),

        child: Container(
          margin: EdgeInsets.only(top: 70),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home()),
                );},
                    child: Text('home')),
                Container(
                  margin: EdgeInsets.only(bottom: 10,top: 20,left: 10,right: 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        border: Border.all(
                          width: 3,
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                        padding: EdgeInsets.all(10),
                        child: Text('${name.toString()}\'s Closet',
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 1,
                            fontFamily: 'RaleWay',
                          ),

                        ),

                      ),
                      Spacer(),
                      ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyForm()),
                            );
                          },
                          child: Icon(Icons.add_box_outlined,
                                   color: Colors.deepPurple[900],
                                   size: 50,),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                          elevation: 0),

                                     )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 30,
                  indent: 20,
                  endIndent: 160,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Text('TOPS',style: TextStyle(fontSize: 30,color: Colors.black),),
                    Icon(Icons.arrow_right,size: 30,)
                  ],
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all( width: 2 ,color: Colors.black),

                  ),
                  child: Text('TOP'),
                ),//top
                Row(
                  children: [
                    Text('BOTTOM',style: TextStyle(fontSize: 30,color: Colors.black),),
                    Icon(Icons.arrow_right,size: 30,)
                  ],
                ),

                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all( width: 2 ,color: Colors.black),

                  ),
                  child: Text('Bottom'),
                ),//bottom
                Row(
                  children: [
                    Text('SHOES',style: TextStyle(fontSize: 30,color: Colors.black),),
                    Icon(Icons.arrow_right,size: 30,)
                  ],
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all( width: 2 ,color: Colors.black),

                  ),
                  child: Text('Shoes'),
                ),//shoes
                Row(
                  children: [
                    Text('ACCES',style: TextStyle(fontSize: 30,color: Colors.black),),
                    Icon(Icons.arrow_right,size: 30,)
                  ],
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all( width: 2 ,color: Colors.black),

                  ),
                  child: Text('ACCES'),
                ),//acces

                /*ListView.builder(
                         itemCount: data.length,
                         itemBuilder: (BuildContext context, int index) {
                           return Card(
                             child: ListTile(
                               title: Text(data[index]),
                             ),
                           );
                         },
                       ),*/
              ],
            ),
          ),
        ),
      ),
             



                   );
  }
}
