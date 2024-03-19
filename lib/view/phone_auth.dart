import 'package:decoders/view/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              controller:phoneController ,
            ),
          SizedBox(height: 30,),
            ElevatedButton(onPressed: ()async{
              await FirebaseAuth.instance.verifyPhoneNumber
                (verificationCompleted: (PhoneAuthCredential credential){},
                  verificationFailed: (FirebaseAuthException exception){},
                  codeSent: (String verificationid, int? resendtoken){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen(Verificationid:verificationid ,)));
                  },
                  codeAutoRetrievalTimeout: (String VerificationId){},phoneNumber: phoneController.text.toString(),);
            }, child: Text('verify'))
          ],
        ),
      ) ,
    );
  }
}
