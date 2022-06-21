

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// import '../model/food_model.dart';

// abstract class BaseDatabaseRepository {
//   Stream<FoodModel> getItem(String itemID);
//   Future<void> updateItemImgURL(String imageName);
// }

// abstract class BaseStorageRepository {
//   Future<void> uploadImage(XFile uImage);
//   Future<String> getDwnldURL(String imageName);
// }

// class DatabaseRepo extends BaseDatabaseRepository {
//   final restaurantCol = FirebaseFirestore.instance.collection('restaurants');
//   final categoryCol = FirebaseFirestore.instance.collection('categories');
//   final foodCol = FirebaseFirestore.instance.collection('foods');
//   @override
//   Stream<FoodModel> getItem(String itemID) {
//     return foodCol
//         .doc(itemID)
//         .snapshots()
//         .map((snap) => FoodModel.fromSnapShot(snap));
//   }

//   @override
//   Future<void> updateItemImgURL(String imageName) async {
//     String downloadURL = await StorageRepo().getDwnldURL(imageName);
//     return foodCol.doc().update({'foodImgUrl': downloadURL});
//   }
// }




// class StorageRepo extends BaseStorageRepository {
//   final storage = FirebaseStorage.instance;
//   @override
//   Future<void> uploadImage(XFile uImage) async {
//     try {
//       await storage.ref().putFile(File(uImage.path)); //.then((p0) => DatabaseRepo().updateItemImgURL(uImage.name ));
//     } catch (e) {print(e);}
//   }

//   @override
//   Future<String> getDwnldURL(String imageName) async {
//     String downloadURL = await storage.ref('imgs/$imageName').getDownloadURL();
//     return downloadURL;
//   }
// }
