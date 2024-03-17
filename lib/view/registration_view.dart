import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:decoders/routes/routes_name.dart';
import 'package:decoders/utils/utils.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  bool _isObscured = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var customHeight = MediaQuery.of(context).size.height;
    var customWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/signup.svg',
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "By Signing in you're agreeing to our\nTerms and privacy policy",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: customHeight * 0.01,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    labelText: "User Name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  controller: _nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter Name here';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email_outlined),
                                    labelText: "Email Address",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(),
                                    ),
                                  ),
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
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.phone),
                                    labelText: "Mobile Number",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  controller: _mobileController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter a Number';
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
                                    prefixIcon: Icon(Icons.lock),
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
                                      borderSide: BorderSide(),
                                    ),
                                  ),
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
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xFF003366)),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        horizontal: 80, vertical: 15),
                                  ),
                                  textStyle:
                                      MaterialStateProperty.all<TextStyle>(
                                    TextStyle(fontSize: 16),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      UserCredential userCredentials =
                                          await _auth
                                              .createUserWithEmailAndPassword(
                                        email: _emailController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                      );
                                      // Save other info in firestore
                                      FirebaseFirestore firebaseFirestore =
                                          FirebaseFirestore.instance;
                                      await firebaseFirestore
                                          .collection('users')
                                          .doc(userCredentials.user!.uid)
                                          .set({
                                        'name': _nameController.text.trim(),
                                        'mobile': _mobileController.text.trim(),
                                        'email': _emailController.text.trim(),
                                        'created on': DateTime.now()
                                            .microsecondsSinceEpoch,
                                        'photo': null,
                                      });
                                      Utils().mySnackBar('Register Successful',
                                          "Credentials Match");
                                    } catch (e) {
                                      Utils().mySnackBar("Error", e.toString());
                                    }
                                  }
                                },
                                child: Text(
                                  'Register',
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
                                    "Already have an Account",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: customWidth * 0.01,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed(RouteName.loginVIew);
                                    },
                                    child: Text(
                                      "Login",
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
