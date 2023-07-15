import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String? _type='';
  String? _color='';
  String? _occasion='';
  final user=FirebaseAuth.instance.currentUser?.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Add Clothes'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(top: 35),
          child: Column(
            children: <Widget>[
              TextFormField(
                style: TextStyle(color: Colors.grey.withOpacity(0.9)),
                decoration: InputDecoration(
                  labelText: 'input',
                  labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.grey.withOpacity(0.3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter a type';
                  }
                  return null;
                },
                onSaved: (value) {
                  _type = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.grey.withOpacity(0.9)),
                decoration: InputDecoration(
                  labelText: 'color',
                  labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.grey.withOpacity(0.3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter a color';
                  }
                  return null;
                },
                onSaved: (value) {
                  _color = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.grey.withOpacity(0.9)),
                decoration: InputDecoration(
                  labelText: 'occasion',
                  labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.grey.withOpacity(0.3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter an occasion';
                  }
                  return null;
                },
                onSaved: (value) {
                  _occasion = value;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                   Createvete(color: _color.toString(), type: _type.toString(), occasion: _occasion.toString());
                  }
                },
                child: Text('Submit'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.grey;
                      }
                      return Colors.purple;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
              ),

            ],
          ),
        ),
      ),
    );

  }
  Future Createvete({required String color ,required String type ,required String occasion}) async{
    final docvet = FirebaseFirestore.instance.collection('vetements').doc();
    final data={
      'couleur': color,
      'email':user,
      'type':type,
      'occasion':occasion,

    };
    await docvet.set(data);

  }
}


