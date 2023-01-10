import 'package:flutter/material.dart';

class FloatingActionPage extends StatefulWidget {
  const FloatingActionPage({super.key});

  @override
  State<FloatingActionPage> createState() => _FloatingActionPageState();
}

class _FloatingActionPageState extends State<FloatingActionPage> {
  Map<String, bool> newssources = {
    'News Source 1': false,
    'News Source 2': false,
    'News Source 3': false,
    'News Source 4': false,
    'News Source 5': false,
    'News Source 6': false,
  };
  

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 5,
                    width: 50,
                    color: Colors.grey,
                  ),
                ),
              const  Padding(
                  padding: const EdgeInsets.only(right: 190),
                  child: Text(
                    "Filter by the sources",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: newssources.keys.map((String key) {
                      return  CheckboxListTile(
                        title:  Text(key),
                        value: newssources[key],
                        activeColor: Colors.blue,
                        checkColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            newssources[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                ElevatedButton(
                  child: Text("Apply Filter"),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ]),
            );
          },
        );
      },
      backgroundColor: Colors.blue,
      child: const Icon(Icons.filter_alt),
    );
  }
}
 