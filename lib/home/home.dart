import 'package:flutter/material.dart';
import '../widgets/size.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Dashboard',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const PageScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                const Text('In Progress:',
                style: TextStyle(
                  color: Color(0xfff77546),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Row(
                  children: [
                    Container(
                      width: 240,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                const Text('Today Task:',
                  style: TextStyle(
                    color: Color(0xfff77546),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xfff77546),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: (){
          Navigator.of(context).pushNamed('add_project');
        },
        child: const Icon(Icons.add,
        size: 30,
        color: Colors.white,
        ),
      ),
    );
  }
}
