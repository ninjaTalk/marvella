import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart';
import 'package:marvella/models/index.dart';
import 'package:marvella/repository/user_repository.dart';
import 'package:marvella/services/helper.dart';
import 'package:http/http.dart' as http;

class NotificationRepository{

  Future<ListenNotification> getAllNotification()async{
    String url = "${GlobalConfiguration().get('endpoint')}/v1/notifikasi";

    final client = new Client();

    var response = await client.get(url,headers: Helper.getHeader());

    log("DETAIL USER RESPONSE");
    print(response.body);

    return ListenNotification.fromJson(json.decode(response.body));
  }





}