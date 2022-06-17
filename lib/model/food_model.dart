class FoodModel {
  String? foodName, foodDetails, foodImage, foodCategID, foodResturantID;
  int? foodPrice, foodTime;
  bool? foodStatus = true;
  FoodModel({
    
    required this.foodTime,
     this.foodStatus,
    required this.foodCategID,
    required this.foodDetails,
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
    required this.foodResturantID,
  });
}
