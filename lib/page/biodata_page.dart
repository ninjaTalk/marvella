import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/page/order_page.dart';
import 'package:marvella/services/helper.dart';

class BioPage extends StatefulWidget{
  @override
  _BioState createState() => _BioState();

}

class _BioState extends State<BioPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Helper.of(context).customAppbar("Biodata Pemesan"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Helper.of(context).simpleText(txt: "Nama",
                fontweight: FontWeight.w700, fontSize: 12.0),
            Helper.of(context).simpleText(txt: "Angga Pande",
                fontSize: 16.0),
            SizedBox(height: 16,),
            Helper.of(context).simpleText(txt: "Email",
                fontweight: FontWeight.w700, fontSize: 12.0),
            Helper.of(context).simpleText(txt: "anggapande@gmail.com",
                fontSize: 16.0),
            SizedBox(height: 16,),
            Helper.of(context).simpleText(txt: "Alamat",
                fontweight: FontWeight.w700, fontSize: 12.0),
            Helper.of(context).simpleText(txt: "Br.Sasih, Batubulan",
                fontSize: 16.0),
            SizedBox(height: 16,),
          ],
        ),
      ),
      floatingActionButton: Helper.of(context).nextButton((){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>OrderPage()));
      }),
    );
  }

}