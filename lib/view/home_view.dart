// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:decoders/view/auth/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CustomShakeAnimation extends StatefulWidget {
  final Widget child;
  final String begin, end;

  const CustomShakeAnimation({
    Key? key,
    required this.begin,
    required this.end,
    required this.child,
  });

  @override
  State<CustomShakeAnimation> createState() => _CustomShakeAnimationState();
}

class _CustomShakeAnimationState extends State<CustomShakeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _shakeAnimation = Tween<double>(
      begin: double.parse(widget.begin),
      end: double.parse(widget.end),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, _shakeAnimation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xff3B5998),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: Row(
            children: [
              Text(
                'Hey Kainat!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 120,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.licdn.com/dms/image/C4E03AQHVnTD2UDZ4wg/profile-displayphoto-shrink_800_800/0/1661858821047?e=1714608000&v=beta&t=h4uuCZs_fSD9E3v_oRtrHwppJJDePJ2DQXW_NNFyuhw'),
                radius: 25,
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Confirm'),
                            content: Text('Are you sure do you want to logout',style: TextStyle(fontSize: 20,),),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text('No')),
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                                FirebaseAuth.instance.signOut();
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginView()));
                              }, child: Text('Yes')),
                            ],
                          );
                        });
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  )),
            ],
          ),
          backgroundColor: Color(0xff3B5998),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Container(
                  height: 750,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 16,
                        left: 16,
                        right: 16,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border:
                                Border.all(color: Colors.grey), // Border added
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: 'Search...',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 16,
                        right: 16,
                        bottom: 16,
                        child: SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                topRight: Radius.circular(50.0),
                              ),
                            ),
                            // Add other widgets here
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 80.0, left: 10, bottom: 0),
                              child: Container(
                                width: 120,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xff3B5998),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'App Dev \nPhysical',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 80.0, left: 10, bottom: 0),
                              child: Container(
                                width: 120,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xff3B5998),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'App Dev \nOnline',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 80.0, left: 10, bottom: 0),
                              child: Container(
                                width: 120,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xff3B5998),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Cloud\nPhysical',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 80.0, left: 10, bottom: 0),
                              child: Container(
                                width: 120,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xff3B5998),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Cloud \nOnline',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 80.0, left: 10, bottom: 0),
                              child: Container(
                                width: 120,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xff3B5998),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ecommerce \nPhysical',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 80.0, left: 10, bottom: 0),
                              child: Container(
                                width: 120,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xff3B5998),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ecommerce \nOnline',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 80.0, left: 10, bottom: 0),
                              child: Container(
                                width: 120,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xff3B5998),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Data Analytics \nPhysical',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 80.0, left: 10, bottom: 0),
                              child: Container(
                                width: 120,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xff3B5998),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Data Analytics \nOnline',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            // Add other containers here
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 400,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Color(0xff3B5998),
                              borderRadius: BorderRadius.circular(30)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14, top: 2, bottom: 2),
                                      child: Text(
                                        'App Development Physical',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 140,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.all(16),
                                      ),
                                      child: Text(
                                        'view all',
                                        style: TextStyle(
                                          color: Color(0xff3B5998),
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ListTile(
                                    tileColor: Colors.white,
                                    title: Text('Username',
                                        style: TextStyle(color: Colors.white)),
                                    subtitle: Text('user info',
                                        style: TextStyle(color: Colors.white)),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://media.licdn.com/dms/image/C4E03AQHVnTD2UDZ4wg/profile-displayphoto-shrink_800_800/0/1661858821047?e=1714608000&v=beta&t=h4uuCZs_fSD9E3v_oRtrHwppJJDePJ2DQXW_NNFyuhw'),
                                    )),
                                ListTile(
                                    tileColor: Colors.white,
                                    title: Text('Username',
                                        style: TextStyle(color: Colors.white)),
                                    subtitle: Text('user info',
                                        style: TextStyle(color: Colors.white)),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://media.licdn.com/dms/image/C4E03AQHVnTD2UDZ4wg/profile-displayphoto-shrink_800_800/0/1661858821047?e=1714608000&v=beta&t=h4uuCZs_fSD9E3v_oRtrHwppJJDePJ2DQXW_NNFyuhw'),
                                    )),
                                ListTile(
                                    tileColor: Colors.white,
                                    title: Text('Username',
                                        style: TextStyle(color: Colors.white)),
                                    subtitle: Text('user info',
                                        style: TextStyle(color: Colors.white)),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://media.licdn.com/dms/image/C4E03AQHVnTD2UDZ4wg/profile-displayphoto-shrink_800_800/0/1661858821047?e=1714608000&v=beta&t=h4uuCZs_fSD9E3v_oRtrHwppJJDePJ2DQXW_NNFyuhw'),
                                    )),
                                ListTile(
                                    tileColor: Colors.white,
                                    title: Text('Username',
                                        style: TextStyle(color: Colors.white)),
                                    subtitle: Text('user info',
                                        style: TextStyle(color: Colors.white)),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://media.licdn.com/dms/image/C4E03AQHVnTD2UDZ4wg/profile-displayphoto-shrink_800_800/0/1661858821047?e=1714608000&v=beta&t=h4uuCZs_fSD9E3v_oRtrHwppJJDePJ2DQXW_NNFyuhw'),
                                    )),
                                ListTile(
                                    tileColor: Colors.white,
                                    title: Text('Username',
                                        style: TextStyle(color: Colors.white)),
                                    subtitle: Text('user info',
                                        style: TextStyle(color: Colors.white)),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://media.licdn.com/dms/image/C4E03AQHVnTD2UDZ4wg/profile-displayphoto-shrink_800_800/0/1661858821047?e=1714608000&v=beta&t=h4uuCZs_fSD9E3v_oRtrHwppJJDePJ2DQXW_NNFyuhw'),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff3B5998),
          showUnselectedLabels: true,
          showSelectedLabels: false,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: CustomShakeAnimation(
                begin: '0.0',
                end: '10.0',
                child: Icon(Icons.home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: CustomShakeAnimation(
                begin: '0.0',
                end: '10.0',
                child: Icon(Icons.add),
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: CustomShakeAnimation(
                begin: '0.0',
                end: '10.0',
                child: Icon(Icons.account_circle),
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
