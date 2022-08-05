import 'package:get/get.dart';
import 'package:orders/logic/binding/auth_binding.dart';
import 'package:orders/logic/binding/app_binding.dart';
import 'package:orders/logic/binding/firestor_binding.dart';
import 'package:orders/veiw/screens/admin/admin_screen.dart';
import 'package:orders/veiw/screens/auth/sign_in.dart';
import 'package:orders/veiw/screens/auth/sign_up.dart';
import 'package:orders/veiw/screens/resturant/rest_home.dart';
import 'package:orders/veiw/screens/resturant/rest_orders.dart';
import 'package:orders/veiw/screens/user/all_resturants.dart';
import 'package:orders/veiw/screens/user/category_details_screen.dart';
import 'package:orders/veiw/screens/user/food_details.dart';
import 'package:orders/veiw/screens/user/home.dart';
// import 'package:orders/veiw/screens/user/most_ordered.dart';
import 'package:orders/veiw/screens/user/my_orders.dart';
import 'package:orders/veiw/screens/user/user_screen.dart';
import '../veiw/screens/resturant/resturant_screen.dart';
import '../veiw/screens/user/resturant.dart';
import '../welcome_screen.dart';

class AppRoutes {
  //initial route
  static const welcome = Routes.welcomeScreen;

  //getPages

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.adminScreen,
        page: () => const AdminScreen(),
        bindings: [AuthBinding(), AppBinding(), FirestoreBinding()]),
    GetPage(
        name: Routes.signInScreen,
        page: () => SignIn(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUp(),
        binding: AuthBinding()),

    // GetPage(
    //     name: Routes.forgotpassScreen,
    //     page: () => ForgotPasswordScreen(),
    //     binding: AuthBinding()),
    GetPage(
        name: Routes.userScreen,
        page: () => const UserScreen(),
        bindings: [AuthBinding(), AppBinding(), FirestoreBinding()]),
        GetPage(
        name: Routes.homeScreen,
        page: () => const HomeScreen(),
        bindings: [AuthBinding(), AppBinding(), FirestoreBinding()]),
    GetPage(
        name: Routes.allResturants,
        page: () => const AllResturantsScreen(),
        bindings: [AuthBinding(), AppBinding(), FirestoreBinding()]),
    GetPage(
        name: Routes.categorydetails,
        page: () => const CategoryDetailsScreen(),
        bindings: [AuthBinding(), AppBinding(), FirestoreBinding()]),
    GetPage(
        name: Routes.resturant,
        page: () => const Resturant(),
        bindings: [AuthBinding(), AppBinding(), FirestoreBinding()]),
    GetPage(
        name: Routes.resturantsScreen,
        page: () => const ResturantsScreen(),
        bindings: [AuthBinding(), AppBinding(), FirestoreBinding()]),
    // GetPage(
    //     name: Routes.mostordered,
    //     page: () => const MostOrderedScreen(),
    //     bindings: [AuthBinding(), AppBinding(), FirestoreBinding()]),
    GetPage(
        name: Routes.fooddetails,
        page: () => const FoodDetailsScreen(),
        bindings: [AuthBinding(), AppBinding(), FirestoreBinding()]),
    GetPage(
        name: Routes.myordersScreen,
        page: () =>  const MyOrdersScreen(),
        bindings: [AuthBinding(), AppBinding(), FirestoreBinding()]),
        GetPage(
        name: Routes.resthomeScreen,
        page: () =>  const RestHomeScreen(),
        bindings: [AuthBinding(), AppBinding(), FirestoreBinding()]),
        GetPage(
        name: Routes.restordersScreen,
        page: () =>  const RestOrdersScreen(),
        bindings: [AuthBinding(), AppBinding(), FirestoreBinding()]),
    // GetPage(
    //     name: Routes.manageresturants,
    //     page: () => const ManageResturants(),
    //     binding: AppBinding()),
    // GetPage(
    //     name: Routes.managecategories,
    //     page: () => const ManageCategories(),
    //     binding: AppBinding()),
    // GetPage(
    //     name: Routes.managerorders,
    //     page: () => const ManageOrders(),
    //     binding: AppBinding()),
    // GetPage(name: Routes.cart, page: () => const Cart(), binding: AppBinding()),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const signInScreen = '/signInScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotpassScreen = '/forgotPasswordScreen';
  static const userScreen = '/userScreen';
  static const homeScreen = '/homeScreen';
  static const adminScreen = '/adminScreen';
  static const resturantsScreen = '/resturantsScreen';
  static const allResturants = '/allResturants';
  static const resturant = '/resturant';
  static const mostordered = '/mostordered';
  static const fooddetails = '/fooddetails';
  static const categorydetails = '/categorydetails';
  static const managecategories = '/managecategories';
  static const manageresturants = '/manageresturants';
  static const managerorders = '/managerorders';
  static const managefoods = '/managefoods';
  static const myordersScreen = '/myorders';
  static const resthomeScreen = '/resthomeScreen';
  static const restordersScreen = '/restorders';
}
