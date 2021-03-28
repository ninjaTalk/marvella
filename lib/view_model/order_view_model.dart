import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marvella/models/index.dart';
import 'package:marvella/repository/order_repository.dart';
import 'package:marvella/services/locator.dart';
import 'package:marvella/services/view_state.dart';
import 'package:marvella/view_model/base_view_model.dart';

class OrderViewModel extends BaseViewModel{

  OrderRepository orderRepository = locator<OrderRepository>();

  Order order;
  List<Order> listenOrder = new List<Order>();
  List<Design> listenDesign = new List<Design>();
  bool addSuccess = false;
  List<PaymentMethod> listPayment = new List<PaymentMethod>();

  Future<void> getAllOrder()async{
    setState(ViewState.Busy);

    ListenOrder response = await orderRepository.getOrderHistory();

    if(response.success && response.data.length>0){
      this.listenOrder = response.data;
    }

    setState(ViewState.Idle);
  }

  Future<void> getAllDeign()async{
    setState(ViewState.Busy);

    ListenDesign response = await orderRepository.getDesign();

    if(response.success && response.data.length>0){
      this.listenDesign = response.data;
    }

    setState(ViewState.Idle);
  }

  Future<void> getOrderDetail(id)async{
    setState(ViewState.Busy);

    OrderResponse response = await orderRepository.getDetailOrder(id);

    if(response.success){
      this.order = response.data;
    }

    setState(ViewState.Idle);
  }

  Future<void> getPayment()async{
    setState(ViewState.Busy);

    PaymentsMethodResponse response = await orderRepository.getPaymentMethod();

    if(response.success){
      this.listPayment = response.data;
    }

    setState(ViewState.Idle);
  }


  Future<void> addOrder(File file, Map<String, String> dataSend)async{
    setLoad(ViewLoad.Busy);

    try{
      OrderResponse response = await orderRepository.addOrder(dataSend, file);

      if(response.success){
        this.addSuccess = true;
        this.order = response.data;
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Terjadi Kesalahan Mohon Coba Lagi");
    }

    setLoad(ViewLoad.Idle);
  }


  Future<void> addProfOfPayment(String orderId, String paymentId, {File file})async{
    setLoad(ViewLoad.Busy);

    try{
      OrderResponse response;
      if(file!=null && paymentId == "3"){
         response = await orderRepository.proofPayment(orderId, paymentId, file);
      }else{
        response = await orderRepository.proofPaymentWithoutImage(orderId, paymentId);
      }


      if(response.success){
        this.order = response.data;
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Terjadi Kesalahan Mohon Coba Lagi");
    }

    setLoad(ViewLoad.Idle);
  }

  Future<void> cancelOrder(id, BuildContext context)async{
    setLoad(ViewLoad.Busy);

    try{
      OrderResponse response = await orderRepository.cancelOrder(id);
      if(response.code == 200){
        Navigator.pop(context);
        Navigator.pop(context);
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Terjadi Kesalahan Mohon Coba Lagi");
    }

    setLoad(ViewLoad.Busy);
  }
}