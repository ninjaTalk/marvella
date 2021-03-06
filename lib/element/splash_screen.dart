import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/page/home.dart';
import 'package:marvella/page/sign_in.dart';
import 'package:marvella/repository/user_repository.dart';
import 'package:marvella/services/base_view.dart';
import 'package:marvella/services/helper.dart';
import 'package:marvella/services/locator.dart';
import 'package:marvella/view_model/user_view_model.dart';
import '../repository/user_repository.dart' as user;

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreen createState() => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<UserViewModel>(
      onModelReady: (model){
        Future.delayed(Duration(seconds: 1)).then((value)async {
          try{
            await model.getCurrentUserLocal().then((value) {
              print(user.token.value);
              print(user.user.value.email);
              if(user.token.value!=""){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
              }else{
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SignIn()));
              }
            });
          }catch(e){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>SignIn()));
          }

        });
      },
      builder: (context, model, child){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Helper.of(context).simpleText(txt: "Marvella Printing",
                    color: Colors.blue,fontSize: 24.0,fontweight: FontWeight.w700,align: TextAlign.center),
                SizedBox(height: 8,),
                CircularProgressIndicator()
              ],
            ),
          ),
        );
      },
    );
  }

}