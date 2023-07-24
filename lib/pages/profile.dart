import 'package:flutter/material.dart';



class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      color: Colors.black54,
      child: Container(
        margin: EdgeInsets.only(top: 280, left: 7, right: 7),
        padding: EdgeInsets.only(top: 30, left: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DressFinder',
              style: TextStyle(
                height: 1,
                fontSize: 40,
                color: Colors.purple.withOpacity(0.8),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Outfit Diary & Planner',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  height: 3,
                  fontSize: 22,
                  color: Colors.black.withOpacity(0.9),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'My Preferences',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  height: 0.5,
                  fontSize: 22,
                  color: Colors.black.withOpacity(0.9),
                ),
              ),
            ),
            TextButton(
              onPressed: () {}
                // Navigate to the AccountInfoPage and pass the account information
                //Navigator.push(
                  //context,
                  //MaterialPageRoute(
                   // builder: (context) => AccountInfoPage(
                    //  email: email,
                     // username: username,
                //      /password: password,
                    //),
                  //),
             ,
              child: Text(
                'My Account',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  height: 0.5,
                  fontSize: 22,
                  color: Colors.black.withOpacity(0.9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}