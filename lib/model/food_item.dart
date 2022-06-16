class FoodItem {
  final String? fName, fDesc, fImage, fCateg, fResturant, fID;
  final int? fPrice, fTime;
  final bool fStatus = true;

  FoodItem(this.fName, this.fDesc, this.fImage, this.fCateg, this.fResturant,
      this.fID, this.fPrice, this.fTime);
}

List<FoodItem> foodItems = [
  FoodItem("food1", "sdfsdfgsdfgdfg", "images/groceries.png", "fCateg",
      "fResturant", "fID", 10, 2),
  FoodItem("food1", "sdfsdfgsdfgdfg", "images/groceries.png", "fCateg",
      "fResturant", "fID", 10, 2),
  FoodItem("food1", "sdfsdfgsdfgdfg", "images/groceries.png", "fCateg",
      "fResturant", "fID", 10, 2),
  FoodItem("food1", "sdfsdfgsdfgdfg", "images/groceries.png", "fCateg",
      "fResturant", "fID", 10, 2),
  FoodItem("food1", "sdfsdfgsdfgdfg", "images/groceries.png", "fCateg",
      "fResturant", "fID", 10, 2),
];
