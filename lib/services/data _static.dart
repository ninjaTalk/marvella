import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/page/biodata_page.dart';
import 'package:marvella/page/notification_page.dart';
import 'package:marvella/page/sign_in.dart';
import 'package:marvella/page/transaction_page.dart';
import 'package:marvella/repository/user_repository.dart';
import 'package:marvella/services/locator.dart';
import '../repository/user_repository.dart' as userRepository;

class DataStatic{
  Function future;
  String label;
  String icon;
  DataStatic({this.future, this.label, this.icon});
}

class GetData {

  static List<DataStatic> getDataMenu(BuildContext context) {
    List<DataStatic> list = new List<DataStatic>();

    list.add(DataStatic(future: () {
      Navigator.push(context, MaterialPageRoute(builder: (_)=>BioPage()));
    }, icon: "assets/main/finder.png",
        label: "Pesan Cetakan"));

    list.add(DataStatic(future: () {
      Navigator.push(context, MaterialPageRoute(builder: (_)=>TransactionPage()));
    }, icon: "assets/main/ecommerce.png",
        label: "Riwayat Transaksi"));

    list.add(DataStatic(future: () {
      Navigator.push(context, MaterialPageRoute(builder: (_)=>NotificationPage()));
    }, icon: "assets/main/notification.png",
        label: "Notifikasi"));

    list.add(DataStatic(future: ()async {
    }, icon: "assets/main/exit.png",
        label: "Logout"));

    return list;
  }
}