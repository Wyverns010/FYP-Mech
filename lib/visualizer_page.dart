import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Performs Ackerman's Visualization
class Visualizer extends StatefulWidget {
  final String mechName;
  final String imageData;

  Visualizer({@required this.mechName, this.imageData});

  @override
  _VisualizerState createState() => _VisualizerState();
}

class _VisualizerState extends State<Visualizer> {
  var heightOfScreen;
  var widthOfScreen;
  String defaultImage = 'https://www.w3schools.com/w3css/img_lights.jpg';
  String imageURL;
  // phi, theta, a, b
  List<dynamic> _values = [null,null,null,null];
  var textControllerPhi = new TextEditingController();
  var textControllerTheta = new TextEditingController();
  var textControllerA = new TextEditingController();
  var textControllerB = new TextEditingController();


  // @override
  // void initState() {

  //   var ref = FirebaseStorage.instance.ref().child(widget.imageData);
  //   ref.getDownloadURL().then((value) => setState(() => imageURL = value));
  //   if (imageURL == null) imageURL = defaultImage;

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    heightOfScreen = MediaQuery.of(context).size.height;
    widthOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Simulation '),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        elevation: 0.5,
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        // builder: (context, model, child) => Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
                height: heightOfScreen * 0.4,
                child:
                    // Placeholder()
                    Center(
                  child: Image.asset(
                    'assets/visualize.png',
                    // width: 200,
                    // height: 200,
                    fit: BoxFit.contain,
                  ),
                )),

            Container(
              padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
              height: 80.0,
              width: double.maxFinite,
              child: ElevatedButton(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
                onPressed: () {
                  int count = 0;
                  int calcPos = 3;
                  for(int i;i<_values.length;i++) {
                    if(_values[i] == null) {
                      count += 1;
                      calcPos = i;
                    }
                  }

                  if(count > 1) {
                    GlobalAlertDialog.dialogBox(
                          context,
                          'Warning!',
                          'Please fill any three values to visualize');
                  }
                else {
                    if(calcPos == 0) {
                      _values[0] = math.atan(1/(_values[2]/_values[3] - 1/math.tan(_values[1]*math.pi/180)));
                      textControllerPhi.text = _values[0];
                      _values = [null,null,null,null];
                //       // setup text controller for updating value as degree
                    }
                    if(calcPos == 1) {
                      _values[1] = math.atan(1/math.tan(_values[0]*math.pi/180) - 1/(_values[2]/_values[3]));
                      textControllerTheta.text = _values[1];
                      _values = [null,null,null,null];
                      // setup text controller for updating value as degree
                    }
                    if(calcPos == 2) {
                      _values[2] = _values[3]*(1/math.tan(_values[0]*math.pi/180) - 1/math.tan(_values[1]*math.pi/180));
                      textControllerA.text = _values[2];
                      _values = [null,null,null,null];
                    }
                    if(calcPos == 3) {
                      _values[3] = _values[2]/(1/math.tan(_values[0]*math.pi/180) - 1/math.tan(_values[1]*math.pi/180));
                      textControllerB.text = _values[3];
                      _values = [null,null,null,null];
                    }
                  }

                },
                // padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                      colors: [Color(0xff667eea), Color(0xff64b6ff)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Container(
                    // color: Theme.of(context).primaryColor,
                    alignment: Alignment.center,
                    child: Text(
                      "Simulate",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //   Container(
            //   color: Theme.of(context).primaryColor,
            //   padding: const EdgeInsets.only(left: 20.0, right: 100, top: 40.0, bottom: 40.0),
            //   child: Text(
            //     'Input values in any 3:',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 20.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Container(
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  // leading: CircleAvatar(
                  //   backgroundImage: NetworkImage(imageUrlForCircularAvatar),
                  // ),
                  title: Text(widget.mechName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                  trailing: IconButton(
                      icon: Icon(Icons.info, color: Colors.white),
                      onPressed: () => GlobalAlertDialog.dialogBox(
                          context,
                          widget.mechName,
                          'The steering gear mechanism is used for changing the direction of two or more of the wheel axles with reference to the chassis')),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10.0, bottom: 10.0),
                child: Text(
                  'Input any three values: ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            inputBuilder(
              context,
              title: 'phi',
              value: null,
              pos: 0,
              textController: textControllerPhi
            ),
            SizedBox(height: 5),
            inputBuilder(
              context,
              title: 'Theta',
              value: null,
              pos: 0,
              textController: textControllerTheta
            ),
            SizedBox(height: 5),
            inputBuilder(
              context,
              title: 'a',
              value: null,
              pos: 0,
              textController: textControllerA
            ),
            SizedBox(height: 5),
            inputBuilder(
              context,
              title: 'b',
              value: null,
              pos: 0,
              textController: textControllerB
            ),
            SizedBox(height: 5),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 15.0),
            //     child: InkWell(
            //       onTap: () => Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => ReadMore())),
            //       child: RichText(
            //         text: TextSpan(
            //           text: 'Is it too confusing? ',
            //           style: DefaultTextStyle.of(context).style,
            //           children: <TextSpan>[
            //             TextSpan(
            //                 text: 'Read more.',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     color: iconColor)),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget inputBuilder(BuildContext context,{String title, dynamic value, int pos, TextEditingController textController}) {
    return Container(
      color: Theme.of(context).accentColor,
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child:TextFormField(
                        controller: textController,
                        initialValue: value,
                        obscureText: false,
                        // validator: (value) =>
                        //     value.isEmpty ? 'Enter your email' : null,
                        onChanged: (val) {
                          setState(() {
                            _values[pos] = val;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: title,
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        textAlign: TextAlign.left,
                      ),),
          // ListTile(
          //   title: Text(
          //     title,
          //     style: TextStyle(fontWeight: FontWeight.w500),
          //   ),
          //   trailing: FittedBox(
          //     child: Row(
          //       children: [
          //         // if (isPercentListTile) ...[
          //         //   Icon(
          //         //     double.parse(value) >= 0
          //         //         ? Icons.camera_front
          //         //         : Icons.camera_rear,
          //         //     color:
          //         //         double.parse(value) >= 0 ? Colors.green : Colors.red,
          //         //   )
          //         // ],
          //         SizedBox(
          //           width: 10,
          //         ),
          //         Text(
          //           value.toString(),
          //           style: TextStyle(
          //               color: Theme.of(context).appBarTheme.color,
          //               fontSize: 16),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15),
          //   child: Divider(),
          // )
        ],
      ),
    );
  }

  // List<String> _currencyList = COMPANY;
  String _chosenValue1;
  // void displayModalBottomSheet(context, defaultvalue) {
  //   showModalBottomSheet(
  //       elevation: 10.0,
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(15),
  //         topRight: Radius.circular(15),
  //       )),
  //       context: context,
  //       builder: (BuildContext buildContext) {
  //         return StatefulBuilder(
  //           builder: (BuildContext context, setState) {
  //             return Container(
  //               height: heightOfScreen / 3.7,
  //               child: Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Wrap(
  //                   direction: Axis.horizontal,
  //                   children: <Widget>[
  //                     CustomDropDownbutton(
  //                       dropDownButton: DropdownButton(
  //                         value: defaultvalue,
  //                         underline: Container(), // this is the magic
  //                         items: _currencyList
  //                             .map<DropdownMenuItem<String>>((String value) {
  //                           return DropdownMenuItem<String>(
  //                             value: value,
  //                             child: Text(value),
  //                           );
  //                         }).toList(),
  //                         onChanged: (value) {
  //                           setState(() {
  //                             defaultvalue = value;
  //                           });
  //                         },
  //                         hint: defaultvalue != null
  //                             ? Text(
  //                                 " $defaultvalue",
  //                               )
  //                             : Text(
  //                                 "$defaultvalue",
  //                               ),
  //                       ),
  //                     ),
  //                     CustomDropDownbutton(
  //                       dropDownButton: DropdownButton(
  //                         value: _chosenValue1,
  //                         underline: Container(), // this is the magic
  //                         items: _currencyList
  //                             .map<DropdownMenuItem<String>>((String value) {
  //                           return DropdownMenuItem<String>(
  //                             value: value,
  //                             child: Text(value),
  //                           );
  //                         }).toList(),
  //                         hint: _chosenValue1 != null
  //                             ? Text(
  //                                 " $_chosenValue1",
  //                               )
  //                             : Text(
  //                                 "Select currency.",
  //                               ),
  //                         onChanged: (value) {
  //                           setState(() {
  //                             _chosenValue1 = value;
  //                           });
  //                         },
  //                       ),
  //                     ),
  //                     InputFieldButton(
  //                       text: "Compare",
  //                       onPressed: () => Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) => ComparisonGraph( //TODO: update it acc to new data format
  //                                     symbol1: defaultvalue.toUpperCase(),
  //                                     symbol2: _chosenValue1.toUpperCase(),
  //                                   ))),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       });
  // }

  Stack photoStack({BuildContext context, String symbol}) {
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 1 / 2,
            width: double.maxFinite,
            child: Placeholder()
            //  WebView( //TODO: update graph for new data
            //   initialUrl:
            //       'https://finplexgraph.herokuapp.com/?symbol=${symbol}USDT&time=1m',
            //   javascriptMode: JavascriptMode.unrestricted,
            // ),
            ),
        Positioned(
          top: 10,
          left: -10,
          child: OutlineButton(
            shape: CircleBorder(),
            borderSide: BorderSide(color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}



class GlobalAlertDialog {
  static Future dialogBox(
      BuildContext context, String title, String body) async {
    final dialogShow = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(title),
            content: Text(body),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context), child: Text("Okay"))
            ],
          );
        });

    return dialogShow;
  }
}

  
  

// class CustomDropDownbutton extends StatelessWidget {
//   final DropdownButton dropDownButton;

//   const CustomDropDownbutton({Key key, this.dropDownButton}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return Container(
//       color: backgroundColor,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           width: width / 0.5,
//           padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               color: backgroundColor,
//               border: Border.all()),
//           child: DropdownButtonHideUnderline(child: dropDownButton),
//         ),
//       ),
//     );
//   }
// }
