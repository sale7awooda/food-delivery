import 'dart:convert';

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

  factory ResturantModel.fromMap(Map<String, dynamic> map) {
    return ResturantModel(
      rname: map['rname'] ?? '',
      rowner: map['rowner'] ?? '',
      rpass: map['rpass'] ?? '',
      rloc: map['rloc'] ?? '',
      rdetial: map['rdetial'] ?? '',
      rimg: map['rimg'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ResturantModel.fromJson(String source) => ResturantModel.fromMap(json.decode(source));
}
