import 'dart:io';

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


  Future<void> addOrder(File file, Map<String, String> dataSend)async{
    setLoad(ViewLoad.Busy);

    try{
      OrderResponse response = await orderRepository.addOrder(dataSend, file);

      if(response.success){
        this.order = response.data;
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Terjadi Kesalahan Mohon Coba Lagi");
    }

    setLoad(ViewLoad.Idle);
  }


  Future<void> addProfOfPayment(orderId, paymentId, File file)async{
    setState(ViewState.Busy);

    try{
      OrderResponse response = await orderRepository.proofPayment(orderId, paymentId, file);

      if(response.success){
        this.order = response.data;
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Terjadi Kesalahan Mohon Coba Lagi");
    }

    setState(ViewState.Idle);
  }
}