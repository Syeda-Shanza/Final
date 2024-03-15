import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late Future<DocumentSnapshot> userFuture;

  @override
  void initState() {
    userFuture = getUserDetails();
    super.initState();
  }

  Future<DocumentSnapshot> getUserDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return await FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff3B5998),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              children: [
                Text(
                  'kainat', // 'Hey ${userSnapshot!['name']}',
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 220,),
                Icon(Icons.logout,color: Colors.white,),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Color(0xff3B5998)));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            DocumentSnapshot userSnapshot = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(userSnapshot['photo']),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Name:${userSnapshot['name']}',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
                Text('Software Engineer| UI/UX Designer| Wordpress Developer'),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(top:0,left: 10,right: 10,bottom: 10),
                  child: Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 500,
                          width: 400,
                          decoration: BoxDecoration(color: Color(0xff3B5998), borderRadius: BorderRadius.circular(30)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListTile(
                                  tileColor: Colors.white,
                                  title: Text('Mobile Number', style: TextStyle(color: Colors.white)),
                                  subtitle: Text('03350655554', style: TextStyle(color: Colors.white)),
                                  leading: Icon(Icons.phone, color: Colors.white),
                                ),
                                ListTile(
                                  tileColor: Colors.white,
                                  title: Text('Email', style: TextStyle(color: Colors.white)),
                                  subtitle: Text('kainatbatool009@gmail.com', style: TextStyle(color: Colors.white)),
                                  leading: Icon(Icons.mail, color: Colors.white),
                                ),
                                ListTile(
                                  tileColor: Colors.white,
                                  title: Text('Group By', style: TextStyle(color: Colors.white)),
                                  subtitle: Text('Kainat Batool,Shanza Batool', style: TextStyle(color: Colors.white)),
                                  leading: Icon(Icons.group, color: Colors.white),
                                ),
                                ListTile(
                                  tileColor: Colors.white,
                                  title: Text('Project', style: TextStyle(color: Colors.white)),
                                  subtitle: Text('Github Link', style: TextStyle(color: Colors.white)),
                                  leading: Icon(Icons.link, color: Colors.white),
                                ),
                                ListTile(
                                  tileColor: Colors.white,
                                  title: Text('Screenshots', style: TextStyle(color: Colors.white)),
                                  subtitle: Text('Sample pics', style: TextStyle(color: Colors.white)),
                                  leading: Icon(Icons.photo, color: Colors.white),
                                ),
                                ListTile(
                                  tileColor: Colors.white,
                                  title: Text('Joined On', style: TextStyle(color: Colors.white)),
                                  subtitle: Text('29-2-2024', style: TextStyle(color: Colors.white)),
                                  leading: Icon(Icons.star_rounded, color: Colors.white),
                                ),
                                ListTile(
                                  tileColor: Colors.white,
                                  title: Text('Logout', style: TextStyle(color: Colors.white)),
                                  subtitle: Text('↪', style: TextStyle(color: Colors.white)),
                                  leading: Icon(Icons.logout, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
