import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:marvella/models/index.dart';
import 'package:marvella/services/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

final client = new Client();

ValueNotifier<User> user = new ValueNotifier(User());

ValueNotifier token = new ValueNotifier("");

class UserRepository{

  void setCurrentUser(value)async{
    ///set data json as local
    try{
      if(json.decode(value)['data']!=null){
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("current_user", json.encode(json.decode(value)['data']));
      }
      log("success");
    }catch(e){
      log(value);
    }
  }

  Future<User> getCurrentUser()async{
    ///get local data user
    SharedPreferences pref = await SharedPreferences.getInstance();

    if(pref.containsKey("current_user")){
      user.value = User.fromJson(json.decode(await pref.get('current_user')));
    }

    user.notifyListeners();
    return user.value;
  }

  void setCurrentToken(value)async{
    try{
      if(value!=null){
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("token", json.encode(value));
      }
    }catch(e){
      log(value);
    }
  }

  Future getCurrentToken()async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.containsKey("token")) {
      token.value = json.decode(await pref.get('token'));
      print("TOKEN MU ${token.value}");
    }

    token.notifyListeners();
    return token;
  }

  Future<void> removeUser()async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    if(pref.containsKey("current_user")){
      await pref.remove("current_user");
      user.value = new User();
    }

    if(pref.containsKey("token")){
      await pref.remove("token");
      token.value = null;
    }

    token.notifyListeners();
  }

  
  Future<UserResponse> login(email,password)async{
    String url = "${GlobalConfiguration().get('endpoint')}/v1/login";

    final client = new Client();

    var response = await client.post(url,
      body: {
        "email" : email,
        "password" : password
      }
    );

    if(response.statusCode == 200 && json.decode(response.body)['data']!=null){
      setCurrentUser(response.body);
      setCurrentToken(json.decode(response.body)['token']);
      getCurrentUser();
      getCurrentToken();
    }

    log("LOGIN RESPONSE");
    log(url);
    log(response.body);

    return UserResponse.fromJson(json.decode(response.body));
  }

  Future<UserResponse> register(Map<String, String> dataSend)async{
    String url = "${GlobalConfiguration().get('endpoint')}/v1/register";

    final client = new Client();

    print(json.encode(dataSend));

    var response = await client.post(url,
        body: {
        "nama" : dataSend['name'],
        "no_telp" : dataSend['no_telp'],
        "jk" : dataSend['jk'],
        "alamat" : dataSend['alamat'],
        "email" : dataSend['email'],
        "password" : dataSend['password']
        });

    log("REGISTER RESPONSE");
    print(url);
    log(response.body);

    if(response.statusCode == 200 && json.decode(response.body)['data']!=null){
      setCurrentUser(response.body);
      setCurrentToken(json.decode(response.body)['token']);
      getCurrentUser();
      getCurrentToken();
    }

    return UserResponse.fromJson(json.decode(response.body));
  }

  Future<UserResponse> getUser()async{
    String url = "${GlobalConfiguration().get('endpoint')}/v1/users/${user.value.id}";

    log(url);
    print(Helper.getHeader());

    final client = new Client();

    var response = await client.get(url,headers: Helper.getHeader());

    log("DETAIL USER RESPONSE");
    print(response.body);

    return UserResponse.fromJson(json.decode(response.body));
  }

  Future<LogoutResponse> logout()async{
    String url = "${GlobalConfiguration().get('endpoint')}/v1/logout";

    var response = await client.post(url, headers: Helper.getHeader());

    if(response.statusCode == 200){
      removeUser();
    }
    print(json.encode(Helper.getHeader()));
    log("Logout RESPONSE");
    log("$url");
    log(response.body);

    return LogoutResponse.fromJson(json.decode(response.body));
  }


}