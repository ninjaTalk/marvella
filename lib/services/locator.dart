import 'package:get_it/get_it.dart';
import 'package:marvella/repository/order_repository.dart';
import 'package:marvella/repository/user_repository.dart';
import 'package:marvella/view_model/order_view_model.dart';
import 'package:marvella/view_model/user_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator(){

  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => OrderRepository());

  locator.registerFactory(() => UserViewModel());
  locator.registerFactory(() => OrderViewModel());

}