import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sampiler',
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Sampiler'),
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
  int _counter = 0;

  int z_lines = 5;
  var soso;
  String sayo="";
  List<int> _selectedFile;
  Uint8List _bytesData;
  GlobalKey _formKey = new GlobalKey();
  TextEditingController in_cont = new TextEditingController();





  void _handleResult(Object result) {
    setState(() {
      String x=result.toString().split(",").last;
      print(result.toString().split("/")[0].split(":")[1]);
      if(result.toString().split("/")[0].split(":")[1] != "text"){
        showDialog(
            barrierDismissible: false,
            context: context,
            child: new AlertDialog(
              title: new Text("Error"),
              //content: new Text("Hello World"),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: [
                    new Text("Select only text files"),
                  ],
                ),
              ),
              actions: [
                new FlatButton(
                  child: new Text('ok'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
      }else {
        _bytesData = base64.decode(x);
        print(_bytesData[0]);
        String s = new String.fromCharCodes(_bytesData);
        z_lines=null;
        sayo = s;
        in_cont.text = sayo;
        _selectedFile = _bytesData;
      }
    });
  }

  startWebFilePicker() async {
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();
    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      final file = files[0];
      final reader = new html.FileReader();
      reader.onLoadEnd.listen((e) {
        _handleResult(reader.result);
      });
      reader.readAsDataUrl(file);
      print(reader.result.toString());

    });


  }




  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color.fromRGBO(8,10,28,1),
      appBar: AppBar(
        title: Text("Sampiler",style :TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
            fontFamily: 'Open Sans',
            fontSize: 40)),
      ),
      body: ListView(
          children: <Widget>[
            Stack(
             children: [
               TextFormField(

                 onTap: (){
                   setState(() {
                     z_lines=null;
                   });
                 },
                 controller: in_cont,
                 onChanged: (data){
                   setState(() {
                     soso=data.split("\n");
                   });
                 },
                 minLines: 5,
                 maxLines: z_lines,
                 autofocus: false,
                 cursorColor: Colors.amber,
                 style: TextStyle(color: Colors.white,fontSize: 25),
                 decoration: InputDecoration(

                   hintText: 'Write your Code here  OR  ',
                   hintStyle: TextStyle(color: Colors.grey,fontSize: 25),
                   filled: true,
                   fillColor: Colors.black87,
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                     borderSide: BorderSide(color: Colors.white38),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                     borderSide: BorderSide(color: Colors.grey),
                   ),
                 ),
               ),
               Visibility(child: Padding(padding: EdgeInsets.fromLTRB(310, 10, 0, 0),
               child: GestureDetector(
                 onTap: () {
                   startWebFilePicker();
                 },
                 child: Container(
                   width: 200,
                   height: 50,
                   decoration: BoxDecoration(
                     gradient: LinearGradient(
                       colors: [
                         Colors.blue,
                         Colors.black54,
                       ],
                       begin: Alignment.topLeft,
                       end: Alignment.bottomRight,
                     ),
                     borderRadius: BorderRadius.circular(20),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black12,
                         offset: Offset(5, 5),
                         blurRadius: 10,
                       )
                     ],
                   ),
                   child: Center(
                     child: Text(
                       'Select File',
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 30,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                   ),
                 ),
               ),
               ),
                 visible: in_cont.text.length == 0,
               )
             ],
            )

          ],
        ),
      floatingActionButton: FloatingActionButton(
       // onPressed: startWebFilePicker,
        tooltip: 'Run',
        child: Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
