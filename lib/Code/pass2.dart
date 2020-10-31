import 'package:untitled13/Code/util.dart';

class Pass2{

  Pass2(){
    util.Lines.forEach((e) {
      if (e.type == false){
        e.objCode=null;
        e.instruction = null;


      }else if(util.opTable.containsKey(e.instruction_normal)){
          e.instruction = util.opTable[e.instruction_normal];


          // get address

          e.operands=int.parse(util.symTable[e.operands_normal] , radix: 16); //from hex to int

          // if indexing is used add value of 'x' bit to address

          if(e.have_x){
            e.operands += int.parse("8000", radix: 16);
          }
          //calculate object code
          e.objCode=e.instruction+e.operands.toRadixString(16);


      }

      // handle 'WORD' & 'BYTE'
      switch(e.instruction_normal) {
        case 'word':
          e.objCode =
              HexSize(int.parse(e.operands_normal).toRadixString(16), 6);
          break;
        case "byte":
          switch(e.operands_normal[0]){
            case 'x':
              e.objCode=x_c_code(e.operands_normal);
              break;
            case 'c':
                e.objCode="";
                x_c_code(e.operands_normal).runes.forEach((c) {
                  e.objCode +=c.toString().codeUnitAt(0).toRadixString(16);
              });
              break;
          }
          break;
      }


    });
  }
  String HexSize(h,limit)=>"0"*(limit-h.toString().length)+h.toString();
  String x_c_code(String c)=>c.substring(2,c.length);
}