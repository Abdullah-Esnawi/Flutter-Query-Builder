class User {
  String? firstName;
  String? lastName;
  String? fullName;
  int? id;
  String? gender;
  int? age;
  User({
    this.firstName,
    this.lastName,
    this.id,
    this.fullName,
    this.gender,
    this.age,
  });

   User.fromJson(Map<String, dynamic> json) {

      id= json['id'];
      firstName= json['firstName'];
      lastName= json['lastName'];
      fullName= json['fullName'];
      gender= json['gender'];
      age= json['age'];
 
  }
}
