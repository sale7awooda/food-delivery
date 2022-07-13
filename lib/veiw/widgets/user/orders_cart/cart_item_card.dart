import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:orders/utils/theme.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard(
      {Key? key,
      required this.ffoodName,
      required this.ffoodImg,
      required this.ffoodPrice,
      // required this.removefrmCart
      })
      : super(key: key);

  //final cartctrl = Get.find<CartController>();
  // dynamic argumnts = Get.arguments;
  final String? ffoodName;
  // String ffoodDetails ;
  final String? ffoodImg;
  // String ffoodCategID ;
  // String ffoodResturantID;
  final int? ffoodPrice;
  //final Callback? removefrmCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      //width: 100,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: mainColor.withOpacity(.8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ffoodName!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "\$ $ffoodPrice",
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
          
          ImageNetwork(
            image: ffoodImg!,
            // imgUrl!,
            height: 70,
            width: 70,
            fitAndroidIos: BoxFit.cover,
            fitWeb: BoxFitWeb.cover,
          ),
          // IconButton(
          //           onPressed: () {
          //            ()=> removefrmCart!;
          //           },
          //           icon: const Icon(
          //             Icons.delete_forever,
          //             color: redClr,
          //           ))
        ],
      ),
    );
  }
}



// Obx(() {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: [
//                 //     IconButton(
//                 //         onPressed: () {
//                 //           cartctrl.quantity++;
//                 //           // setState(() {
//                 //           //  cartctrl.quantity++;
//                 //           // });
//                 //         },
//                 //         icon: const Icon(Icons.add)),
//                 //     Text(
//                 //       cartctrl.quantity.toString(),
//                 //       style: const TextStyle(fontSize: 20),
//                 //     ),
//                 //     IconButton(
//                 //         onPressed: () {
//                 //           if (cartctrl.quantity > 0) {
//                 //             cartctrl.quantity--;
//                 //           } else {}
//                 //         },
//                 //         icon: const Icon(Icons.remove)),
//                 //   ],
//                 // ),
                
//               ],
//             );
//           }),