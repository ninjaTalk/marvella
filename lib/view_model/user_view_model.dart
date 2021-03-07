import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marvella/models/index.dart';
import 'package:marvella/page/home.dart';
import 'package:marvella/repository/user_repository.dart';
import 'package:marvella/services/helper.dart';
import 'package:marvella/services/locator.dart';
import 'package:marvella/services/view_state.dart';
import 'package:marvella/view_model/base_view_model.dart';

class UserViewModel extends BaseViewModel{
  UserViewModel({value}) : super();

  UserRepository userRepository = locator<UserRepository>();

  BuildContext context;

  User user;

  Future<void> login(email, password)async{
    setState(ViewState.Busy);
    try{
      UserResponse user = await userRepository.login(email, password);
      if(user.success){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
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
      UserResponse user = await userRepository.register(dataSend);
      if(user.success){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
      }else{
        Fluttertoast.showToast(msg: "${user.message}");
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Terjadi Kesalahan Mohon Coba Lagi");
    }

    setState(ViewState.Idle);
  }

  Future<void> getUser()async{
    setState(ViewState.Busy);
    // try{
      UserResponse user = await userRepository.getUser();
      if(user.success){
        this.user = user.data;
      }else{
        Fluttertoast.showToast(msg: "${user.message}");
      }
    // }catch(e){
    //   Fluttertoast.showToast(msg: "Terjadi Kesalahan Mohon Coba Lagi");
    // }

    setState(ViewState.Idle);
  }

  Future<void> getCurrentUserLocal() async{
    await userRepository.getCurrentUser();
    await userRepository.getCurrentToken();
  }

}