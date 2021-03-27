import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:marvella/page/sign_in.dart';
import 'package:marvella/repository/user_repository.dart';
import 'package:marvella/services/base_view.dart';
import 'package:marvella/services/data%20_static.dart';
import 'package:marvella/services/helper.dart';
import 'package:marvella/services/locator.dart';
import 'package:marvella/services/view_state.dart';
import 'package:marvella/view_model/user_view_model.dart';
import '../repository/user_repository.dart' as user;

class HomePage extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<HomePage>{


  FirebaseMessaging _firebaseMessaging =  new FirebaseMessaging();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  initLocalNotification()async{
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid = new AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings iosInitializationSettings =
    IOSInitializationSettings();
    final MacOSInitializationSettings macOSInitializationSettings=
    MacOSInitializationSettings();
    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: iosInitializationSettings,
        macOS: macOSInitializationSettings
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String dataJSON) async {
    dynamic data = json.decode(dataJSON);
    print(data);
    print('ok notif');
    navigateToDetail(data);
    print('show notif detail');
  }

  navigateToDetail(Map<dynamic, dynamic> data) async {

    Map<dynamic,dynamic> dataInfo = new Map<dynamic, dynamic>();
    dataInfo = data['data'];

    print("NAVIGATE");

    if(dataInfo.containsKey('id')) {

    }
  }

  Map<String,String> convertDataDetail(dynamic data){
    Map<String,String> dataDetail = new Map<String,String>();
    if(data.containsKey('id'))
      dataDetail['id'] = data['id']??'';
    return dataDetail;
  }

  Future showNotificationForeground(Map<String, dynamic> message) async{
    String title = "";
    String body = "";
    try{
      final dynamic notification = message['notification'] ?? message;
      title = notification['title']??message['tittle'];
      body = notification['body']??message['body'];
      final dynamic data = message['data']??message;

      log("data");
      log(title);
      log(body);

      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel-fcm', 'Notification', 'Push Notification',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        playSound: true,
        channelShowBadge: true,
        icon: '@mipmap/ic_launcher',

      );
      var iOSPlatformChannelSpecifies = IOSNotificationDetails();

      var macPlatformChannel = MacOSNotificationDetails();

      var platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifies,
          macOS: macPlatformChannel
      );


      await flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics,payload: json.encode(message));


    }catch (e){
      print("Error : $e");
    }
  }

  initFCM(){
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async{
        print("on message : $message");
        showNotificationForeground(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
        final dynamic data = message['data'] ?? message;
        navigateToDetail(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
        navigateToDetail(message);
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true
        ));
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings event) {
      print("Settings registered: $event");
    });
    _firebaseMessaging.getToken().then((String value) {
      assert(value!=null);
      print("Push Messaging token: $value");
    });

  }

  List<DataStatic> _listMenu;

  UserRepository userRepository = locator<UserRepository>();

  @override
  void initState() {
    initFCM();
    initLocalNotification();
    setState(() {
      _listMenu = GetData.getDataMenu(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<UserViewModel>(
      onModelReady: (model)async{
        model.context = context;
        await model.getUser();
      },
      builder: (context, model, child){
        return WillPopScope(
          onWillPop: Helper.of(context).onWillPop,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: AppBar(
                automaticallyImplyLeading: false,
                title: ListTile(
                  // tileColor: Colors.blue,
                  contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset("assets/main/user.png"),
                  ),
                  title: Helper.of(context).simpleText(txt: "${model?.user?.nama??user.user.value.nama}",fontweight: FontWeight.w700, fontSize: 16.0),
                  subtitle: Helper.of(context).simpleText(txt: "${model?.user?.email??user.user.value.email}", fontSize: 12.0),
                ),
                backgroundColor: Colors.white,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)
                    )
                ),
              ),
            ),
            extendBody: true,
            body: model.state == ViewState.Busy ? Center(child: CircularProgressIndicator(),) : RefreshIndicator(
              onRefresh: ()=>model.getUser(),
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                itemCount: _listMenu.length,
                itemBuilder: (BuildContext context, int index){
                  return Padding(padding: EdgeInsets.symmetric(vertical: 16),
                    child: menuItem(_listMenu.elementAt(index)),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget menuItem(DataStatic dataStatic){
    return GestureDetector(
      onTap: ()async{
         if(dataStatic.label == "Logout"){
           logout(context);
         }else{
           dataStatic.future();
         }
      },
      child: Container(
        padding: EdgeInsets.only(left: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(3.5,3.5),
              spreadRadius: 2
            )
          ]
        ),
        child: Row(
          children: [
            Image.asset("${dataStatic.icon}", width: 40,),
            SizedBox(width: 16,),
            Expanded(
              child: Helper.of(context).simpleText(
                txt: dataStatic.label,
                fontSize: 18.0,
                fontweight: FontWeight.w700
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF22CED6),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)
                )
              ),
              child: Center(
                child: Icon(Icons.arrow_right, color: Colors.white,size: 40,),
              ),
            )
          ],
        ),
      ),
    );
  }

  void logout(BuildContext context)async{
    await userRepository.logout();
    await userRepository.removeUser().whenComplete(() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>SignIn()), (route) => false);
    });
  }

}