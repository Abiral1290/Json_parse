import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';


Future<List<Todolist>> fetchtodolist(http.Client http) async{
  final response = await http.get("https://jsonplaceholder.typicode.com/todos");
  return compute(parseTodolist, response.body);
}

class Todolist {
  int userid;
  int id;
  String title;
  String completed;

   Todolist({this.userid, this.id, this.title, this.completed});

   factory Todolist.fromJson(Map<String, dynamic> json){
     return Todolist(
       userid: json["userid"] as int,
       id: json["id"] as int,
       title: json["title"] as String,
       completed: json["commpleted"] as String
     );
   }
}

List<Todolist> parseTodolist(String reponsebody){
  final parsed = json.decode(reponsebody).cast<Map<String,dynamic>>();

  return parsed.map<Todolist>((json) => Todolist.fromJson(json)).toList();
}

class Json_Parse extends StatelessWidget{
  String title;
  Json_Parse({Key key, this.title}): super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder<List<Todolist>>(
        future: fetchtodolist(http.Client()),
        builder: (context,snapshot){
          if(snapshot.hasError)  print(snapshot.error);
              return snapshot.hasData
                  ? Todolists(todolist: snapshot.data)
                  :Center(child: CircularProgressIndicator());
    },
      ),
    );
  }
}

class Todolists extends StatelessWidget{
  final List<Todolist> todolist;

  const Todolists({Key key, this.todolist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build 
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: todolist.length,
        itemBuilder: (context, snapshot){
        return ListTile(
          title: Text(todolist[snapshot].title),
          subtitle: Text(todolist[snapshot].title),
          onTap: () async{
            final url = "https://www.google.com/search?q=commentcount+flutter&oq=commentcount+flu&aqs=chrome.1.69i57j33.11346j0j9&sourceid=chrome&ie=UTF-8";
            if(await canLaunch(url)){
              launch(url);
            }

          },

        );
    }
        );
  }
}