import 'package:untitled13/Code/util.dart';

import 'C_lINE.dart';

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
  }


  //then call it
  void Addresses(){
    int currentAddress = util.startingAddress;
    print(currentAddress);
    util.Lines.forEach((element) {
      if(element.type) {
        element.set_location(currentAddress);
        switch(element.instruction_normal){
          case "resb":
            currentAddress += int.parse(element.operands_normal);break; //7nzwed 3add el bit dy 3ad
          case "resw":
            currentAddress += 3 * int.parse(element.operands_normal);break; // 3shan de ward
          case "byte":
            currentAddress += element.operands_normal.substring(2,element.operands_normal.length).length;break;
          default:
            currentAddress +=3;
        }
      }
    });
  }

}