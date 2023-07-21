import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:weather/weather.dart';
import 'package:arm/pages/home.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



Future<Map<String, dynamic>> getWeatherData(String apiKey ) async {
  String mycity='';
  final usermail= await FirebaseAuth.instance.currentUser?.email;
  await FirebaseFirestore.instance.collection('users').doc(usermail)
      .get()
      .then<dynamic>((DocumentSnapshot snapshot) async{mycity=snapshot.get('ville');});
  final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$mycity&appid=$apiKey&units=metric');
      final response = await http.get(url);
  if (response.statusCode == 200) {
    final body = json.decode(response.body);
    return body;
  } else {
    throw Exception('Failed to load weather data');
  }

}
class weather extends StatelessWidget {
  final String apiKey = '7bbccf8220846f49f8b3cbb9ab028454';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<Map<String, dynamic>>(
        future: getWeatherData(apiKey),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final weatherData = snapshot.data;
            final temperature = weatherData?['main']?['temp'];
            return Align(
              alignment: Alignment.topCenter,
              child: Text('Temperature : $temperature°C' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            );
          }
        },
      ),
    );
  }
}