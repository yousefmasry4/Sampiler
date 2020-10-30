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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      persistentFooterButtons: <Widget>[new Text('Youssef Mohamed El Masry (17101264) Arab Academy for Science, Technology',textAlign: TextAlign.left,
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
                                      '${e.Location.toRadixString(16).toUpperCase()}',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Open Sans',
                                          fontSize: 20))),
                                  DataCell(Text('${e.label_normal== null? "":e.label_normal}',
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
                                  DataCell(Text('${e.operands_normal== null? "":e.operands_normal}',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Open Sans',
                                          fontSize: 20))),
                                  DataCell(Text('test',
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
                              ...util.aa.map((e) => DataRow(
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
