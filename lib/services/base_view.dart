
import 'package:flutter/cupertino.dart';
import 'package:marvella/services/locator.dart';
import 'package:marvella/view_model/base_view_model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget{

  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  const BaseView({this.builder, this.onModelReady});

  @override
  _BaseViewState createState() => _BaseViewState();

}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>>{

  T model = locator<T>();

  @override
  void initState() {
    if(widget.onModelReady!=null){
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      child: Consumer<T>(builder: widget.builder,),
    );
  }

}