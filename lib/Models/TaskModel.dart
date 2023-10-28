class TaskModel {
  String Id;
  String Title;
  String Description;
  int Date;
  bool Isdone;
  String UserId;

  TaskModel(
      {this.Id = "",
      required this.Title,
      required this.Description,
      required this.Date,
        required this.UserId,
      this.Isdone = false});

  TaskModel.fromjson(Map<String, dynamic> json)
      : this(
            Title: json['title'],
            Description: json['Description'],
            Date: json['date'],
            Isdone: json['Isdone'],
            Id: json['Id'] ,
              UserId: json['UserId']);


  Map<String,dynamic>tojson(){
    return {
      "title": Title,
      "Description": Description,
      "date": Date,
      "Isdone": Isdone,
      "Id": Id,
      "UserId" : UserId
    };
  }
// fromjson(Map<String, dynamic> json) {
//   return TaskModel(
//       Title: json['title'],
//       Description: json['Description'],
//       Date: json['date'],
//       Isdone: json['Isdone'],
//       Id: json['Id']);
// }
}
