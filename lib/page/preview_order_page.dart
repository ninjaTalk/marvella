import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/element/full_image.dart';
import 'package:marvella/models/index.dart';
import 'package:marvella/page/home.dart';
import 'package:marvella/page/proof_payment_page.dart';
import 'package:marvella/services/base_view.dart';
import 'package:marvella/services/helper.dart';
import 'package:marvella/services/view_state.dart';
import 'package:marvella/view_model/order_view_model.dart';

class PreviewOrderPage extends StatefulWidget{
  int typeBack;
  Order order;
  PreviewOrderPage({this.order, this.typeBack});
  @override
  _PreviewOrderState createState() => _PreviewOrderState();

}

class _PreviewOrderState extends State<PreviewOrderPage>{

  File fileDesign;
  @override
  Widget build(BuildContext context) {
    return BaseView<OrderViewModel>(
      onModelReady: (model){
        model.getOrderDetail(widget.order.id);
      },
      builder: (context, model, child)=>Scaffold(
        // backgroundColor: Colors.white,
          appBar: Helper.of(context).customAppbar("Detail Pesanan"),
          body: model.state == ViewState.Busy ? Center(child: CircularProgressIndicator(),) : RefreshIndicator(
            onRefresh: (){
              return model.getOrderDetail(widget.order.id);
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    enabled: false,
                    initialValue: "${model.order.detailPesanan[0].jenisDesain} ${model.order.detailPesanan[0].ukuran}",
                    decoration: InputDecoration(
                        labelText: "Produk",
                        labelStyle: TextStyle(
                            color: Colors.black
                        )
                    ),
                  ),

                  TextFormField(
                    enabled: false,
                    initialValue: "${model.order.totalHarga}",
                    decoration: InputDecoration(
                        labelText: "Harga",
                        labelStyle: TextStyle(
                            color: Colors.black
                        )
                    ),
                  ),
                  TextFormField(
                    enabled: false,
                    initialValue: "${model.order.jenisPembayaran}",
                    decoration: InputDecoration(
                        labelText: "Metode Pembayaran",
                        labelStyle: TextStyle(
                            color: Colors.black
                        )
                    ),
                  ),

                  TextFormField(
                    enabled: false,
                    initialValue: "${model.order.statusPembayaran}",
                    decoration: InputDecoration(
                        labelText: "Status Pembayaran",
                        labelStyle: TextStyle(
                            color: Colors.black
                        )
                    ),
                  ),

                  model.order.detailPesanan[0].keteranganTambahan!=null? Container(
                    margin: EdgeInsets.only(top: 30, bottom: 8),
                    child: Helper.of(context).simpleText(txt: "Keterangan*", fontSize: 14.0),
                  ) : Container(),

                  model.order.detailPesanan[0].keteranganTambahan!=null? Container(
                    height: 120,
                    padding: EdgeInsets.fromLTRB(16, 2, 16, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black12, width: 1),
                    ),
                    child: TextFormField(
                      maxLines: null,
                      initialValue: "${model.order.detailPesanan[0].keteranganTambahan}",
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Keterangan tambahan pesanan anda",
                          labelStyle: TextStyle(
                              color: Colors.black
                          ),
                          hintStyle: TextStyle(fontSize: 14)
                      ),
                    ),
                  ): Container(),

                  SizedBox(height: 24,),

                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Helper.of(context).simpleText(txt: "Desain Anda", fontSize: 14.0),
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ImageFullNetwork(url: model.order.detailPesanan[0].file,)));
                    },
                    child: Container(
                      padding: EdgeInsets.all(24),
                      child:  ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: CachedNetworkImage(
                          imageUrl: model.order.detailPesanan[0].file,
                          height: 160,width: 240,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, value, download){
                            return LinearProgressIndicator(value: download.progress,);
                          },
                          errorWidget: (context,_,error)=>Image.asset("assets/main/image.png"),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
          floatingActionButton: widget.typeBack == 2 || ((model?.order?.idJenisPembayaran??0) == 1 && model?.order?.idStatusPesanan !=4) ? RaisedButton(
            onPressed: (){
              if(model.order.idJenisPembayaran == 1){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ProofPaymentPage(order: model.order,)));
              }else{
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            color: (model?.order?.idJenisPembayaran??0) == 1 ? Colors.redAccent : Color(0xFF22CED5),
            padding: EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: Helper.of(context).simpleText(txt: (model?.order?.idJenisPembayaran??0) == 1 ? "Bayar Pesanan" : "Kembali Ke Home",
                color: Colors.white,
                fontweight: FontWeight.w700,
                fontSize: 15.0),
          ) : Container()
      ),
    );
  }

}