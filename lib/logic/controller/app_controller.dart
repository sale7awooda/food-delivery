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
      [const HomeScreen(), const MyOrdersScreen(), const SettingsScreen()].obs;
  int selectedIndexResturant = 0;
  final resturantScreens = [
    const RestHomeScreen(),
    const RestOrdersScreen(),
    const RestSettingsScreen()
  ].obs;
  var restid=0;
}
