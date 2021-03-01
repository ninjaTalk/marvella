import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/element/item_notification.dart';
import 'package:marvella/element/item_transaction.dart';
import 'package:marvella/services/helper.dart';

class TransactionPage extends StatefulWidget{
  @override
  _TransactionState createState() => _TransactionState();

}

class _TransactionState extends State<TransactionPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Helper.of(context).simpleText(txt: "Riwayat Transaksi",
            fontweight: FontWeight.w700, fontSize: 18.0),
      ),
      body: RefreshIndicator(
        onRefresh: (){
          return ;
        },
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index){
            return ItemTransaction();
          },
        ),
      ),
    );
  }

}