import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/services/helper.dart';

class ItemNotifiacation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            offset: Offset(1.0,1.0),
            blurRadius: 4
          )
        ]
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(24,14,24,28),
        tileColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(bottom: 8),
          child: Helper.of(context).simpleText(txt: "Konfirmasi Pembayaran TRX210", fontweight: FontWeight.w700, fontSize: 18.0),
        ),
        subtitle: Helper.of(context).simpleText(txt:"Pembayaran anda telah diterima, mohon menunggu konfirmasi pesanan selesai.",
            fontSize: 14.0
        ),
      ),
    );
  }

}