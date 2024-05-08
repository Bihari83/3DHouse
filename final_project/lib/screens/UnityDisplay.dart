// ignore_for_file: file_names, unnecessary_import

// import 'package:flutter/material.dart';

// class UnityDisplay extends StatelessWidget {
//   const UnityDisplay({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Unity Display'),
//       ),
//       body: const Center(
//         child: Text(
//           'This is where Model shows',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_unity_widget/flutter_unity_widget.dart';

// class UnityDisplay extends StatefulWidget {
//   const UnityDisplay({Key? key}) : super(key: key);

//   @override
//   _UnityDisplayState createState() => _UnityDisplayState();
// }

// class _UnityDisplayState extends State<UnityDisplay> {
//   late UnityWidgetController _unityWidgetController;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Unity Display'),
//       ),
//       body: UnityWidget(
//         onUnityCreated: (controller) {
//           _unityWidgetController = controller;
//           _loadModel();
//         },
//         onUnityMessage: (message) {
//           // Handle messages from Unity
//         },
//       ),
//     );
//   }

//   void _loadModel() {
//     _unityWidgetController.postMessage(
//       'LoadModel',
//       'E:\\3D-Model\\New folder\\Cyprys_House.obj',
//       // Add message data if needed, it's the third positional argument
//     );
//   }

//   @override
//   void dispose() {
//     _unityWidgetController.dispose();
//     super.dispose();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_unity_widget/flutter_unity_widget.dart';

// class UnityDisplay extends StatefulWidget {
//   const UnityDisplay({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _UnityDisplayState createState() => _UnityDisplayState();
// }

// class _UnityDisplayState extends State<UnityDisplay> {
//   late UnityWidgetController _unityWidgetController;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Unity Display'),
//       ),
//       body: UnityWidget(
//         onUnityCreated: (controller) {
//           _unityWidgetController = controller;
//           _loadModel();
//         },
//         onUnityMessage: (message) {
//           // Handle messages from Unity
//         },
//       ),
//     );
//   }

//   void _loadModel() {
//     _unityWidgetController.postMessage(
//       'LoadModel',
//       'E:\\3D-Model\\New folder\\Cyprys_House.obj',
//       null, // You can specify the target if needed
//     );
//   }

//   @override
//   void dispose() {
//     _unityWidgetController.dispose();
//     super.dispose();
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_unity_widget/flutter_unity_widget.dart';

// class UnityDisplay extends StatefulWidget
// {
//   const UnityDisplay({super.key});

//   @override
//   UnityTestingState createState() => UnityTestingState();
// }

// class UnityTestingState extends State<UnityDisplay>
// {

//   late UnityWidgetController _unityWidgetController;
//   double _sliderValue = 0.0;

//   get onUnityMessage => null;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Unity Flutter Demo'),
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
//                 isARScene: true, onUnityCreated: (UnityWidgetController controller) {  },
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
//     void onUnityCreated(controller) {
//     _unityWidgetController = controller;
//   }

//     void setRotationSpeed(String speed) {
//     _unityWidgetController.postMessage(
//       'Bambo_House',
//       'SetRotationSpeed',
//       speed,
//     );
//   }
// }

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
          title: const Text('Unity Flutter Demo'),
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

