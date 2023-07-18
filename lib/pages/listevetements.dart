import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:arm/pages/item_details.dart';
import 'package:arm/pages/ajouter.dart';
import 'package:getwidget/getwidget.dart';

class ItemList extends StatelessWidget {
  ItemList({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  final user = FirebaseAuth.instance.currentUser;
  CollectionReference _reference =
  FirebaseFirestore.instance.collection('vetements');

  //_reference.get()  ---> returns Future<QuerySnapshot>
  //_reference.snapshots()--> Stream<QuerySnapshot> -- realtime updates
  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //Check error
            if (snapshot.hasError) {
              return Center(
                  child: Text('Some error occurred ${snapshot.error}'));
            }

            //Check if data arrived
            if (snapshot.hasData) {
              //get the data
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> documents = querySnapshot.docs;

              //Convert the documents to Maps
              List<Map> itemsT = documents.map((e) => e.data() as Map)
                  .where((element) =>
              element['email'] == user?.email && element['categorie'] == 'top')
                  .toList();
              List<Map> itemsB = documents.map((e) => e.data() as Map)
                  .where((element) =>
              element['email'] == user?.email &&
                  element['categorie'] == 'bottom')
                  .toList();
              List<Map> itemsS = documents.map((e) => e.data() as Map)
                  .where((element) =>
              element['email'] == user?.email &&
                  element['categorie'] == 'shoes')
                  .toList();
              //Display the list
              return SingleChildScrollView(
                child: Column(
                    children: [
                      Center(child: Text('--------------Top--------------',style: TextStyle(fontSize: 30),),),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: itemsT.length,
                        itemBuilder: (BuildContext context, int index) {
                          //Get the item at this index
                          Map thisItem = itemsT[index];
                          //REturn the widget for the list items
                          return GFListTile(
                            avatar: Container(
                              height: 80,
                              width: 80,
                              child: thisItem.containsKey('image') ? Image
                                  .network(
                                  '${thisItem['image']}') : Container(),
                            ),
                            title: Text('${thisItem['type']}'),
                            description: Text('${thisItem['occasion']}'),
                          );
                        }),
                      Center(child: Text('------------Bottom-------------',style: TextStyle(fontSize: 30),),),

                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: itemsB.length,
                          itemBuilder: (BuildContext context, int index) {
                            //Get the item at this index
                            Map thisItem = itemsB[index];
                            //REturn the widget for the list items
                            //if(thisItem['categorie']=='top')
                            return GFListTile(
                              avatar: Container(
                                height: 80,
                                width: 80,
                                child: thisItem.containsKey('image') ? Image
                                    .network(
                                    '${thisItem['image']}') : Container(),
                              ),
                              title: Text('${thisItem['type']}'),
                               description: Text('${thisItem['occasion']}'),
                            );
                          }),
                      Center(child: Text('------------Shoes-------------',style: TextStyle(fontSize: 30),),),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: itemsS.length,
                          itemBuilder: (BuildContext context, int index) {
                            //Get the item at this index
                            Map thisItem = itemsS[index];
                            //REturn the widget for the list items
                            //if(thisItem['categorie']=='top')
                            return GFListTile(
                              avatar: Container(
                                height: 80,
                                width: 80,
                                child: thisItem.containsKey('image') ? Image
                                    .network(
                                    '${thisItem['image']}') : Container(),
                              ),
                              title: Text('${thisItem['type']}'),
                            description: Text('${thisItem['occasion']}'),
                            );
                          }),


                    ]
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
      //Show loader


      //Display a list // Add a FutureBuilder
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyForm()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}