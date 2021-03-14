import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marvella/models/index.dart';
import 'package:marvella/page/preview_order_page.dart';
import 'package:marvella/services/base_view.dart';
import 'package:marvella/services/helper.dart';
import 'package:marvella/services/view_state.dart';
import 'package:marvella/view_model/order_view_model.dart';

class ProofPaymentPage extends StatefulWidget{
  Order order;
  ProofPaymentPage({this.order});
  @override
  _ProofPaymentState createState() => _ProofPaymentState();

}

class _ProofPaymentState extends State<ProofPaymentPage>{

  File file;

  PaymentMethod selected;

  @override
  Widget build(BuildContext context) {
    return BaseView<OrderViewModel>(
      onModelReady: (model){
        model.getPayment();
      },
      builder: (context, model, child)=> Scaffold(
        // backgroundColor: Colors.white,
        appBar: Helper.of(context).customAppbar("Data Pesanan"),
        body: model.state == ViewState.Busy ? Center(child: CircularProgressIndicator(),) : RefreshIndicator(
          onRefresh: (){
            setState(() {
              selected =null;
            });
            return model.getPayment();
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16,),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xFF545454),
                    ),
                    child: Helper.of(context).simpleText(txt: "Total Harga Pesanan : ${widget.order.totalHarga}",
                        fontweight: FontWeight.w700,fontSize: 16.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Helper.of(context).simpleText(txt: "Pilih Metode Pembayaran Anda",align: TextAlign.center, fontweight: FontWeight.w500, color: Colors.black45),
                  // SizedBox(height: 24,),
                  selectPayment(model: model),
                  SizedBox(height: 40,),
                  selected!=null && selected.id == 3 ?Helper.of(context).simpleText(txt: "Tambahkan Bukti Pembayaran, tekan gambar dibawah", color: Colors.black45 ) :
                  Container(),
                  selected!=null && selected.id == 3 ? GestureDetector(
                      onTap: getImage,
                      child: Container(
                        margin: EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 1,
                                  offset: Offset(1.0,1.0),
                                  spreadRadius: 1
                              )
                            ]
                        ),
                        padding: file != null ? EdgeInsets.zero : EdgeInsets.all(16),
                        height: 200,width: double.infinity,
                        child: file!=null ? Image.file(file,fit: BoxFit.scaleDown,) : Image.asset("assets/main/image.png"),
                      )
                  ) : Container()
                ],
              )
          ),
        ),
        floatingActionButton: model.state == ViewLoad.Busy ? CircularProgressIndicator() : Helper.of(context).nextButton((){
          if(selected!=null){
            if(selected == 3){
              if(file==null){
                Fluttertoast.showToast(msg: "Mohon menambahkan bukti pembayaran anda terlebih dahulu");
              }else{
                model.addProfOfPayment(widget.order.id, selected, file).whenComplete(() {
                  if(model.order!=null){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>PreviewOrderPage(order: model.order,)));
                  }
                });
              }
            }else{
              Navigator.push(context, MaterialPageRoute(builder: (_)=>PreviewOrderPage(order: widget.order,)));
            }
          }else{
            Fluttertoast.showToast(msg: "Mohon memilih metode pembayaran terlebih dahulu");
          }
        }, title: "Simpan"),
      ),
    );
  }

  Widget selectPayment({OrderViewModel model}){
    return FormField(
      enabled: false,
      builder: (FormFieldState<PaymentMethod> state){
        return InputDecorator(
          decoration: InputDecoration(
              hintText: "Pilih Metode Pembayaran",
              hintStyle: TextStyle(color: Colors.black)
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<PaymentMethod>(
                dropdownColor: Colors.white,
                value: selected,
                hint: Helper.of(context).simpleText(txt: "Tekan Disini",color: Colors.black45),
                isDense: true,
                items: model.listPayment.map<DropdownMenuItem<PaymentMethod>>((e){
                  return DropdownMenuItem<PaymentMethod>(child: Helper.of(context).simpleText(txt: e.jenis,color: Colors.black),value: e,);
                }).toList(),
                onChanged: (newValue){
                  setState(() {
                    selected = newValue;
                  });
                }),
          ),
        );
      },
    );
  }

  getImage()async{
    final _piker = ImagePicker();
    final response =  await _piker.getImage(source: ImageSource.camera);
    if(response!=null)
      setState(() {
        file = File(response.path);
      });
    else
      Fluttertoast.showToast(msg: "Gagal mengambil gambar. Mohon mencoba lagi");
  }

}