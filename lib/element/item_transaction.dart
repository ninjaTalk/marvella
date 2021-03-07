import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/models/index.dart';
import '../repository/user_repository.dart' as user;
import 'package:marvella/services/helper.dart';

class ItemTransaction extends StatelessWidget{
  Order order;
  ItemTransaction({this.order});
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
            child: Helper.of(context).simpleText(txt: "${order.id}", fontweight: FontWeight.w700, fontSize: 18.0),
          ),
          Helper.of(context).simpleText(txt: "${user.user.value.nama}", fontSize: 15.0, ),
          Helper.of(context).simpleText(txt: "${order.detailPesanan[0].jenisDesain} ${order.detailPesanan[0].ukuran} "
              "${order.detailPesanan[0].keteranganTambahan.length>30 ? order.detailPesanan[0].keteranganTambahan.substring(0,30) + "..." : order.detailPesanan[0].keteranganTambahan}", fontSize: 15.0, ),
          Helper.of(context).simpleText(txt: "${order.tanggalPemesanan}", fontSize: 15.0,),
          Helper.of(context).simpleText(txt: "${order.totalHarga} - Cash", fontSize: 15.0, ),

          Container(
            margin: EdgeInsets.only(top: 12),
            child: Helper.of(context).simpleText(txt: "${order.statusPesanan}", fontweight: FontWeight.w700, fontSize: 18.0, color: Colors.green),
          ),
        ],
      ),
    );
  }

}