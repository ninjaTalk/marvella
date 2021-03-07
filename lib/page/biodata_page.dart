import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/page/order_page.dart';
import 'package:marvella/services/helper.dart';
import '../repository/user_repository.dart' as user;

class BioPage extends StatefulWidget{
  @override
  _BioState createState() => _BioState();

}

class _BioState extends State<BioPage>{

  var dataSend = Map<String, String>();

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
            Helper.of(context).simpleText(txt: "${user.user.value.nama}",
                fontSize: 16.0),
            SizedBox(height: 16,),
            Helper.of(context).simpleText(txt: "Email",
                fontweight: FontWeight.w700, fontSize: 12.0),
            Helper.of(context).simpleText(txt: "${user.user.value.email}",
                fontSize: 16.0),
            SizedBox(height: 16,),
            Helper.of(context).simpleText(txt: "Alamat",
                fontweight: FontWeight.w700, fontSize: 12.0),
            Helper.of(context).simpleText(txt: "${user.user.value.alamat}",
                fontSize: 16.0),
            SizedBox(height: 16,),
          ],
        ),
      ),
      floatingActionButton: Helper.of(context).nextButton((){
        dataSend['nama'] = user.user.value.nama;
        dataSend['email'] = user.user.value.email;
        dataSend['alamat'] = user.user.value.alamat;
        Navigator.push(context, MaterialPageRoute(builder: (_)=>OrderPage(dataSend: dataSend,)));
      }),
    );
  }

}