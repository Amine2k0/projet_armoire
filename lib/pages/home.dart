import 'package:arm/pages/listevetements.dart';
import 'package:arm/pages/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:arm/pages/Weather.dart';
import 'package:arm/pages/navbar.dart';
import 'package:arm/pages/image_caroussel.dart';

import '../utils/color_utils.dart';
import 'homeclass.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

Future<String> getnom() async{
  final user= await FirebaseAuth.instance.currentUser?.email;
  String nom='';
  await FirebaseFirestore.instance.collection('users').doc(user)
      .get().then<dynamic>((DocumentSnapshot snapshot)async {
    nom=snapshot.get('nom');
  } );

  return nom;
}

class _HomeState extends State<Home> {
  final nom=getnom();
  static  List<Widget> _pages = <Widget>[
    Homef(),
    ItemList(),
    Profil(),
  ];
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2ece1),
      // appBar: AppBar(
      //   title: Text('Hello @Ndc'),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Color(0xFF016571),
      // ),
      //drawer: Navbar(),
      body:SingleChildScrollView(
        child: SafeArea(child:Column(children: [
          FutureBuilder<String>(
            future: getnom(),
            builder: (
                BuildContext context,
                AsyncSnapshot<String> snapshot,
                ) {
              print(snapshot.connectionState);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return  Container(
                    height: 100,
                    width: 100,
                    child:
                    Center(child:
                    Text('Hi ${snapshot.data}'),),
                    decoration: BoxDecoration(color:Color(0xFF016571),border: Border.all(color: Color(0xFF016571),width: 2),
                        borderRadius: BorderRadius.circular(20)),
                  );
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            },
          ),

            _pages.elementAt(_selectedIndex) ,


        ],)),
      ),
      bottomNavigationBar: Container(

        //decoration: BoxDecoration(
          //color: Colors.grey[700],
          //borderRadius: BorderRadius.only(
           // topLeft: Radius.circular(20),
            //topRight: Radius.circular(20),


        child: BottomNavigationBar(
          selectedItemColor: Colors.brown[200],
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xFF016571),
          elevation: 0,
          iconSize: 25,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Vêtements',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

}