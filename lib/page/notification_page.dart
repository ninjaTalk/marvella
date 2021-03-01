import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/element/item_notification.dart';
import 'package:marvella/services/helper.dart';

class NotificationPage extends StatefulWidget{
  @override
  _NotificationState createState() => _NotificationState();

}

class _NotificationState extends State<NotificationPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Helper.of(context).simpleText(txt: "Riwayat Notifikasi",
            fontweight: FontWeight.w700, fontSize: 18.0),
      ),
      body: RefreshIndicator(
        onRefresh: (){
          return ;
        },
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index){
            return ItemNotifiacation();
          },
        ),
      ),
    );
  }

}