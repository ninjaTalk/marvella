import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/element/item_notification.dart';
import 'package:marvella/element/item_transaction.dart';
import 'package:marvella/services/base_view.dart';
import 'package:marvella/services/helper.dart';
import 'package:marvella/services/view_state.dart';
import 'package:marvella/view_model/order_view_model.dart';

class TransactionPage extends StatefulWidget{
  @override
  _TransactionState createState() => _TransactionState();

}

class _TransactionState extends State<TransactionPage>{
  @override
  Widget build(BuildContext context) {
    return BaseView<OrderViewModel>(
      onModelReady: (model){
        model.getAllOrder();
      },
      builder: (context, model, child)=>Scaffold(
        // backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Helper.of(context).simpleText(txt: "Riwayat Transaksi",
              fontweight: FontWeight.w700, fontSize: 18.0),
        ),
        body: model.state == ViewState.Busy ? Center(child: CircularProgressIndicator(),) : RefreshIndicator(
          onRefresh: (){
            return model.getAllOrder();
          },
          child: model.listenOrder.length > 0 ? ListView.builder(
            itemCount: model.listenOrder.length,
            itemBuilder: (BuildContext context, int index){
              return ItemTransaction(order: model.listenOrder.elementAt(index),);
            },
          ) : Center(
            child: Helper.of(context).simpleText(txt: "Anda tidak memiliki pesanan"),
          ),
        ),
      ),
    );
  }

}