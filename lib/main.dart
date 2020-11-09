import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:bubble/bubble.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ChatBot'),
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.black87,
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _textController = TextEditingController();
  List<Widget> chat = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            reverse: true,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: chat,
              );
            },
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Card(
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: TextField(
                  controller: _textController,
                  autocorrect: true,
                ),
              ),
            ),
            FlatButton(
              child: CircleAvatar(
                radius: 30,
                child: Icon(Icons.send),
              ),
              onPressed: () {
                setState(() {
                  chat.add(
                    //Bubble(
                    //child: Text(_textController.text),
                    //color: Color.fromARGB(255, 212, 234, 244),
                    //)
                    Text(_textController.text),
                  );
                  _textController.clear();
                  print(chat.length);
                },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
