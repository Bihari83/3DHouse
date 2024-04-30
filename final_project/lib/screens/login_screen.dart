// import 'package:final_project/screens/home_screen.dart';
// import 'package:final_project/screens/registration_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
  
//   //form key
//   final _formKey = GlobalKey<FormState>();

//   //editing controller
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   //firebase
//   final _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     //email field
//     final emailField = TextFormField(
//         autofocus: false,
//         controller: emailController,
//         keyboardType: TextInputType.emailAddress,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("Please Enter Your Email");
//           }
//           // reg expression for email validation
//           if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//               .hasMatch(value)) {
//             return ("Please Enter a valid email");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           emailController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           // ignore: prefer_const_constructors
//           prefixIcon: Icon(Icons.mail),
//           // ignore: prefer_const_constructors
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Email",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));

//     //password field
//     final passwordField = TextFormField(
//         autofocus: false,
//         controller: passwordController,
//         obscureText: true,

//         validator: (value) {
//           RegExp regex = RegExp(r'^.{6,}$');
//           if (value!.isEmpty) {
//             return ("Password is required for login");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Enter Valid Password(Min. 6 Character)");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           passwordController.text = value!;
//         },
//         textInputAction: TextInputAction.done,
//         decoration: InputDecoration(
//           // ignore: prefer_const_constructors
//           prefixIcon: Icon(Icons.vpn_key),
//           // ignore: prefer_const_constructors
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Password",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));

//     final loginButton = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(30),
//       color: const Color.fromARGB(255, 247, 247, 2),
//       child: MaterialButton(
//           // ignore: prefer_const_constructors
//           padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           minWidth: MediaQuery.of(context).size.width,
//           onPressed: () {
//             signIn(emailController.text, passwordController.text);
//           },
//           // ignore: prefer_const_constructors
//           child: Text(
//             "Login",
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//                 fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//           )),
//     );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(36.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(
//                         height: 200,
//                         child: Image.asset(
//                           "assets/logo.png",
//                           fit: BoxFit.contain,
//                         )),
//                     const SizedBox(height: 45),
//                     emailField,
//                     const SizedBox(height: 25),
//                     passwordField,
//                     const SizedBox(height: 35),
//                     loginButton,
//                     const SizedBox(height: 15),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         const Text("Don't have an account? "),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const RegistrationScreen()));
//                           },
//                           child: const Text(
//                             "SignUp",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 15),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   //login function
//   void signIn(String email, String password) async {
//     if(_formKey.currentState!.validate()) {
//       await _auth
//       .signInWithEmailAndPassword(email: email, password: password)
//       .then((uid) => {
//         Fluttertoast.showToast(msg: "Login Successful"),
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => const HomeScreen())),
//       })
//       // ignore: body_might_complete_normally_catch_error
//       .catchError((e){
//         Fluttertoast.showToast(msg: e!.message);
//       });
//     }
//   }



// }

import 'package:final_project/screens/home_screen.dart';
import 'package:final_project/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Your Email";
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return "Please Enter a valid email";
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "Password is required for login";
        }
        if (!regex.hasMatch(value)) {
          return "Enter Valid Password(Min. 6 Character)";
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 247, 247, 2),
      child: _isLoading
          ? const CircularProgressIndicator() // Show loading spinner if isLoading is true
          : MaterialButton(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                signIn(emailController.text, passwordController.text);
              },
              child: const Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 45),
                    emailField,
                    const SizedBox(height: 25),
                    passwordField,
                    const SizedBox(height: 35),
                    loginButton,
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegistrationScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        Fluttertoast.showToast(msg: "Login Successful");
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}

