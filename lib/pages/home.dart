import 'package:arm/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';




class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}


class _homeState extends State<home> {
  List<XFile>img=[];
  List<String> clothes = [];
  String nom='';
  void addClothes() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajouter des vêtements'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                nom=value;
              });

            },
            decoration: InputDecoration(hintText: "Nom du vêtement"),
          ),
          actions: [
            TextButton(
              child: Text('Ajouter'),
              onPressed: () {
                clothes.add(nom);
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
  int _selectindex=0;

  void _in(int index){
    setState(() {
      _selectindex=index;
    });

  }
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        title: Text('Armoire'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.cyan[200],
      ),
      drawer: const NavigationDrawer(),
      body:
      Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            ElevatedButton(onPressed: addClothes, child:Text('Ajouter',style: TextStyle(letterSpacing: 1,fontSize: 30),)),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){Navigator.pushNamed(context, '/listevetements',arguments: clothes);},
              child:Text('Afficher',style:TextStyle(letterSpacing: 1,fontSize: 30))),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      SignInScreen()), (Route<dynamic> route) => false);
                },
                child:Text('log out',style:TextStyle(letterSpacing: 1,fontSize: 30))),

          ],
    ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.cyan[200],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checkroom_outlined),
            label: 'Closet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profil',
          ),


        ],
        currentIndex: _selectindex,
        onTap: _in,
      ),
      );


  }
}
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer();
  }
}
