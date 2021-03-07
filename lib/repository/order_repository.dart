import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart';
import 'package:marvella/models/index.dart';
import 'package:marvella/repository/user_repository.dart';
import 'package:marvella/services/helper.dart';

class OrderRepository{

  Future<ListenDesign> getDesign()async{
    String url = "${GlobalConfiguration().get('endpoint')}/v1/desain";

    final client = new Client();

    var response = await client.get(url,headers: Helper.getHeader());

    log("DETAIL USER RESPONSE");
    print(response.body);

    return ListenDesign.fromJson(json.decode(response.body));
  }

  Future<ListenOrder> getOrderHistory()async{
    String url = "${GlobalConfiguration().get('endpoint')}/v1/pesanan";

    final client = new Client();

    var response = await client.get(url,headers: Helper.getHeader());

    log("DETAIL USER RESPONSE");
    print(response.body);

    return ListenOrder.fromJson(json.decode(response.body));
  }

  Future<OrderResponse>  addOrder(Map<String, String> dataSend , File file)async{
    final String url = '${GlobalConfiguration().getString('endpoint')}v1/users/${user.value.id}/pesanan';

    var dataSend =  new Map<String, dynamic>();

    dataSend['file'] = file;

    MultipartRequest request =  new MultipartRequest('POST', Uri.parse(url));

    request.headers.addAll(Helper.getHeader());
    request.fields['id_desain'] = dataSend['id_desain'];
    request.fields['keterangan'] = dataSend['keterangan'];
    request.fields['panjang'] = dataSend['panjang'];
    request.fields['lebar'] = dataSend['lebar'];
    request.fields['jumlah'] = dataSend['jumlah'];
    request.files.add(await MultipartFile.fromPath('file', file.path));

    StreamedResponse response = await request.send();

    final res = await response.stream.bytesToString();

    print(res);

    return OrderResponse.fromJson(json.decode(res));
  }

  Future<OrderResponse>  proofPayment(orderId, paymentId, File file)async{
    final String url = '${GlobalConfiguration().getString('endpoint')}v1/users/${user.value.id}/pesanan/$orderId/pay';

    var dataSend =  new Map<String, dynamic>();

    dataSend['bukti_bayar'] = file;

    MultipartRequest request =  new MultipartRequest('POST', Uri.parse(url));

    request.headers.addAll(Helper.getHeader());
    request.fields['id_jenis_pembayaran'] = paymentId;
    request.files.add(await MultipartFile.fromPath('bukti_bayar', file.path));

    StreamedResponse response = await request.send();

    final res = await response.stream.bytesToString();

    print(res);

    return OrderResponse.fromJson(json.decode(res));
  }




}