class UserLogin {
  List<TechnicalList> technicalList;

  UserLogin({this.technicalList});

  UserLogin.fromJson(Map<String, dynamic> json) {
    if (json['technicalList'] != null) {
      technicalList = new List<TechnicalList>();
      json['technicalList'].forEach((v) {
        technicalList.add(new TechnicalList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.technicalList != null) {
      data['technicalList'] =
          this.technicalList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TechnicalList {
  String idTech;

  TechnicalList({this.idTech});

  TechnicalList.fromJson(Map<String, dynamic> json) {
    idTech = json['idTech'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idTech'] = this.idTech;
    return data;
  }
}
