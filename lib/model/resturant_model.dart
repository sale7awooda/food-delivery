
class ResturantModel {
String? rname;
String? rowner;
//String? rpass;
String? rloc;
String? rdetial;
String? rimgURL;
String? rID;

  ResturantModel({
    required this.rname,
    required this.rowner,
   // required this.rpass,
    required this.rloc,
    required this.rdetial,
     this.rimgURL,
     this.rID
  });



  Map<String, dynamic> toMap() {
    return {
      'rname': rname,
      'rowner': rowner,
    //  'rpass': rpass,
      'rloc': rloc,
      'rdetial': rdetial,
      'rimg': rimgURL!,
    };
  }
}