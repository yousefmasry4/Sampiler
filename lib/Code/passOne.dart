import 'package:untitled13/Code/util.dart';

import 'C_lINE.dart';
import 'Errors.dart';
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
    util.Lines.forEach((element) {
      if(element.instruction_normal=="end" && int.parse( element.operands_normal.trim().toString(), radix: 16) != util.startingAddress){
        print("saaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaad   ${element.toString()}");
        err.try_var(element.operands_normal);
      }else
      err.try_var(element.operands_normal);
      err.lin_p();
    });

  }


  //then call it
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
            currentAddress += element.operands_normal.toString().toLowerCase().indexOf('x') == 0?int.parse((s/2).ceil().toString()):s;break;
            //done
          default:
            currentAddress +=3;
        }
      }

    });
  }

}