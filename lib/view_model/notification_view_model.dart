import 'package:marvella/models/index.dart';
import 'package:marvella/repository/notification_repository.dart';
import 'package:marvella/services/locator.dart';
import 'package:marvella/services/view_state.dart';
import 'package:marvella/view_model/base_view_model.dart';

class NotificationViewModel extends BaseViewModel{

  NotificationRepository notificationRepository = locator<NotificationRepository>();

  List<Notifications> listNotification = new List<Notifications>();

  Future<void> getAllNotification() async {
    setState(ViewState.Busy);

    ListenNotification response = await notificationRepository.getAllNotification();
    if(response.code == 200){
      this.listNotification = response.data;
    }

    setState(ViewState.Idle);
  }


}