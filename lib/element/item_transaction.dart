import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/models/index.dart';
import 'package:marvella/page/preview_order_page.dart';
import '../repository/user_repository.dart' as user;
import 'package:marvella/services/helper.dart';

class ItemTransaction extends StatelessWidget{
  Order order;
  ItemTransaction({this.order});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>PreviewOrderPage(order: order,typeBack: 1,)));
      },
      child: Container(
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
            order.detailPesanan.isNotEmpty ? order.detailPesanan.first.keteranganTambahan!=null? Helper.of(context).simpleText(txt: "${order.detailPesanan.first.jenisDesain} ${order.detailPesanan.first.ukuran} "
                "${order.detailPesanan.first.keteranganTambahan.length>30 ? order.detailPesanan[0].keteranganTambahan.substring(0,30) + "..." : order.detailPesanan.first.keteranganTambahan}", fontSize: 15.0, ) :
            Container() : Container(),
            Helper.of(context).simpleText(txt: "${order.tanggalPemesanan}", fontSize: 15.0,),
            Helper.of(context).simpleText(txt: "${order.totalHarga} ${order.jenisPembayaran!="-" ? "- " + order.jenisPembayaran :""}", fontSize: 15.0, ),

            Container(
              margin: EdgeInsets.only(top: 12),
              child: Helper.of(context).simpleText(txt: "${order.statusPesanan}", fontweight: FontWeight.w700, fontSize: 18.0,
                  color: order.idStatusPesanan == 1 ? Colors.orangeAccent :
                  order.idStatusPesanan == 2 ? Colors.blue :
                  order.idStatusPesanan == 4 ? Colors.red :
                  Colors.green),
            ),
          ],
        ),
      ),
    );
  }

}