import 'dart:async';

import 'package:decoders/view/auth/login_view.dart';
import 'package:decoders/view/email_verification.dart';
import 'package:get/get.dart';

class SplashServices {
  void isLogin() {
    Timer(
      Duration(seconds: 3),
      () => Get.to(EmailVerification()),
    );
  }
}
