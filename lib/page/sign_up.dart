import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/helper.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage>{


  var email, password, name, address;

  bool onClick = false;

  bool onHide = true;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  onClick ?()async=>false : Helper.of(context).onWillPop,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF87E1CC), Color(0xFF4A81EE)]
              )
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Helper().simpleText(color: Colors.white, fontSize: 30.0, txt: "Marvella", fontweight: FontWeight.bold),
                  Helper().simpleText(color: Colors.white, fontSize: 20.0, txt: "Media Percetakan Gianyar", fontweight: FontWeight.w500),
                  SizedBox(height: 50,),
                  inputInfo(hint: "Nama", type: 2),
                  SizedBox(height: 24,),
                  inputInfo(hint: "Email", type: 0),
                  SizedBox(height: 24,),
                  inputInfo(hint: "Alamat", type: 3),
                  SizedBox(height: 24,),
                  inputInfo(hint: "Password", type: 1),
                  SizedBox(height: 32,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: loginBtn(),
                  ),
                  SizedBox(height: 32,),
                  notHaveAccount()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputInfo({hint : "", type}){
    ///type :
    ///0: email
    ///1: password
    ///2: nama
    ///3: alamat

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.only(bottom: 5, right: 16, left: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: Color(0xFF80C4DB),
        boxShadow: [BoxShadow(
            color: Color(0xFF5794C3),
            spreadRadius: 2,
            offset: Offset(5.0, 1.5),
            blurRadius: 3
        )],
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        onChanged: (input){
          if(type == 0){
            setState(() {
              email = input;
            });
          }
          if(type == 1){
            setState(() {
              password = input;
            });
          }
          if(type == 2){
            setState(() {
              name = input;
            });
          }
          if(type == 3){
            setState(() {
              address = input;
            });
          }

          print(email);
        },
        obscureText: type == 1 ? onHide : false,
        decoration: InputDecoration(
            hintText: "$hint",
            suffix: GestureDetector(
              onTap: (){
                if(type == 1){
                  setState(() {
                    onHide = !onHide;
                  });
                }
              },
              child: Icon( onHide? Icons.lock : Icons.lock_open, color: Colors.white,),
            ),
            hintStyle: TextStyle(
                color: Colors.white
            ),
            border: InputBorder.none
        ),
      ),
    );
  }

  Widget loginBtn(){
    return FlatButton(
      onPressed: (){
        if(!onClick){
          // setState(() {
          //   onClick = true;
          // });
          print(email);
          if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
            Fluttertoast.showToast(msg: "Mohon Memasukkan Email yang Valid");
          }

          // setState(() {
          //   onClick = false;
          // });
        }
      },
      child: Helper().simpleText(color: Color(0xFF2D76D5), txt: "Daftar", fontweight: FontWeight.w700,fontSize: 16.0),
      padding: EdgeInsets.symmetric(vertical: 16),
      minWidth: double.infinity,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
    );
  }

  Widget notHaveAccount(){
    return FlatButton(
      onPressed: (){
        Navigator.pop(context);
      },
      child: Helper().simpleText(color: Colors.white,
          txt: "Saya Sudah punya akun",
          fontweight: FontWeight.w700,fontSize: 16.0,
          align: TextAlign.center
      ),
      padding: EdgeInsets.symmetric(vertical: 16),
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
    );
  }



}