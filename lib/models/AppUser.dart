class AppUser {
  String uid;

  AppUser({this.uid});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['uid'] = uid;
    return map;
  }

  static AppUser fromMap(var user) {
    return AppUser(
      uid: user['uid'] ?? "dfgyhuighfhjkl",
    );
  }
}
