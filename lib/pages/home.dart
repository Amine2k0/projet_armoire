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

class _HomeState extends State<Home> {
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
      appBar: AppBar(
        title: Text('Hello @Ndc'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF016571),
      ),
      drawer: Navbar(),
      body: _pages.elementAt(_selectedIndex),
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
  Future<Text> getName () async {
    String username='';
    final usermail=FirebaseAuth.instance.currentUser?.email;
    await FirebaseFirestore.instance.collection('users').doc(usermail).get()
        .then<dynamic>((DocumentSnapshot snapshot) async{
          username=snapshot.get('nom');
    });
    return Text('Hello {$username}');
  }
}