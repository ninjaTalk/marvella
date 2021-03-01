import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marvella/page/home.dart';
import 'package:marvella/page/sign_up.dart';
import 'package:marvella/services/base_view.dart';
import 'package:marvella/view_model/user_view_model.dart';
import '../services/helper.dart';

class SignIn extends StatefulWidget{
  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn>{

  final scaffoldState = new GlobalKey<ScaffoldState>();

  var email, password;

  bool onClick = false;

  bool onHide = true;


  @override
  Widget build(BuildContext context) {
    return BaseView<UserViewModel>(
      onModelReady: (model){

      },
      builder: (context, model, child)=> WillPopScope(
        onWillPop:  onClick ?()async=>false : Helper.of(context).onWillPop,
        child: Scaffold(
          key: scaffoldState,
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
                    SizedBox(height: 100,),
                    Helper().simpleText(color: Colors.white, fontSize: 16.0, txt: "Selamat Datang Di Aplikasi Marvella Gianyar,\n"
                        "Silakan Melakukan Login Terlerbih Dahulu", align: TextAlign.center),
                    SizedBox(height: 32,),
                    inputInfo(hint: "Email", type: 0),
                    SizedBox(height: 32,),
                    inputInfo(hint: "Password", type: 1),
                    SizedBox(height: 32,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: loginBtn(),
                    ),
                    SizedBox(height: 32,),
                    notHaveAccount(),

                  ],
                ),
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

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
            child:type ==  1 ? Icon( onHide? Icons.lock : Icons.lock_open, color: Colors.white,) : Icon(Icons.mail_outline, color: Colors.white,),
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
          setState(() {
            onClick = false;
          });
         print(email);
         if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email??"")){
           Fluttertoast.showToast(msg: "Mohon Memasukkan Email yang Valid");
           setState(() {
             onClick = false;
           });
         }else{

           Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
           setState(() {
             onClick = false;
           });
         }
        }
      },
      child: Helper().simpleText(color: Color(0xFF2D76D5), txt: "LOGIN", fontweight: FontWeight.w700,fontSize: 16.0),
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
        Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpPage()));
      },
      child: Helper().simpleText(color: Colors.white,
          txt: "Tidak bunya akun ? \nDaftar Sekarang",
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