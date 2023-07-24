import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OutfitPage(),
    );
  }
}

class OutfitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Text(
              'Outfit ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Casual',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [

        ],
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutfitItem('assets/jacket.png'),
                OutfitItem('assets/tshirt.png'),
                OutfitItem('assets/jean.png'),
                OutfitItem('assets/hat.png'),
                OutfitItem('assets/shoes.png'),
              ],
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 30,),
                  FloatingActionButton(
                    onPressed: () {
                      // Add functionality for the list button.
                    },
                    child: Icon(Icons.view_list),
                  ),
                  SizedBox(width: 10,),
                  IconButton(
                    icon: Icon(Icons.delete),
                    iconSize: 30,
                    onPressed: () {
                      // Add functionality for the delete button.
                    },

                  ),
                  SizedBox(width: 10,),
                  FloatingActionButton (
                    onPressed: () {
                      // Add functionality for the list button.
                    },
                    child:  Container(child: Text ('Wear Now')),
                  ),
                  SizedBox(width: 10,),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    iconSize: 30,
                    onPressed: () {
                      // Add functionality for the like button.
                    },
                  ),
                  SizedBox(width: 10,),
                  FloatingActionButton(
                    onPressed: () {
                      // Add functionality for the list button.
                    },
                    child: Text ('swipe'),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class OutfitItem extends StatelessWidget {
  final String imagePath;

  OutfitItem(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
