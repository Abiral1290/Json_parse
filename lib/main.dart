import 'package:flutter/material.dart';
import 'package:eleventh_app/second_page.dart';
import 'package:eleventh_app/json_parse.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
          children: <Widget>[
          Container(
            height: 800.0,
            width: 400.0,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [BoxShadow(
                color: Colors.blueGrey,
                blurRadius: 15.0
              ),],
              gradient: LinearGradient(
                colors: [Colors.blue],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),

          ),
          Positioned(
            top: 100.0,
            child: Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [BoxShadow(
                  color: Colors.amber,
                  blurRadius: 15.0,
                )]
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter A Text',
                  suffix: RaisedButton(onPressed: Submit,

                  )
                ),
                controller: _textEditingController,

              ),
            ),
          ),
            Positioned(
              top: 200.0,
              child: Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [BoxShadow(
                      color: Colors.amber,
                      blurRadius: 15.0,
                    )]
                ),
                child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Json_Parse()));
                    })
              ),
            )
            ]
            ),);
  }
  void Submit(){
    String string = _textEditingController.text;
    Navigator.push(context, MaterialPageRoute(builder: (context) => Second_page(title: string,)));
  }
}
