import 'package:flutter/material.dart';
import 'package:parsedemo2/model/emp_model.dart';
import 'package:parsedemo2/model/emplist_model.dart';
import 'package:parsedemo2/model/user_model.dart';
import 'package:parsedemo2/services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> items = [];
  String data = "";

  void _apiEmpList() {
    Network.GET(Network.API_EMP_LIST, Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiEmpOne(int id) {
    Network.GET(Network.API_EMP_ONE + id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _showResponse(String response) {
    Emplist emplist = Network.parseEmpList(response);
    setState(() {
      items = emplist.data;
      data = response;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = User(id: 1, name: 'Komiljon', salary: '500000', age: '25');
    // _apiEmpList();
    _apiEmpOne(post.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          return itemOfList(items[i]);
        },
      ),
    );
  }

  Widget itemOfList(Employee emp) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            emp.employee_name + "(" + emp.employee_age.toString() + ")",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            emp.employee_salary.toString() + "\$",
            style: TextStyle(color: Colors.black, fontSize: 18),
          )
        ],
      ),
    );
  }
}
