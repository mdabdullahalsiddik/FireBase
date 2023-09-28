import 'package:firebase/models/user_model.dart';
import 'package:firebase/pages/show_data_page.dart';

import 'package:firebase/widgets/costomtextfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController depermentController = TextEditingController();
  TextEditingController rollController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  var user;
  // ignore: prefer_typing_uninitialized_variables
  var datakye;
  sendData() async {
    datakye = DateTime.now().microsecond;
    user = UserInfoModel(
      name: nameController.text,
      roll: rollController.text,
      email: mailController.text,
      phone: phoneController.text,
      deperment: depermentController.text,
    );

    await FirebaseDatabase.instance
        .ref("User_Information")
        .child("${nameController.text}_$datakye")
        .set(user.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CostomTextField(
                  controller: nameController,
                  hintText: "Md Abdullah Al Siddik",
                  labelText: "Name",
                ),
                CostomTextField(
                  controller: depermentController,
                  labelText: "Deperment",
                  hintText: "CST",
                ),
                CostomTextField(
                  controller: rollController,
                  labelText: "Roll",
                  hintText: "502057",
                ),
                CostomTextField(
                  controller: mailController,
                  hintText: "flutter@gmail.com",
                  labelText: "Mail",
                  icon: const Icon(Icons.mail),
                ),
                CostomTextField(
                  controller: phoneController,
                  hintText: "01737374083",
                  labelText: "Phone",
                  icon: const Icon(Icons.call),
                ),
                InkWell(
                  onTap: () {
                    sendData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  },
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: const Card(
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          "Save",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
