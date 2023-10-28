class UserModel {
  String Fname;
  String Lname;
  String Email;
  String id;

  UserModel(
      {required this.Fname,
      required this.Lname,
      required this.Email,
      required this.id});

  UserModel.fromjson(Map<String, dynamic> json)
      : this(
            Fname: json['Fname'],
            Lname: json['Lname'],
            Email: json['Email'],
            id: json['id']);

  Map<String , dynamic>tojson(){
    return {
      "Fname" : Fname ,
      "Lname" : Lname ,
      "Email" : Email,
      "id" : id
    };
  }
}
