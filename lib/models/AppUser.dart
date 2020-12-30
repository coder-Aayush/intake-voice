class AppUser {
  String uid;
  String name;
  String email, img;

  AppUser({this.uid, this.name, this.email, this.img});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['uid'] = uid;
    map['name'] = name;
    map['email'] = email;
    map['img'] = img;
    return map;
  }

  static AppUser fromMap(var user) {
    return AppUser(
        name: user['name'] ?? "sid",
        email: user['email'] ?? "sid@sdism.com",
        uid: user['uid'] ?? "dfgyhuighfhjkl",
        img: user['img']);
  }
}
