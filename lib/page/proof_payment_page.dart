import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marvella/page/preview_order_page.dart';
import 'package:marvella/services/helper.dart';

class ProofPaymentPage extends StatefulWidget{
  @override
  _ProofPaymentState createState() => _ProofPaymentState();

}

class _ProofPaymentState extends State<ProofPaymentPage>{

  File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: Helper.of(context).customAppbar("Data Pesanan"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Helper.of(context).simpleText(txt: "Tambahkan Bukti Pembayaran Anda, dengen Menekan gambar di bawah.", fontweight: FontWeight.w500),
            SizedBox(height: 24,),

            Helper.of(context).simpleText(txt: "Tambahkan Bukti Pembayaran, tekan gambar dibawah"),
            GestureDetector(
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
                  child: file!=null ? Image.file(file,fit: BoxFit.fitWidth,) : Image.asset("assets/main/image.png"),
                )
            )
          ],
        )
      ),
      floatingActionButton: Helper.of(context).nextButton((){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>PreviewOrderPage()));
      }),
    );
  }

  getImage()async{
    final _piker = ImagePicker();
    final response =  await _piker.getImage(source: ImageSource.gallery);
    if(response!=null)
      setState(() {
        file = File(response.path);
      });
    else
      Fluttertoast.showToast(msg: "Gagal mengambil gambar. Mohon mencoba lagi");
  }

}