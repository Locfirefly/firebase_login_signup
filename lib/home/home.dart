import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const Text('Home'),
                OutlinedButton(
                    onPressed: () async {
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      pref.remove('email');
                      if (!context.mounted) return;
                      Navigator.of(context).pushReplacementNamed('login');
                    },
                    child: const Text('Logout')
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
