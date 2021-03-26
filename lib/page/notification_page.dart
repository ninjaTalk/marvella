import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/element/item_notification.dart';
import 'package:marvella/models/index.dart';
import 'package:marvella/services/base_view.dart';
import 'package:marvella/services/helper.dart';
import 'package:marvella/services/view_state.dart';
import 'package:marvella/view_model/notification_view_model.dart';

class NotificationPage extends StatefulWidget{
  @override
  _NotificationState createState() => _NotificationState();

}

class _NotificationState extends State<NotificationPage>{
  @override
  Widget build(BuildContext context) {
    return BaseView<NotificationViewModel>(
      onModelReady: (model){
        model.getAllNotification();
      },
      builder: (context, model, child)=>Scaffold(
        // backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Helper.of(context).simpleText(txt: "Riwayat Notifikasi",
              fontweight: FontWeight.w700, fontSize: 18.0),
        ),
        body: model.state == ViewState.Busy ? Center(child: CircularProgressIndicator(),) : RefreshIndicator(
          onRefresh: (){
            return model.getAllNotification();;
          },
          child: ListView.builder(
            itemCount: model.listNotification.length,
            itemBuilder: (BuildContext context, int index){
              return ItemNotifiacation(notifications: model.listNotification.elementAt(index),);
            },
          ),
        ),
      ),
    );
  }

}