import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/controllers/locationspage.dart';
import 'package:flutter_application_1/models/views/Headingpage.dart';
import 'package:flutter_application_1/models/views/floatingaction.dart';
import 'package:flutter_application_1/models/views/searchpage.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leadingWidth: 75,
        leading: const Center(
            child: Text(
          'MyNEWS',
          style: TextStyle(
            fontSize: 15,
          ),
        )),
        actions:const <Widget>[
          
          LocationsPage(),
        ],
      ),
      
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            SizedBox(height: 10),
            SearchPage(),
            HeadingPage(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionPage(),
    );
  }
 
}