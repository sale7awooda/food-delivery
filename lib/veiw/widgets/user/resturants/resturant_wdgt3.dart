import 'dart:math';

//import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import 'package:orders/utils/theme.dart';

class ResurantWdgt3 extends StatelessWidget {
  ResurantWdgt3({
    Key? key,
    required this.title,
    required this.subtitle,
    this.imgUrl,
    this.rStatus,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? imgUrl;
  final bool? rStatus;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        //height: 200,width: 250,
        constraints: const BoxConstraints(
            //maxHeight: 150,
            ),
        color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
            [_random.nextInt(9) * 100],

        //Colors.black.withOpacity(.7),
        child: Stack(alignment: Alignment.center, //fit: StackFit.loose,
            children: [
              Positioned(
                  left: 0,
                  child:
            //       CachedNetworkImage(
            //   width: 90,
            //   height: 90,
            //   fit: BoxFit.cover,colorBlendMode: BlendMode.clear,
              
            //   imageUrl: imgUrl!,
            //   progressIndicatorBuilder: (context, url, downloadProgress) =>
            //       Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
            //   errorWidget: (context, url, error) => const Icon(
            //     Icons.error,
            //     size: 75,
            //     color: Colors.red,
            //   ),
            // ),
                   AbsorbPointer(
                     child: ImageNetwork(
                       image: imgUrl!,
                       imageCache: CachedNetworkImageProvider(imgUrl!),
                       height: 90,
                       width: 90,
                       duration: 1200,
                       curve: Curves.easeIn,
                      // onPointer: false,
                       debugPrint: false,
                       fullScreen: false,
                       fitAndroidIos: BoxFit.cover,
                       fitWeb: BoxFitWeb.contain,
                       //borderRadius: BorderRadius.circular(70),
                       onLoading: const CircularProgressIndicator(
                         color: Colors.indigoAccent,
                       ),
                       onError: const Icon(
                         Icons.error,
                         color: Colors.red,
                       ),
                      //  onTap: () {
                      //    debugPrint("its working");
                      //  },
                     ),
                   )
                  ),

             
              ListTile(
                contentPadding: const EdgeInsets.all(20),
                // tileColor: mainColor,
                // trailing: Image.asset(imgUrl!),
                title: Text(title!,
                    //textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: mainColor, fontWeight: FontWeight.bold)),
                subtitle: Text(subtitle!,
                    // textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white)),
                //         leading: Container(
                //   decoration: BoxDecoration(
                //       color:rStatus == null ? Colors.yellow :(rStatus == "true" ? Colors.green : redClr),
                //       borderRadius: BorderRadius.circular(15)),
                //   height: 15,
                //   width: 15,
                // ),
              ),
              // Positioned(right: 10,top: 10,
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: 
              //         // rStatus == null
              //         //     ? Colors.yellow
              //         //     : (
              //               rStatus!  ? Colors.green : redClr
              //               // )
              //               ,
              //         borderRadius: BorderRadius.circular(15)),
              //     height: 20,
              //     width: 20,
              //   ),
              // )
            ]),
      ),
    );
  }
}
