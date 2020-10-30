import 'dart:html';

import 'package:untitled13/Code/util.dart';

class cLine {
  bool type=null; //false if start or end
  String instruction_normal=null;
  String instruction=null;
  String operands=null;
  String operands_normal=null;
  String label=null;
  int Location=null;

  String label_normal;
  _set_instruction(String inst) {
    instruction_normal = inst;
    try {
      instruction = util.opTable[inst];
    } catch (e) {
      instruction = null;
    }
  }
  //object code


  set_location(int loc){
    Location=loc;
    if(label_normal != null && !util.symTable.keys.contains(label_normal)){
        util.symTable[label_normal]=Location;
    }
  }
  List instructionSplit(String data) => data.toLowerCase().split(" ");
  cLine(String Line) {
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
    if (data[1] == "start") {
      type = false;
      this.Location = int.parse(data[2], radix: 16);
      util.startingAddress = this.Location;
    } else {
      type = true;
      _set_instruction(data[1]);
      operands_normal = data[2];
      label_normal = data[0];

    }
  }

  @override
  String toString() {
    super.toString();
    return "$Location : $label_normal    $instruction_normal   $operands_normal" ;
  }
}
