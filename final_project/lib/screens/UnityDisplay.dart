// ignore_for_file: file_names

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

import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityDisplay extends StatefulWidget {
  const UnityDisplay({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UnityDisplayState createState() => _UnityDisplayState();
}

class _UnityDisplayState extends State<UnityDisplay> {
  late UnityWidgetController _unityWidgetController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unity Display'),
      ),
      body: UnityWidget(
        onUnityCreated: (controller) {
          _unityWidgetController = controller;
          _loadModel();
        },
        onUnityMessage: (message) {
          // Handle messages from Unity
        },
      ),
    );
  }

  void _loadModel() {
    _unityWidgetController.postMessage(
      'LoadModel',
      'E:\\3D-Model\\New folder\\Cyprys_House.obj',
      null, // You can specify the target if needed
    );
  }

  @override
  void dispose() {
    _unityWidgetController.dispose();
    super.dispose();
  }
}
