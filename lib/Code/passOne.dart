import 'package:untitled13/Code/util.dart';

import 'C_lINE.dart';
import 'Errors.dart';
// ignore: camel_case_types
class passOne{

  var str="jo".runtimeType;




  //nwz3 kool satr fe list lw kode tnsho
  passOne(List data){
    data.forEach((element) {
      if(element.toString().indexOf('.') == -1 && element.toString().isNotEmpty && element.toString().trim().length != 0){
        util.Lines.add(cLine(element));

      }
    });
    this.Addresses();
    util.Lines.forEach((element) {
      print(element.toString());
    });
    print("********************************");
    print(util.symTable);
    util.get_small();
    err.lin_0();
    try {
      util.Lines.forEach((element) {
        if (element.instruction_normal == "end" &&
            int.parse(element.operands_normal.trim().toString(), radix: 16) !=
                util.startingAddress) {
          print(
              "saaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaad   ${element
                  .toString()}");
          err.try_var(element.operands_normal);
        } else
          err.try_var(element.operands_normal);
        err.lin_p();
      });
      if (util.progName.length > 6) {
        util.errorsTable.add("programe name is more than 6 digits");
      }
      if (util.Lines.first.instruction_normal.toUpperCase() != "START") {
        util.errorsTable.add("your start position of your program not found");
      }
      if (int.parse(util.Lines.last.operands_normal, radix: 16) != util.startingAddress)
        util.errorsTable.add("your start position of your program not found ");
    }catch(e){
      if (util.Lines.last.instruction_normal.toUpperCase() != "END") {
        util.errorsTable.add("your end position of your program not found  ${util.Lines.last.toString()} ${util.Lines.last.instruction_normal.toUpperCase()} != END");
      }else{

        util.errorsTable.add("enter your code in the structure like it\n\n"
        "HW1 START 1010\n"
            "HW1 START 1010\n"
            "LDA ALPHA\n"
            "STA GAMMA\n"
            "LDA BETA\n"
        "STA ALPHA\n"
        "LDA GAMMA\n"
        "STA BETA\n"
        "ALPHA WORD 100\n"
        "BETA WORD 333\n"
        "GAMMA RESW 1\n"
        "END 101\n"
        );

      }
    }

  }


  //then call it
  // ignore: non_constant_identifier_names
  void Addresses(){
    int currentAddress = util.startingAddress;
    print(currentAddress);
    util.Lines.forEach((element) {

      if(util.errorsTable.isNotEmpty){
        return;
      }
      if(element.type) {
        element.set_location(currentAddress);
        switch(element.instruction_normal){
          case "resb":
            currentAddress += int.parse(element.operands_normal);break; //7nzwed 3add el bit dy 3ad
          case "resw":
            currentAddress += 3 * int.parse(element.operands_normal);break; // 3shan de ward
          case "byte":
            int s=element.operands_normal.substring(2,element.operands_normal.length-1).length;
            print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss    $s    ${element.operands_normal.substring(2,element.operands_normal.length-1)}");
            currentAddress +=element.operands_normal.toString().toLowerCase().indexOf('x') == 0?s/2:s;break;
          default:
            currentAddress +=3;
        }
      }

    });
  }

}