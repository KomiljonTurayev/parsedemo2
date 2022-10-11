import 'package:parsedemo2/model/emp_model.dart';

class Emplist {
  late String status;
  late String message;
  late List<Employee> data;

  Emplist.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = List<Employee>.from(
            json["data"].map((x) => Employee.fromJson(x)));

  Map<String,dynamic> toJson() =>{
    "status" :status,
    "message":message,
    "data" : List<dynamic>.from(data.map((x) => x.toJson()))
  };

}
