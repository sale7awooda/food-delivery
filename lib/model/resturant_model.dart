
class ResturantModel {
String? rname;
String? rowner;
bool? rStatus;
String? rloc;
String? rdetial;
String? rimgURL;
String? rID;

  ResturantModel({
    required this.rname,
    required this.rowner,
    this.rStatus,
    required this.rloc,
    required this.rdetial,
     this.rimgURL,
     this.rID
  });



  Map<String, dynamic> toMap() {
    return {
      'rname': rname,
      'rowner': rowner,
      'rstatus': rStatus,
      'rloc': rloc,
      'rdetial': rdetial,
      'rimg': rimgURL!,
    };
  }
}