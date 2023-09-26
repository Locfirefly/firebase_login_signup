import 'package:firebase_login_signup/repository/user_repo.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  final UserRepository userRepository;
  const Login(this.userRepository,{super.key});

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  void cleartext(){
    emailController.clear();
    passController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade800,width: 2),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(1, 1),
                                blurRadius: 15,
                                color: Colors.grey.shade800
                              )
                            ]
                        ),
                        child: const Icon(Icons.arrow_back_ios_new,
                            color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text('Login',
                        style: TextStyle(fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text('Login with one of this following ',
                    style: TextStyle(fontSize: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 170,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(157, 53, 53, 53),
                        border: Border.all(color: Colors.grey.shade800),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.apple,color: Colors.white,size: 30),
                    ),
                    Container(
                      width: 170,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(157, 53, 53, 53),
                        border: Border.all(color: Colors.grey.shade800),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.facebook,color: Colors.white,size: 27),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Email',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: TextFormField(
                    maxLength: 40,
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if (value!.isEmpty) {
                        return 'Email is required';
                      }
                      bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                      if(!emailValid){
                        return 'Enter valid email';
                      }
                      return '';
                    },
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(157, 53, 53, 53),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade800,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                          color: Colors.pinkAccent,
                        )
                      )
                    ),
                  ),
                  ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: TextFormField(
                    maxLength: 40,
                    controller: passController,
                    obscureText: passToggle,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if (value!.isEmpty) {
                        return 'Email is required';
                      }
                      bool emailValid = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value);
                      if(!emailValid){
                        return 'Enter valid email';
                      }
                      return "";
                    },
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(157, 53, 53, 53),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey.shade500,
                        ),
                      ),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade800,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.pinkAccent,
                          ),
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 65),
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffb716dc),
                            Color(0xffcf25af),
                          ]
                        ),
                      ),
                      child: const Text('Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don`t have account?',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, 'signup');
                      },
                      child: const Text('Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
             ],
            ),
          )
      ),
    );
  }

}
