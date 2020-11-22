import 'dart:html';

import 'package:untitled13/Code/Errors.dart';
import 'package:untitled13/Code/util.dart';

class cLine {
  bool type=null; //false if start or end
  String instruction_normal=null;
  String instruction=null;
  int operands=null;
  String operands_normal=null;
  String label=null;
  int Location=null;
  var objCode=null;
  bool have_x=false;

  String label_normal;
  _set_instruction(String inst) {
    instruction_normal = inst;

  }
  //object code


  set_location(int loc){
    Location=loc;
    if(label_normal != null && !util.symTable.keys.contains(label_normal)){
        util.symTable[label_normal]=Location;
    }
  }
  List instructionSplit(String data) => data.split(" ");


  cLine(String Line) {
    err.lin_p();
    List data2 = instructionSplit(Line.trim());
    List data=List();
    data2.forEach((element) {

      if( element.toString().replaceAll(" ", "").isNotEmpty){
        data.add(element);
      }

    });
    print(data);
    if (data.length == 2) {
      data.insert(0, null);
    }
    
    if(data.length <2 ||data.length >=4) {
      err.try_size();

    }else if (data[1].toString().toLowerCase() == "start") {
      type = false;
      this.Location = int.parse(data[2], radix: 16);
      util.startingAddress = this.Location;
      this.instruction_normal = 'start';
      util.symTable[data[0]] = Location;
      util.progName = data[0];
    } else {
      type = true;

      _set_instruction(data[1].toLowerCase());
      operands_normal = data[2].toString().toLowerCase().indexOf('c') == 0?"c'${data[2].toString().substring(2,data[2].toString().length-1)}'":data[2].toLowerCase() ;
      

      if (data[1].toString().toLowerCase() == "end") {

        this.operands_normal = data[2] == util.Lines.first.operands_normal ||
            data[2] == util.Lines[1].label_normal ? util.startingAddress
            .toRadixString(16) : data[2];
        print("                                   ss                   ${this
            .operands_normal}");
      }


      label_normal =data[0] == null?null: data[0].toLowerCase();
      if(operands_normal.indexOf(',') != -1){
        operands_normal=operands_normal.split(",")[0];
        have_x=true;
      }
    }
    if(label_normal == null && instruction_normal != "end") {
        print("                                                   "+instruction_normal);
        err.try_num_alp(operands_normal);
    }
    /*
          if(operands_normal[0]=='c')
      err.try_num_alp(operands_normal.substring(2,operands_normal.length-1));
      else if(operands_normal[0]=='c')
      err.try_num_alp(operands_normal.substring(2,operands_normal.length-1));
      else
        err.try_num_alp(operands_normal);
     */
    err.try_num_alp(label_normal);
    err.try_lang(label_normal);
    err.lang(instruction_normal);

  }

  @override
  String toString() {
    super.toString();
    return "$Location : $label_normal    $instruction_normal   $operands_normal" ;
  }
}
