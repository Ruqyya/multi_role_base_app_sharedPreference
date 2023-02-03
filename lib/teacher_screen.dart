import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_signup_screen.dart';
class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  String email = "", age = "", gender = "", type = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();

  }
  loadData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("Email")??"";
    age = sp.getString("Age")??"";
    gender = sp.getString("Gender")??"";
    type = sp.getString("User Type")??"";
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher View"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Email"),
                Text(email.toString()),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Age"),
                Text(age.toString()),
              ],
            ),
            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Gender"),
                Text(gender.toString()),
              ],
            ),
            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("User Type"),
                Text(type.toString()),
              ],
            ),
            SizedBox(height: 30,),

            InkWell(
              onTap: ()async{
                SharedPreferences sp = await SharedPreferences.getInstance();
                 sp.clear();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                child: const Center(
                  child: Text("Logout",style: TextStyle(color: Colors.white),),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
