import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvella/page/sign_in.dart';
import 'package:marvella/repository/user_repository.dart';
import 'package:marvella/services/data%20_static.dart';
import 'package:marvella/services/helper.dart';
import 'package:marvella/services/locator.dart';

class HomePage extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<HomePage>{

  List<DataStatic> _listMenu;

  UserRepository userRepository = locator<UserRepository>();

  @override
  void initState() {
    setState(() {
      _listMenu = GetData.getDataMenu(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: ListTile(
            // tileColor: Colors.blue,
            contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.asset("assets/main/user.png"),
            ),
            title: Helper.of(context).simpleText(txt: "Angga Pande",fontweight: FontWeight.w700, fontSize: 16.0),
            subtitle: Helper.of(context).simpleText(txt: "anggapande@gmail.com", fontSize: 12.0),
          ),
          backgroundColor: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)
              )
          ),
        ),
      ),
      extendBody: true,
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        itemCount: _listMenu.length,
        itemBuilder: (BuildContext context, int index){
          return Padding(padding: EdgeInsets.symmetric(vertical: 16),
            child: menuItem(_listMenu.elementAt(index)),
          );
        },
      ),
    );
  }

  Widget menuItem(DataStatic dataStatic){
    return GestureDetector(
      onTap: ()async{
         if(dataStatic.label == "Logout"){
           logout(context);
         }else{
           dataStatic.future();
         }
      },
      child: Container(
        padding: EdgeInsets.only(left: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(3.5,3.5),
              spreadRadius: 2
            )
          ]
        ),
        child: Row(
          children: [
            Image.asset("${dataStatic.icon}", width: 40,),
            SizedBox(width: 16,),
            Expanded(
              child: Helper.of(context).simpleText(
                txt: dataStatic.label,
                fontSize: 18.0,
                fontweight: FontWeight.w700
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF22CED6),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)
                )
              ),
              child: Center(
                child: Icon(Icons.arrow_right, color: Colors.white,size: 40,),
              ),
            )
          ],
        ),
      ),
    );
  }

  void logout(BuildContext context)async{
    await userRepository.logout().then((value) {
      if(value.success){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SignIn()));
      }
    });
  }

}