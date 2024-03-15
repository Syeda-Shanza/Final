// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:decoders/routes/routes_name.dart';
import 'package:decoders/view/email_verification.dart';
import 'package:decoders/view/home_view.dart';
import 'package:decoders/view/selection_screen/selection_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    var customHeight = MediaQuery.of(context).size.height;
    var customWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff3B5998),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: customHeight * 0.04,
            ),
            Center(
              child: Container(
                width: customWidth * 0.9,
                height: customHeight * 0.93,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(children: [
                  SizedBox(
                    height: customHeight * 0.05,
                  ),
                  Image(image: AssetImage('assets/images/students.jpg')),
                  SizedBox(
                    height: customHeight * 0.02,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: customHeight * 0.02,
                  ),
                  Text(
                    "By Signing in your agreeing our \n "
                    "Terms and privacy policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: customHeight * 0.04,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined),
                                labelText: "Email Address",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide())),
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a valid Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            obscureText: _isObscured,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscured = !_isObscured;
                                    });
                                  },
                                ),
                                labelText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide())),
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Incorrect Password';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: customHeight * 0.04,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF003366)),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 15),
                            ),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(fontSize: 16),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(content: Text('Processing Data')),
                              // );
                              Get.snackbar(
                                'Processing',
                                'Checking Credentials',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                              // Access the form field's value
                              print(_emailController.text +
                                  "\n" +
                                  _passwordController.text);
                            }
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: customHeight * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have and account?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: customWidth * 0.01,
                            ),
                            TextButton(
                              onPressed: () async{
                                Get.toNamed(RouteName.registrationView);
                                try{
                                  FirebaseAuth auth = FirebaseAuth.instance;
                                  UserCredential? userC= await auth.signInWithEmailAndPassword(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim());
                                  if(userC.user!.emailVerified){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeView()));
                                  }
                                  else{
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>EmailVerification()));

                                  }
                                }
                                on FirebaseAuthException catch (e){
                                  print(e.message);
                                }
                              },
                              child: Text(
                                "Resigter",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
