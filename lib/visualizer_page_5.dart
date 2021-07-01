// Swashplate mechanism
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Performs swashplate mechanism's Visualization
class VisualizerFSCM extends StatefulWidget {
  final String mechName;
  final String imageData;
  final String mechDetails;

  VisualizerFSCM({@required this.mechName, this.imageData, this.mechDetails});

  @override
  _VisualizerState createState() => _VisualizerState();
}

class _VisualizerState extends State<VisualizerFSCM> {
  var heightOfScreen;
  var widthOfScreen;
  String defaultImage = 'https://www.w3schools.com/w3css/img_lights.jpg';
  String imageURL;
  // k, x, u (u=1/2*k*x^2)
  List<dynamic> _values = [null, null, null];
  var textControllerK = new TextEditingController();
  var textControllerX = new TextEditingController();
  var textControllerU = new TextEditingController();
  

  

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
                    widget.imageData !=null ? widget.imageData: 'assets/visualize.png',
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
                  print('listValues ' + _values.toString());
                  int count = 0;
                  int calcPos = 2;
                  for (int i = 0; i < 3; i++) {
                    if (_values[i] == null) {
                      count += 1;
                      calcPos = i;
                    }
                  }
                  print('checkFunctionality ' + (2).toString());
                  if (count > 1) {
                    GlobalAlertDialog.dialogBox(context, 'Warning!',
                        'Please fill any two values to visualize');
                  } else {
                    print('calcPos ' + calcPos.toString());
                    if (calcPos == 0) {
                      _values[0] = _values[2]*2/_values[1];
                      textControllerK.text = _values[0].toString();
                      _values = [null, null, null];
                     
                    }
                    if (calcPos == 1) {
                      _values[1] = math.sqrt(_values[2]*2/_values[0]);
                      textControllerX.text = _values[1].toString();
                      _values = [null, null, null];
                      // setup text controller for updating value as degree
                    }
                    if (calcPos == 2) {
                      _values[2] =1/2*_values[0]*math.pow(_values[2], 2);
                      textControllerU.text = _values[2].toString();
                      _values = [null, null, null];
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
                          widget.mechDetails != null ? widget.mechDetails
                          : 'The steering gear mechanism is used for changing the direction of two or more of the wheel axles with reference to the chassis')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10.0, bottom: 10.0),
              child: Text(
                'Input any two values: ',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              color: Theme.of(context).accentColor,
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: textControllerK,
                      // initialValue: null,
                      // obscureText: false,
                      // validator: (value) =>
                      //     value.isEmpty ? 'Enter your email' : null,
                      onChanged: (val) {
                        setState(() {
                          _values[0] = double.parse(val);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "k",
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: textControllerX,
                      // initialValue: null,
                      // obscureText: false,
                      // validator: (value) =>
                      //     value.isEmpty ? 'Enter your email' : null,
                      onChanged: (val) {
                        setState(() {
                          _values[1] = double.parse(val);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "x",
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: textControllerU,
                      // initialValue: null,
                      // obscureText: false,
                      // validator: (value) =>
                      //     value.isEmpty ? 'Enter your email' : null,
                      onChanged: (val) {
                        setState(() {
                          _values[2] = double.parse(val);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "u",
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  
                ],
              ),
            ),

            
          ],
        ),
      ),
    );
  }

  Widget inputBuilder(BuildContext context,
      {String title,
      dynamic value,
      int pos,
      TextEditingController textController}) {
    return Container(
      color: Theme.of(context).accentColor,
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
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
            ),
          ),
        ],
      ),
    );
  }

  

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


