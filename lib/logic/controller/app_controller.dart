import 'package:get/get.dart';
import 'package:orders/veiw/screens/user/home.dart';
import 'package:orders/veiw/screens/user/my_orders.dart';
import 'package:orders/veiw/screens/user/settings.dart';

class AppController extends GetxController{

  RxInt selectedIndex = 0.obs;
   final adminScreens = const [
    HomeScreen(),
    MyOrdersScreen(),
    SettingsScreen()
  ].obs;

}
