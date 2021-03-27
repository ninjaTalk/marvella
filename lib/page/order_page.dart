import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marvella/models/index.dart';
import 'package:marvella/page/proof_payment_page.dart';
import 'package:marvella/services/base_view.dart';
import 'package:marvella/services/helper.dart';
import 'package:marvella/services/view_state.dart';
import 'package:marvella/view_model/order_view_model.dart';

class OrderPage extends StatefulWidget{

  Map<String, String> dataSend;
  OrderPage({this.dataSend});

  @override
  _OrderState createState() => _OrderState();

}

class _OrderState extends State<OrderPage>{

  TextEditingController _product = TextEditingController();
  TextEditingController _sizeHeght = TextEditingController();
  TextEditingController _sizeWidth = TextEditingController();
  TextEditingController _qty = TextEditingController(text: "1");
  TextEditingController _description = TextEditingController();

  Design selectedDesign;

  File fileDesign;

  @override
  Widget build(BuildContext context) {
    return BaseView<OrderViewModel>(
      onModelReady: (model){
        model.getAllDeign();
      },
      builder: (context, model, child)=>Scaffold(
        // backgroundColor: Colors.white,
        appBar: Helper.of(context).customAppbar("Data Pesanan"),
        body: model.state == ViewState.Busy ? Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Helper.of(context).simpleText(txt: "Produk", fontSize: 16.0,color: Colors.black45),
                ),
                selectProduct(model),
                SizedBox(height: 24,),
                Container(
                  child: Helper.of(context).simpleText(txt: "Ukuran", fontSize: 16.0,color: Colors.black45),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(child: TextFormField(
                        controller: _sizeWidth,
                        // initialValue: "Metode Pembayaran",
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                            labelText: "Panjang",
                            labelStyle: TextStyle(
                                color: Colors.black,
                              fontSize: 14
                            )
                        ),
                      ),),
                      Container(width: 40,
                      margin: EdgeInsets.symmetric(horizontal: 16,),
                      child: Center(child: Text(":",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),),),
                      Expanded(child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _sizeHeght,
                       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                            labelText: "Lebar",
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14
                            )
                        ),
                      ),)
                    ],
                  ),
                ),

                SizedBox(height: 24,),
                TextFormField(
                  controller: _qty,
                  // initialValue: "Metode Pembayaran",
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      labelText: "Jumlah",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      )
                  ),
                ),

                SizedBox(height: 24,),

                Container(
                  margin: EdgeInsets.only(top: 38, bottom: 8),
                  child: Helper.of(context).simpleText(txt: "Keterangan*", fontSize: 14.0,color: Colors.black45),
                ),

                Container(
                  height: 120,
                  padding: EdgeInsets.fromLTRB(16, 2, 16, 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.white,
                    border: Border.all(color: Colors.black12, width: 1),
                  ),
                  child: TextFormField(
                    controller: _description,
                    maxLines: null,
                    // initialValue: "Metode Pembayaran",
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Keterangan tambahan pesanan anda",
                        labelStyle: TextStyle(
                            color: Colors.black
                        ),
                        hintStyle: TextStyle(fontSize: 14)
                    ),
                  ),
                ),
                SizedBox(height: 34,),

                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Helper.of(context).simpleText(txt: "Tambah Desain", fontSize: 14.0,color: Colors.black45),
                ),

                GestureDetector(
                    onTap: getImage,
                    child: Container(
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
                      padding: fileDesign!=null ? EdgeInsets.zero : EdgeInsets.all(24),
                      height: 160,width: 240,
                      child: fileDesign!=null ? Image.file(fileDesign,width: double.infinity,fit: BoxFit.cover,) : Image.asset("assets/main/image.png"),
                    )
                )
              ],
            ),
          ),
        ),
        floatingActionButton: model.load == ViewLoad.Busy ? CircularProgressIndicator() : Helper.of(context).nextButton((){
          validate((){
            widget.dataSend['id_desain'] = selectedDesign.idDesain.toString();
            widget.dataSend['keterangan'] = _description.value.text;
            widget.dataSend['panjang'] = _sizeWidth.value.text;
            widget.dataSend['lebar'] = _sizeHeght.value.text;
            widget.dataSend['jumlah'] = _qty.value.text;
            log(json.encode(widget.dataSend).toString());
            model.addOrder(fileDesign, widget.dataSend).whenComplete(() {
              if(model.addSuccess){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>ProofPaymentPage(order: model.order,backType: 2,)));
              }
            });
          });
        }, title: "Buat Pesanan"),
      ),
    );
  }

  Widget selectProduct(OrderViewModel model){
    return FormField(
      enabled: false,
      builder: (FormFieldState<Design> state){
        return InputDecorator(
          decoration: InputDecoration(
            hintText: "Pilih Product Anda",
            hintStyle: TextStyle(color: Colors.black)
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Design>(
                dropdownColor: Colors.white,
                value: selectedDesign,
                hint: Helper.of(context).simpleText(txt: "Pilih Produk",color: Colors.black),
                isDense: true,
                items: model.listenDesign.map<DropdownMenuItem<Design>>((e){
                  return DropdownMenuItem<Design>(child: Helper.of(context).simpleText(txt: e.jenisDesain + " ${e.ukuran} ${e.harga} ",color: Colors.black),value: e,);
                }).toList(),
                onChanged: (newValue){
                  setState(() {
                    selectedDesign = newValue;
                  });
                }),
          ),
        );
      },
    );
  }
  
  validate(Function function){
    if(selectedDesign == null ){
      Fluttertoast.showToast(msg: "Mohon Pilih Produk Anda Terlebih Dahulu",toastLength: Toast.LENGTH_LONG);
    }else if(_sizeHeght.value.text.isEmpty || _sizeHeght.value.text.trim().length < 0){
      Fluttertoast.showToast(msg: "Mohon Memasukkan Lebar Pesanan Anda Terlebih Dahulu",toastLength: Toast.LENGTH_LONG);
    }else if(_sizeWidth.value.text.isEmpty || _sizeWidth.value.text.trim().length < 0){
      Fluttertoast.showToast(msg: "Mohon Memasukkan Panjang Pesanan Anda Terlebih Dahulu",toastLength: Toast.LENGTH_LONG);
    }else if(_qty.value.text.isEmpty || _qty.value.text.trim().length < 0){
      Fluttertoast.showToast(msg: "Mohon Memasukkan Jumlah Anda Terlebih Dahulu",toastLength: Toast.LENGTH_LONG);
    }else if(fileDesign == null){
      Fluttertoast.showToast(msg: "Mohon Memasukkan Desain Pesanan Anda Terlebih Dahulu",toastLength: Toast.LENGTH_LONG);
    }else{
      function();
    }
  }


  getImage()async{
    final _piker = ImagePicker();
    final response =  await _piker.getImage(source: ImageSource.gallery);
    if(response!=null)
      setState(() {
        fileDesign = File(response.path);
      });
    else
      Fluttertoast.showToast(msg: "Gagal mengambil gambar. Mohon mencoba lagi");
  }

}