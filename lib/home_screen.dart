import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_signup_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = "", age = "", gender = "",type ="";
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
        title: const Text("Home Screen"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(email.toString()),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(age.toString()),
                ],
              ),
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(gender.toString()),
                  SizedBox(height: 20,),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(type.toString()),
                  SizedBox(height: 20,),

                ],
              ),
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
