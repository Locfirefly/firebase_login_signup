import 'package:flutter/material.dart';
import '../widgets/size.dart';

class AddProject extends StatefulWidget {
  const AddProject({Key? key}) : super(key: key);

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  int selectedColor = 0;
  DateTime? startDate ;
  DateTime? endDate;
  final projectName = TextEditingController();
  final projectDescription = TextEditingController();
  String color = '';

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
              SizedBox(height: SizeConfig.screenHeight * 0.04),
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
                  controller: projectDescription,
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
                                    Text(startDate == null ? "yyyy-mm-dd" : "${startDate?.year}-${startDate?.month}-${startDate?.day}" ,
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
                                    Text( endDate == null ? 'yyyy-mm-dd' : "${endDate?.year}-${endDate?.month}-${endDate?.day}",
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
              SizedBox(height: getProportionateScreenHeight(120)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
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
    );
  }
}

