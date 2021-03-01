import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/services/helper.dart';

class ItemTransaction extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12),
            child: Helper.of(context).simpleText(txt: "TRX210", fontweight: FontWeight.w700, fontSize: 18.0),
          ),
          Helper.of(context).simpleText(txt: "Angga Pande", fontSize: 15.0, ),
          Helper.of(context).simpleText(txt: "Banner 26 x 38, Deskripsi Tambahan : lorem eps…", fontSize: 15.0, ),
          Helper.of(context).simpleText(txt: "22/01/2020", fontSize: 15.0,),
          Helper.of(context).simpleText(txt: "Rp. 200.000 - Cash", fontSize: 15.0, ),

          Container(
            margin: EdgeInsets.only(top: 12),
            child: Helper.of(context).simpleText(txt: "Success", fontweight: FontWeight.w700, fontSize: 18.0, color: Colors.green),
          ),
        ],
      ),
    );
  }

}