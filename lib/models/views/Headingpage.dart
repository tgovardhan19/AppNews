import 'package:flutter/material.dart';


class HeadingPage extends StatefulWidget {
  const HeadingPage({super.key});

  @override
  State<HeadingPage> createState() => _HeadingPageState();
}

class _HeadingPageState extends State<HeadingPage> {

_HeadingPageState(){
  _selectedVal = _productSizesList[0];
}

final _productSizesList = ["Newest", "Popular", "Oldest"];
String? _selectedVal = "";
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        const  Text(
            "Top HeadLines",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Row(
              children:const [
                Text('Sort:'),   
              ],
            ),
          ),

          DropdownButton(icon: Icon(Icons.arrow_drop_down),
            value: _selectedVal,
            items: _productSizesList.map(
              (e) => DropdownMenuItem(child: Text(e), value: e,)
              ).toList(),
             onChanged: (val) {
              setState(() {
                _selectedVal = val as String;
              });
             },
             )


        ],
      ),
    );
  }
}
