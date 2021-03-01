
import 'package:flutter/cupertino.dart';
import 'package:marvella/services/view_state.dart';

class BaseViewModel extends ValueNotifier{
  BaseViewModel(value) : super(value);

  ///set state
  ViewState _state = ViewState.Idle;
  ViewLoad _load = ViewLoad.Idle;
  ViewOption _option = ViewOption.Idle;

  ///get state
  ViewState get state => _state;
  ViewLoad get load => _load;
  ViewOption get option => _option;

  ///method
  void setState(ViewState viewState){
    _state = viewState;
    notifyListeners();
  }

  void setLoad(ViewLoad viewLoad){
    _load = viewLoad;
    notifyListeners();
  }

  void setOption(ViewOption viewOption){
    _option = viewOption;
    notifyListeners();
  }

}