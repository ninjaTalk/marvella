import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marvella/models/index.dart';
import 'package:marvella/page/home.dart';
import 'package:marvella/page/sign_in.dart';
import 'package:marvella/repository/user_repository.dart';
import 'package:marvella/services/helper.dart';
import 'package:marvella/services/locator.dart';
import 'package:marvella/services/view_state.dart';
import 'package:marvella/view_model/base_view_model.dart';

class UserViewModel extends BaseViewModel{
  UserViewModel({value}) : super();

  UserRepository userRepository = locator<UserRepository>();

  BuildContext context;

  var deviceId;

  FirebaseMessaging fm =  new FirebaseMessaging();

  User user;

  Future<void> login(email, password)async{
    setState(ViewState.Busy);
    try{
      this.deviceId = await fm.getToken();
    }catch(e){

    }
    log("FIREBASE DEVICE \n");
    print(await fm.getToken());
    try{
      UserResponse user = await userRepository.login(email, password,device_id: deviceId);
      if(user.code == 200){
        setDeviceId(deviceId).whenComplete(() {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
        });
      }else{
        Fluttertoast.showToast(msg: "${user.message}");
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Terjadi Kesalahan Mohon Coba Lagi");
    }

    setState(ViewState.Idle);
  }

  Future<void> register(Map<String, String> dataSend)async{
    setState(ViewState.Busy);
    print("REGIS");
    try{
      this.deviceId = await fm.getToken();
    }catch(e){

    }
    log("FIREBASE DEVICE \n");
    print(await fm.getToken());
    try{
      UserResponse user = await userRepository.register(dataSend);
      if(user.success){
        setDeviceId(deviceId);
        // Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
      }else{
        Fluttertoast.showToast(msg: "${user.message}");
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Terjadi Kesalahan Mohon Coba Lagi");
    }

    setState(ViewState.Idle);
  }

  Future<void> setDeviceId(id) async {
    setOption(ViewOption.Busy);
    await userRepository.setDevice(id);
    setOption(ViewOption.Idle);
  }

  Future<void> getUser()async{
    setState(ViewState.Busy);
    try{
      UserResponse user = await userRepository.getUser();
      if(user.success){
        this.user = user.data;
      }else{
        Fluttertoast.showToast(msg: "${user.message}");
      }
    }catch(e){
      await userRepository.removeUser().then((v) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>SignIn()), (route) => false);
      });
    }

    setState(ViewState.Idle);
  }

  Future<void> getCurrentUserLocal() async{
    await userRepository.getCurrentUser();
    await userRepository.getCurrentToken();
  }

}