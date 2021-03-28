import 'package:flutter/material.dart';
import 'package:marvella/services/helper.dart';
import 'package:photo_view/photo_view.dart';

class ImageFullNetwork extends StatelessWidget{
  String url;
  ImageFullNetwork({this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: Helper.of(context).customAppbar(""),
      body: Center(
        child: new PhotoView(
          maxScale: 16.0,
          loadingBuilder: (ctx, download){
            return CircularProgressIndicator(backgroundColor: Colors.white,);
          },
          backgroundDecoration: BoxDecoration(
              color: Colors.black
          ),
          heroAttributes: PhotoViewHeroAttributes(tag: "image_full"),
          imageProvider: NetworkImage(url),
          loadFailedChild: Image.asset("assets/main/image.png"),
          customSize: Size(
              MediaQuery.of(context).size.width *0.8,
              MediaQuery.of(context).size.height * 0.7
          ),
        ),
      ),
    );
  }

}