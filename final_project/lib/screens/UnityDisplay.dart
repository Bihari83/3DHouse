// // ignore_for_file: file_names, unnecessary_import

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_unity_widget/flutter_unity_widget.dart';

// class UnityDisplay extends StatefulWidget {
//   const UnityDisplay({Key? key}) : super(key: key);

//   @override
//   UnityTestingState createState() => UnityTestingState();
// }

// class UnityTestingState extends State<UnityDisplay> {
//   late UnityWidgetController _unityWidgetController;
//   double _sliderValue = 0.0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Your Future Home!'),
//         ),
//         body: Card(
//           margin: const EdgeInsets.all(8),
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           child: Stack(
//             children: <Widget>[
//               UnityWidget(
//                 onUnityCreated: onUnityCreated,
//               ),
//               Positioned(
//                 bottom: 20,
//                 left: 20,
//                 right: 20,
//                 child: Card(
//                   elevation: 10,
//                   child: Column(
//                     children: <Widget>[
//                       const Padding(
//                         padding: EdgeInsets.only(top: 20),
//                         child: Text("Rotation speed:"),
//                       ),
//                       Slider(
//                         onChanged: (value) {
//                           setState(() {
//                             _sliderValue = value;
//                           });
//                           setRotationSpeed(value.toString());
//                         },
//                         value: _sliderValue,
//                         min: 0,
//                         max: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void onUnityCreated(UnityWidgetController controller) {
//     _unityWidgetController = controller;
//   }

//   void setRotationSpeed(String speed) {
//     _unityWidgetController.postMessage(
//       'Cyprys_House',
//       'SetRotationSpeed',
//       speed,
//     );
//   }
// }

// ignore_for_file: file_names, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityDisplay extends StatefulWidget {
  const UnityDisplay({Key? key}) : super(key: key);

  @override
  UnityTestingState createState() => UnityTestingState();
}

class UnityTestingState extends State<UnityDisplay> {
  late UnityWidgetController _unityWidgetController;
  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Your Future Home!'),
        ),
        body: Card(
          margin: const EdgeInsets.all(8),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: <Widget>[
              UnityWidget(
                onUnityCreated: onUnityCreated,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Rotation speed:"),
                      ),
                      Slider(
                        onChanged: (value) {
                          setState(() {
                            _sliderValue = value;
                          });
                          setRotationSpeed(value.toString());
                        },
                        value: _sliderValue,
                        min: 0,
                        max: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _unityWidgetController.postMessage(
                            'Bambo_House',
                            'ZoomIn',
                            '0.1', // Adjust the zoom amount as needed
                          );
                        },
                        child: const Text('Zoom In'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _unityWidgetController.postMessage(
                            'Bambo_House',
                            'ZoomOut',
                            '0.1', // Adjust the zoom amount as needed
                          );
                        },
                        child: const Text('Zoom Out'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onUnityCreated(UnityWidgetController controller) {
    _unityWidgetController = controller;
  }

  void setRotationSpeed(String speed) {
    _unityWidgetController.postMessage(
      'Bambo_House',
      'SetRotationSpeed',
      speed,
    );
  }
}
