import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marvella/services/base_view.dart';
import 'package:marvella/services/view_state.dart';
import 'package:marvella/view_model/user_view_model.dart';
import '../services/helper.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage>{

  var email, password, name, address, phone, gender;

  GlobalKey<FormState> key = new GlobalKey<FormState>();

  bool onClick = false;

  bool onHide = true;



  @override
  Widget build(BuildContext context) {
    return BaseView<UserViewModel>(
      onModelReady: (model){
        model.context = context;
      },
      builder: (context, model, child) => WillPopScope(
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
                padding: EdgeInsets.symmetric(vertical: 40,horizontal: 16),
                physics: AlwaysScrollableScrollPhysics(),
                child: Form(
                  key: key,
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
                      phoneInput(hint: "Phone",),
                      SizedBox(height: 24,),
                      genderInput(),
                      SizedBox(height: 24,),
                      inputInfo(hint: "Alamat", type: 3),
                      SizedBox(height: 24,),
                      inputInfo(hint: "Password", type: 1),
                      SizedBox(height: 32,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: onClick ? Center(child: CircularProgressIndicator(backgroundColor: Colors.green,),) : loginBtn(model),
                      ),
                      SizedBox(height: 32,),
                      notHaveAccount()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget genderInput(){
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
      child: FormField(
        builder: (FormFieldState<String> state){
          return InputDecorator(
            decoration: InputDecoration(
              hintText: "Pilih Jenis Kelamin",
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Colors.black87,
                style: TextStyle(color: Colors.white,fontSize: 16),
                  value: gender,
                  hint: Helper.of(context).simpleText(txt: "Pilih Jenis Kelamin",color: Colors.white),
                  isDense: true,
                  items: <String>['Laki-laki', 'Perempuan'].map<DropdownMenuItem<String>>((e){
                    return DropdownMenuItem<String>(child: Helper.of(context).simpleText(txt: e,color: Colors.white),value: e,);
                  }).toList(),
                  onChanged: (String newValue){
                    setState(() {
                      gender = newValue;
                    });
                  }),
            ),
          );
        },
      ),
    );
  }

  Widget phoneInput({hint : ""}){

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
          setState(() {
            phone = input;
          });
        },
        validator: (input)=> input.isEmpty ? "Please input phone number" : input.length<12 ? "Please input valid phone number" : null,
        keyboardType: TextInputType.phone,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
            hintText: "$hint",
            hintStyle: TextStyle(
                color: Colors.white
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: InputBorder.none
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
        validator: (input){
          if(type==0){
            if(input!=null){
              if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input)) {
                return input.isEmpty ? "Mohon memasukkan email yang benar" : null;
              }
            }
          }
          if(type == 1){
            return input.isEmpty ? "Mohon memasukkan password yang sesuai" : input.length<8 ? "Password minimal 6 karakter" : null;
          }
          if(type == 2){
            return input.isEmpty ? "Mohon memasukkan nama yang benar" :  null;
          }
          if(type == 3){
            return input.isEmpty ? "Mohon memasukkan alamat yang benar" : null;
          }

          return null;
        },
        obscureText: type == 1 ? onHide : false,
        decoration: InputDecoration(
            hintText: "$hint",
            suffixIcon: type == 1 ? GestureDetector(
              onTap: (){
                if(type == 1){
                  setState(() {
                    onHide = !onHide;
                  });
                }
              },
              child: Icon( onHide? Icons.lock : Icons.lock_open, color: Colors.white,),
            ) : null,
            hintStyle: TextStyle(
                color: Colors.white
            ),
            border: InputBorder.none
        ),
      ),
    );
  }

  Widget loginBtn(UserViewModel model){
    return model.state == ViewState.Busy ? Center(child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    ),) : FlatButton(
      onPressed: ()async{
        if(key.currentState.validate()){
          if(gender!=null){
            log("validate");
            Map<String, String> dataSend = Map<String, String>();
            dataSend['name'] = name;
            dataSend['no_telp'] = phone;
            dataSend['jk'] = gender;
            dataSend['alamat'] = address;
            dataSend['email'] = email;
            dataSend['password'] = password;
            await model.register(dataSend);
            setState(() {
              onClick = false;
            });
          }
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