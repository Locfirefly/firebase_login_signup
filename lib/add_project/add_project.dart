import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_signup/add_project/bloc/add_project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/size.dart';

class AddProject extends StatefulWidget {
  const AddProject({Key? key}) : super(key: key);

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final _formKey = GlobalKey<FormState>();
  final firebaseUser = FirebaseAuth.instance;
  int selectedColor = 0;
  DateTime? startDate ;
  DateTime? endDate;
  final projectName = TextEditingController();
  final projectDescription = TextEditingController();
  final String dateFormat = 'yyyy-mm-dd';
  String color = '';
  bool addPrRequire = false;

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return BlocListener<AddProjectBloc,AddProjectState>(
      listener: (context, state) {
        if(state is AddSuccess){
          setState(() {
            addPrRequire = false;
          });
          const SnackBar(
              content: Center(
                  child: Text('Add success'))
          );
        }
        else{
          if(state is AddProcess){
            addPrRequire = true;
          }
          else{
            if(state is AddFailure){
              setState(() {
                addPrRequire = false;
              });
              return;
            }
          }
        }
      },
      child: Scaffold(
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
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          maxLength: 50,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Project Name',
                            counterText: '',
                            hintText: "Enter your project name",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                            labelStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfff77546),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          validator: (val){
                            if(val!.isEmpty){
                              return 'Project name is require';
                            }
                            else{
                              return null;
                            }
                          },
                          controller: projectName,
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          maxLines: 4,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade400,
                          ),
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            counterText: '',
                            hintText: "Enter your project description",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                            labelStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfff77546),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          validator: (val){
                            if(val!.isEmpty){
                              return 'Description is require';
                            }
                            else{
                              return null;
                            }
                          },
                          controller: projectDescription,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          DateTime? start = await showDatePicker(
                            context: context,
                            initialDate: startDate,
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2100),
                          );
                          if(start != null){
                            setState(() {
                              startDate = start;
                            });
                          }
                        },
                        child: AbsorbPointer(
                          child: Container(
                            height: 68,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade200,
                            ),
                            child: Padding(
                              padding:  const EdgeInsets.symmetric(vertical: 10),
                              child:  Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 10,),
                                  const Icon(Icons.calendar_month,
                                    color: Colors.amber,
                                    size: 30,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(startDate == null ? dateFormat : "${startDate?.year}-${startDate?.month}-${startDate?.day}" ,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text('Start date',
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
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          DateTime? end = await showDatePicker(
                              context: context,
                              initialDate: startDate,
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2100),
                          );
                          if(end != null){
                            setState(() {
                              endDate = end;
                            });
                          }
                        },
                        child: AbsorbPointer(
                          child: Container(
                            height: 68,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade200,
                            ),
                            child: Padding(
                              padding:  const EdgeInsets.symmetric(vertical: 10),
                              child:  Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 10,),
                                  const Icon(Icons.calendar_month,
                                    color: Colors.pinkAccent,
                                    size: 30,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text( endDate == null ? dateFormat : "${endDate?.year}-${endDate?.month}-${endDate?.day}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pinkAccent,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text('Dead line',
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
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Icon(Icons.color_lens_outlined,
                          color: Colors.amber,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text('Card Color',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 50),
                        Wrap(
                          children: List<Widget>.generate(4, (int index) {
                                return  GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      selectedColor = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: index == 0 ?  Colors.amber :
                                      index == 1 ? Colors.pinkAccent :
                                      index == 2? Colors.teal : Colors.indigo,
                                      child: selectedColor == index ? const Icon(Icons.check,
                                        color: Colors.white,
                                        size: 18,
                                      ) : Container(),
                                    ),
                                  ),
                                );
                          }
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(100)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                          if(startDate == null || endDate == null || endDate!.isBefore(startDate!)){
                            const SnackBar(
                                content: Center(
                                    child: Text('Please enter valid date')),
                            );
                          }
                          else {
                              context.read<AddProjectBloc>().add(
                                  AddProjectRequire(
                                      projectName.text,
                                      projectDescription.text,
                                      "${startDate?.year}-${startDate?.month}-${startDate?.day}",
                                      "${endDate?.year}-${endDate?.month}-${endDate?.day}",
                                      selectedColor.toString(),
                                      firebaseUser.currentUser!.uid
                                  ));
                          }
                        }
                      },
                      child: Container(
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

