

import 'package:flutter/material.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({super.key});

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  int _value = 4;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text("LOCATION"),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 5,
                          width: 50,
                          color: Colors.grey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 190),
                        child: Text(
                          "Choose your location",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      _radioButtons(),
                    ],
                  );
                },
              );
            },
            child: Row(
              children: [Icon(Icons.location_on), Text("India")],
            ),
          )
        ],
      ),
    );
  }

  Widget _radioButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("England"),
            Radio(
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {});
                }),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("India"),
            Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {});
                }),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Nepal"),
            Radio(
                value: 3,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {});
                })
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Australia"),
            Radio(
                value: 4,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {});
                })
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("America"),
            Radio(
                value: 5,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {});
                })
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("West Indies"),
            Radio(
                value: 6,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {});
                })
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Indonesia"),
            Radio(
                value: 7,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {});
                })
          ]),
          
          Padding(
            padding:
                const EdgeInsets.only(top: 3, right: 10, left: 10, bottom: 5),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Apply"),
                )),
          )
        ]),
      ),
    );
  }
}