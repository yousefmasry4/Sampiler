import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:untitled13/Code/passOne.dart';
import 'package:untitled13/Code/util.dart';

class result extends StatefulWidget {
  result({Key key, this.title}) : super(key: key);

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

class _MyHomePageState extends State<result> {
  int i = 0;

  int get_i() {
    i++;
    return i;
  }


  download(String text){

// prepare
    final bytes = utf8.encode(text.toString());
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'out.txt';
    html.document.body.children.add(anchor);

// download
    anchor.click();

// cleanup
    html.document.body.children.remove(anchor);
    html.Url.revokeObjectUrl(url);

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
      persistentFooterButtons: <Widget>[new Text('Sampiler v1.0.0    Youssef Mohamed El Masry (17101264) Arab Academy for Science, Technology',textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.normal,
              fontFamily: 'Open Sans',
              fontSize: 20))],
      backgroundColor: Color.fromRGBO(8, 10, 28, 1),
      appBar: AppBar(
        title: Text("results",
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
                fontFamily: 'Open Sans',
                fontSize: 40)),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(100,30,100,0),
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              Container(
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.white),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text('Number',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Open Sans',
                                    fontSize: 20)),
                          ),
                          DataColumn(
                            label: Text('Location',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Open Sans',
                                    fontSize: 20)),
                          ),
                          DataColumn(
                            label: Text('Label',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Open Sans',
                                    fontSize: 20)),
                          ),
                          DataColumn(
                            label: Text('Instructions',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Open Sans',
                                    fontSize: 20)),
                          ),
                          DataColumn(
                            label: Text('Reference',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Open Sans',
                                    fontSize: 20)),
                          ),
                          DataColumn(
                            label: Text('Object code',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Open Sans',
                                    fontSize: 20)),
                          ),
                        ],
                        columnSpacing: 50,
                        rows: <DataRow>[
                          ...util.Lines.map((e) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('${get_i()}',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Open Sans',
                                          fontSize: 20))),
                                  DataCell(Text(
                                      '${Util.HexSize(e.Location.toRadixString(16).toUpperCase(),4)}',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Open Sans',
                                          fontSize: 20))),
                                  DataCell(Text('${e.label_normal== null? e.type==false?util.progName:"":e.label_normal}',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Open Sans',
                                          fontSize: 20))),
                                  DataCell(Text('${e.instruction_normal== null? "":e.instruction_normal}',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Open Sans',
                                          fontSize: 20))),
                                  DataCell(Text('${e.operands_normal== null? "":e.operands_normal}${e.have_x==true?",X":""}',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Open Sans',
                                          fontSize: 20))),
                                  DataCell(Text('${e.objCode == null ? "No obj code":e.objCode.toString().toUpperCase() }',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Open Sans',
                                          fontSize: 20))),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(

                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.white),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text('Symbol',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Open Sans',
                                        fontSize: 20)),
                              ),
                              DataColumn(
                                label: Text('Location',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Open Sans',
                                        fontSize: 20)),
                              ),
                            ],
                            columnSpacing: 50,
                            rows: <DataRow>[
                              ...util.aa.sublist(1).map((e) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('${e.name}',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'Open Sans',
                                              fontSize: 20))),
                                      DataCell(Text('${e.loc.toRadixString(16).toUpperCase()}',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'Open Sans',
                                              fontSize: 20))),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        download(util.final_out);
                      },
                      child: Container(
                        width: 700,
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
                            'Download out.txt',
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
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                    width: 700,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.white),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text('HTE RECORDS',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Open Sans',
                                        fontSize: 20)),
                              ),
                            ],
                            columnSpacing: 50,
                            rows: <DataRow>[
                              ...util.final_out.split("\n").map((e) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('$e',
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Open Sans',
                                          fontSize: 20))),

                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
