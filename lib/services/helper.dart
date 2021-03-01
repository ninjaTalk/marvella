import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper{

  BuildContext context;

  DateTime currentBackPressTime;

  Helper.of(BuildContext context){
    this.context = context;
  }


  Helper({this.context});


  Widget simpleText({txt : "", fontSize : 14.0, fontweight : FontWeight.normal, color : Colors.black, align : TextAlign.left}){
    return Text(txt,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontweight,
        color: color,
      ),
    );
  }

  Future<bool> onWillPop(){
    DateTime now = DateTime.now();
    if(currentBackPressTime == null || now.difference(currentBackPressTime) > Duration(seconds: 2)){
      currentBackPressTime = now;
      print("TEKAN LAGI");
      Fluttertoast.showToast(msg: "Tekan sekali lagi untuk keluar dari aplikasi");
      return Future.value(false);
    }
    SystemChannels.platform.invokeListMethod('SystemNavigator,pop');
    return Future.value(true);
  }

  Widget customAppbar(label){
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      title: Helper.of(context).simpleText(txt: "$label",
          fontweight: FontWeight.w700, fontSize: 18.0),
    );
  }

  Widget nextButton(Function function, {Map<String, dynamic> data}){
    return RaisedButton(
      onPressed: (){
        function();
      },
      color: Color(0xFF22CED5),
      padding: EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Helper.of(context).simpleText(txt: "Lanjut",
          color: Colors.white,
          fontweight: FontWeight.w700,
          fontSize: 15.0),
    );
  }



}