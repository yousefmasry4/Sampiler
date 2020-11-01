import 'package:untitled13/Code/Errors.dart';

import 'C_lINE.dart';

class Util{
  var opTable = {
    "add": "18",
    "and": "40",
    "comp": "28",
    "div": "24",
    "j": "3c",
    "jeq": "30",
    "jgt": "34",
    "jlt": "38",
    "jsub": "48",
    "lda": "00",
    "ldch": "50",
    "ldl": "08",
    "ldx": "04",
    "mul": "20",
    "or": "44",
    "rd": "d8",
    "rsub": "4c",
    "sta": "0c",
    "stch": "54",
    "stl": "14",
    "stx": "10",
    "sub": "1c",
    "td": "e0",
    "tix": "2c",
    "wd": "dc"
  };
  var symTable = {};
  List aa=List();
  List<cLine> Lines=List();
  List linesListWithData =List();
  List errorsTable = List();
  var startingAddress;
  String progName;
  String final_out="";
  String lengthOfProg;
  var Temp;
  void reset(){
    err.lin_0();
    progName=null;
    lengthOfProg=null;
    final_out="";
    linesListWithData.clear();
    Lines=List();
    aa=List();
    symTable={};
    errorsTable=List();
    startingAddress=0;
    Temp=null;
  }

  List get_small(){
    symTable.forEach((key, value) {
      aa.add(ab(key,value));
    });

  }
  List get_err()=>errorsTable;
}
class ab{
  int loc;
  String name;

  ab(this.name, this.loc);
}
Util util=Util();