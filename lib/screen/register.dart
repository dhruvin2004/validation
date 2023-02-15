

import 'package:email_validator/email_validator.dart';
import 'package:exam/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import 'homepage.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
              SizedBox(height: 100,),
              Text("Register Page",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w900,letterSpacing: 1,color: Colors.black),),
              SizedBox(height: 100,),
              Text("Email",style: AppString.titlemediam,),
              SizedBox(height: 10,),
            TextFormField(
              controller: Controller.emailController,
              onChanged: (val){
                setState(() {
                  Controller.email = val;
                  AppString.isValidator = EmailValidator.validate(Controller.email);
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid email';
                }
                if(AppString.isValidator == false)
                {
                  return 'Email is not valid';
                }
                return null;

              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,filled: true,
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey[500])),
            ),
              SizedBox(height: 10,),
              Text("Password",style: AppString.titlemediam,),
              SizedBox(height: 10,),
              TextFormField(
                controller: Controller.passwordController,
                 onChanged: (val){
                  setState(() {
                    Controller.password = val;
                  });
                 },
                 validator: (value){
                   if (value!.isEmpty) {
                     return 'Please enter password';
                   } else {
                     if (!regex.hasMatch(value)) {
                       return 'Enter valid password';
                     } else {
                       return null;
                     }
                   }
                 },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
              SizedBox(height: 10,),
              Text("Confirm Password",style: AppString.titlemediam,),
              SizedBox(height: 10,),
              TextFormField(
                controller: Controller.confirmPasswordController,
                onChanged: (val){
                  Controller.conformPassword = val;
                },
                validator: (value){
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  } else {
                    if (!regex.hasMatch(value)) {
                      return 'Enter valid password';
                    } else {
                      return null;
                    }
                  }
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      if(Controller.password == Controller.conformPassword)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context){return HomePage();}));
                      }
                      else
                      {
                        const SnackBar(content: Text('Enter Valid email and password'));
                      }
                    }
                  });
                },
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 60,right: 60),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text("REGISTER",style: GoogleFonts.lato(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),

                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

}
