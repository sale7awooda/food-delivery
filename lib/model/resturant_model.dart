
class ResturantModel {
String? rname;
String? rowner;
String? rpass;
String? rloc;
String? rdetial;
String? rimg;
String? rID;

  ResturantModel({
    required this.rname,
    required this.rowner,
    required this.rpass,
    required this.rloc,
    required this.rdetial,
     this.rimg,
     this.rID
  });



  Map<String, dynamic> toMap() {
    return {
      'rname': rname,
      'rowner': rowner,
      'rpass': rpass,
      'rloc': rloc,
      'rdetial': rdetial,
      'rimg': rimg!,
    };
  }
}