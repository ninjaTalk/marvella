import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/page/home.dart';
import 'package:marvella/services/helper.dart';

class PreviewOrderPage extends StatefulWidget{
  @override
  _PreviewOrderState createState() => _PreviewOrderState();

}

class _PreviewOrderState extends State<PreviewOrderPage>{

  File fileDesign;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: Helper.of(context).customAppbar("Pesanan Pesanan"),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
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
                enabled: false,
                // initialValue: "Metode Pembayaran",
                decoration: InputDecoration(
                    labelText: "Metode Pembayaran",
                    labelStyle: TextStyle(
                        color: Colors.black
                    )
                ),
              ),

              TextFormField(
                enabled: false,
                // initialValue: "Metode Pembayaran",
                decoration: InputDecoration(
                    labelText: "Bukti Pembayaran",
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
                  child: Container(
                    padding: EdgeInsets.all(24),
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
                    height: 160,width: 240,
                    child: fileDesign!=null ? Image.file(fileDesign,) : Image.asset("assets/main/image.png"),
                  )
              )
            ],
          ),
      ),
      floatingActionButton: RaisedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
        },
        color: Color(0xFF22CED5),
        padding: EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: Helper.of(context).simpleText(txt: "Pesan",
            color: Colors.white,
            fontweight: FontWeight.w700,
            fontSize: 15.0),
      )
    );
  }

}