import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/size.dart';
class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final auth  = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() async {
    user = auth.currentUser!;
    user.sendEmailVerification();
    timer = Timer.periodic(
        const Duration(seconds: 3), (timer) {
          checkEmailVerified();
    });
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context)  {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:const Text('Verification',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                const FaIcon(FontAwesomeIcons.envelopeOpen,
                  size: 100,
                  color:  Color(0xfff77546),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                Center(
                  child: Text('Verify your email address',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(23),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text('We have just send email verification link on \nyour email. Please check email and click on \nthat link to verify your Email address',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade500
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text('If not auto redirected after verification, \nclick on the Continue button',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xfff77546),
                  ),
                  child: const Text('Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                const Text('Re-send ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfff77546)
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back to login',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfff77546)
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
  Future<void> checkEmailVerified() async  {
    user = auth.currentUser!;
    await user.reload();
    if(user.emailVerified){
      timer.cancel();
      autologin();
      if (!context.mounted) return;
      Navigator.of(context).pushReplacementNamed('Login');
    }
  }
  Future<void> autologin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    user = auth.currentUser!;
    pref.setString('email', user.email!);
  }
}

