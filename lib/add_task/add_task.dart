import 'package:flutter/material.dart';
import '../widgets/size.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Create Project',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  maxLength: 50,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Task Name',
                    counterText: '',
                    hintText: "Enter your task name",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfff77546),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade400,
                  ),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    counterText: '',
                    hintText: "Enter your task description",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfff77546),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 65,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200,
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10),
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 10,),
                            Icon(Icons.calendar_month,
                              color: Colors.amber,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('25 Dec, 2020',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('Start date',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200,
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10),
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 10,),
                            Icon(Icons.calendar_month,
                              color: Colors.pinkAccent,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('25 Dec, 2020',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('End date',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 65,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200,
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10),
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 10,),
                            FaIcon(FontAwesomeIcons.solidClock,
                              color: Colors.amber,
                              size: 27,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('25 Dec, 2020',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('Start time',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200,
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10),
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 10,),
                            FaIcon(FontAwesomeIcons.solidClock,
                              color: Colors.pinkAccent,
                              size: 27,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('25 Dec, 2020',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('End time',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(120)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
