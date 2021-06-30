import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project/visualizer_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:fyp_project/visualizer_page_2.dart';
import 'package:fyp_project/visualizer_page_3.dart';

import 'login_page.dart';

class MechanismsList extends StatelessWidget {
  // add scenform asset binaries (.sfb files) to the list below
  // this controls the backend data loading structure
  final List<String> modelNames = [
    'Steering gear mechanism (Ackerman’s)',
    'Universal Mechanism',
    'Flexible Slider crank mechanism',
    'Swashplate mechanism',
    'Spring type operating mechanism'
  ];

  // add name(s) of model(s) added in above list to the list below
  // this controls the UI
  final List<String> headings = [
    'Steering gear mechanism (Ackerman’s)',
    'Universal Mechanism',
    'Flixible Slider crank mechanism',
    'Swashplate mechanism',
    'Spring type operating mechanism'
  ];
  final List<String> images = [
    'assets/visualize.png',
    'assets/universal_joint.jpg',
    'assets/slider_crank.jpg',
    'assets/visualize.png',
    'assets/visualize.png'
  ];

  final List<String> details = [
    'The steering gear mechanism is used for changing the direction of two or more of the wheel axles with reference to the chassis',
    'The universal joint mechanism (Hooke’s coupling) transmits rotary motion while allowing for various relative angles and displacements between the driver and follower.',
    'This mechanism involves the conversion of translation motion into rotary motion or translation motion into rotary motion',
    'A swashplate mechanism controls the cyclic and collective pitch of the rotor blades. The cyclic pitch of the rotor blades is used to change a helicopter’s roll and pitch.',
    'It involves the concept of energy stored in the springs and that can be utilized for different work applications. Springs are used to absorb energy and restore it slowly or rapidly'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        // height: MediaQuery.of(context).size.height,
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 100, top: 40.0, bottom: 40.0),
            child: Text(
              'Select an option to Begin',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            // width: double.maxFinite,
            // height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                dragStartBehavior: DragStartBehavior.down,
                itemCount: modelNames.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: TestingOptions(
                        displayText: headings[index],
                      ),
                    ),
                    onTap: () {
                      if (index == 2) {
                        Navigator.of(context).push(
                            // MaterialPageRoute(builder: (BuildContext context) => ARScene(nameModel: modelNames[index] ?? 'glasses11.sfb',))
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    VisualizerFSCM(mechName: headings[index], imageData: images[index], mechDetails: details[index])));
                      }
                      if (index == 1) {
                        Navigator.of(context).push(
                            // MaterialPageRoute(builder: (BuildContext context) => ARScene(nameModel: modelNames[index] ?? 'glasses11.sfb',))
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    VisualizerUJM(mechName: headings[index], imageData: images[index], mechDetails: details[index])));
                      } 
                      
                      Navigator.of(context).push(
                          // MaterialPageRoute(builder: (BuildContext context) => ARScene(nameModel: modelNames[index] ?? 'glasses11.sfb',))
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Visualizer(mechName: headings[index], imageData: images[index], mechDetails: details[index])));
                      
                    },
                  );
                }),
          )
        ]),
      ),
    );
  }
}

class TestingOptions extends StatelessWidget {
  String displayText;

  TestingOptions({
    this.displayText = 'Select This',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: double.maxFinite,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Theme.of(context).primaryColor,
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                this.displayText,
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
