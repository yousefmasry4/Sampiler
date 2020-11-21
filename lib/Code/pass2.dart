import 'package:flutter/material.dart';
import 'package:untitled13/Code/util.dart';

class Pass2 {

  Pass2() {
    util.Lines.forEach((e) {
      if (e.type == false) {
        e.objCode = null;
        e.instruction = null;
      } else if (util.opTable.containsKey(e.instruction_normal)) {
        e.instruction = util.opTable[e.instruction_normal];


        // get address

        e.operands = int.parse(util.symTable[e.operands_normal].toString()); //from hex to int

        // if indexing is used add value of 'x' bit to address

        if (e.have_x) {
          e.operands += int.parse("8000", radix: 16);
        }
        //calculate object code
        e.objCode = e.instruction +Util.HexSize( e.operands.toRadixString(16),4);
      }

      // handle 'WORD' & 'BYTE'
      switch (e.instruction_normal) {
        case 'word':
          e.objCode =
              int.parse(e.operands_normal).toRadixString(16);
          break;
        case "byte":
          switch (e.operands_normal[0]) {
            case 'x':
              e.objCode = x_c_code(e.operands_normal);
              break;
            case 'c':
              e.objCode = "";
              x_c_code(e.operands_normal).runes.forEach((c) {
                e.objCode += c.toString().codeUnitAt(0).toRadixString(16);
              });
              break;
          }
          break;
      }
    });
  }



  String x_c_code(String c) => c.substring(2, c.length-1);


  void writeObjFile() {
    util.startingAddress = Util.HexSize(util.startingAddress.toRadixString(16), 6);

    //calculate length of program
    print(util.startingAddress);
    print(util.progName);
    util.lengthOfProg =
        (util.Lines.last.Location - util.Lines.first.Location).toRadixString(
            16);
    print(util.lengthOfProg);

    util.final_out += "H." + util.progName +'x'*(6-util.progName.length)+"." + Util.HexSize(util.startingAddress,6) + "." +
        Util.HexSize(util.lengthOfProg,6)+ "\n";

    this.writeTextRecord();
    util.final_out+="E."+Util.HexSize(util.startingAddress,6);
  }


  writeTextRecord() {
    var temp_code = "";
    int i =1;
    var element = util.Lines;
    var s_element = util.Lines[0];
    int len=0;
    while(true) {
      if(i  >=  util.Lines.length) break;
      //calc len;
      if(element[i].objCode != null )
      len = (i + 1 == util.Lines.length
          ? element[i].Location
          : element[i + 1].Location )- s_element.Location;



      //stope when
      if (element[i].objCode == null   || len > 30) {


        print("${i + 1 == util.Lines.length
            ? element[i].Location
            : element[i + 1].Location }   -   ${s_element.Location}="+len.toString());


        if(element[i-1].objCode != null )
        util.final_out+= "T.${Util.HexSize(
            s_element.Location.toRadixString(16), 6)}.${Util.HexSize(
            len > 30?(
                element[i].Location - s_element.Location
            ).toRadixString(16):len.toRadixString(16), 2)}$temp_code\n";
        if(len > 30)
          i--;
        //update start line
        s_element = i + 1 == util.Lines.length ? null : util.Lines[i + 1];

        //clear old code
        temp_code = "";

      }else if(element[i].objCode != null){
        temp_code+=".${Util.HexSize(element[i].objCode, 6)}";
      }
      i++;
    }
  }
}