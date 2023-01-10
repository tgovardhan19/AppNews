import 'package:flutter/material.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
     const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for the news,topics...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.grey,
        ),
      ),
    ),
    );
  }
}