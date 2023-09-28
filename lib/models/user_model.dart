// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserInfoModel {
  String? name;
  String? email;
  String? phone;
  String? roll;
  String? deperment;
  UserInfoModel({
   required this.name,
   required this.email,
  required  this.phone,
   required this.roll,
  required  this.deperment,
  });


  UserInfoModel.fromJson(dynamic json) {
    name = json['name'];
    roll = json['roll'];
    deperment = json['deperment'];
    email = json['email'];
    phone = json['phone'];
    
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['roll'] = roll;
    map['deperment'] = deperment;
    map['phone'] = phone;
 
    return map;
  }
 
}
