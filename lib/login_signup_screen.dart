import 'package:flutter/material.dart';
import 'package:multi_role_base_app/home_screen.dart';
import 'package:multi_role_base_app/student_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController= TextEditingController();
  final passwordController= TextEditingController();
  final ageController= TextEditingController();
  final genderController= TextEditingController();
  final typeController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                hintText: "Age",
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: genderController,
              decoration: InputDecoration(
                hintText: "Gender",
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: typeController,
              decoration: InputDecoration(
                hintText: "User Type",
              ),
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: ()async{
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("Email", emailController.text.toString());
                sp.setString("Age", ageController.text.toString());
                sp.setString("Gender", genderController.text.toString());
                sp.setString("User Type", typeController.text.toString());
                sp.setString("User Type", "Student");
                // sp.setString("User Type", "Teacher");
                sp.setBool("isLogin", true);
                if(sp.getString("Student")=="Student"){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentScreen()));

                }else if (sp.get("User Type")=="Teacher"){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentScreen()));

                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentScreen()));

                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                child: Center(
                  child: Text("Sign Up",style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
