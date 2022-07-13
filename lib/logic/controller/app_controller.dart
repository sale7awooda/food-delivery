import 'package:get/get.dart';
import 'package:orders/veiw/screens/resturant/rest_home.dart';
import 'package:orders/veiw/screens/resturant/rest_orders.dart';
import 'package:orders/veiw/screens/resturant/rest_settings.dart';
import 'package:orders/veiw/screens/user/home.dart';
import 'package:orders/veiw/screens/user/my_orders.dart';
import 'package:orders/veiw/screens/user/settings.dart';

class AppController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final adminScreens =
      [const HomeScreen(), MyOrdersScreen(), const SettingsScreen()].obs;
  RxInt selectedIndexResturant = 0.obs;
  final resturantScreens = [
    const RestHomeScreen(),
    RestOrdersScreen(),
    const RestSettingsScreen()
  ].obs;
  var restid=0;
}
