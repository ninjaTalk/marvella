import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marvella/page/proof_payment_page.dart';
import 'package:marvella/services/helper.dart';

class OrderPage extends StatefulWidget{
  @override
  _OrderState createState() => _OrderState();

}

class _OrderState extends State<OrderPage>{

  TextEditingController _product = TextEditingController();
  TextEditingController _size = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _paymentMethod = TextEditingController();
  TextEditingController _description = TextEditingController();

  File fileDesign;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: Helper.of(context).customAppbar("Data Pesanan"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _product,
                enabled: false,
                // initialValue: "Banner",
                decoration: InputDecoration(
                  labelText: "Produk",
                  labelStyle: TextStyle(
                    color: Colors.black
                  )
                ),
              ),

              TextFormField(
                controller: _size,
                enabled: false,
                // initialValue: "Banner 1.5 x 2 m",
                decoration: InputDecoration(
                  labelText: "Ukuran",
                  labelStyle: TextStyle(
                    color: Colors.black
                  )
                ),
              ),
              TextFormField(
                controller: _price,
                enabled: false,
                // initialValue: "Harga",
                decoration: InputDecoration(
                  labelText: "Harga",
                  labelStyle: TextStyle(
                    color: Colors.black
                  )
                ),
              ),
              TextFormField(
                controller: _paymentMethod,
                enabled: false,
                // initialValue: "Metode Pembayaran",
                decoration: InputDecoration(
                  labelText: "Metode Pembayaran",
                  labelStyle: TextStyle(
                    color: Colors.black
                  )
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30, bottom: 8),
                child: Helper.of(context).simpleText(txt: "Keterangan*", fontSize: 14.0),
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
              SizedBox(height: 24,),

              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Helper.of(context).simpleText(txt: "Tambah Desain", fontSize: 14.0),
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
                  child: fileDesign!=null ? Image.file(fileDesign,width: double.infinity,fit: BoxFit.fitWidth,) : Image.asset("assets/main/image.png"),
                )
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Helper.of(context).nextButton((){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProofPaymentPage()));
      }),
    );
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