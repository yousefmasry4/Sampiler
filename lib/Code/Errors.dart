import 'package:untitled13/Code/util.dart';

class errors{
  int line=0;
  lin_p(){
    line+=1;
  }
  lin_0(){
    line=0;
  }
  String err_line(){
    return "compilation error Line $line";
  }
  try_num_alp(String element){
    if(element == null)
      return;
    if(element[0]=='c')
      element=err.try_num_alp(element.substring(2,element.length-1));
    else if(element[0]=='x')
      element=err.try_num_alp(element.substring(2,element.length-1));

    String firstLetter = element[0];
    if (double.tryParse(firstLetter) != null || int.tryParse(element, radix: 16) != null) {
      print(element);

      //TODO : error msmy 8alat
      util.errorsTable.add(err_line());
      util.errorsTable.add("    error at $element");

    }
  }
  try_lang(String element){
    if(element == null)
      return;
    if(util.opTable.containsKey(element) == true){
      //ToDo : error st5dm esm 8alat
      util.errorsTable.add(err_line());
      util.errorsTable.add("    you can't use $element");
    }else if(element == 'resb' || element == 'resw' || element == 'byte' || element == 'start' || element == 'end'){
      //ToDo : error st5dm esm 8alat
      util.errorsTable.add(err_line());
      util.errorsTable.add("    you can't use $element");
    }
  }
  lang(String element){
    if(element == null)
      return;
    if(util.opTable.containsKey(element) == false && (element != 'word' && element != 'resb' && element != 'resw' && element != 'byte' && element != 'start' && element != 'end')){
      //ToDo : error st5dm esm 8alat
      util.errorsTable.add(err_line());
      util.errorsTable.add("*    you can't use as instruction $element");
    }else if (element != 'resb' || element != 'word' || element != 'resw' || element != 'byte' || element != 'start' || element != 'end'){
      print("jo");
    }else{
      //ToDo : error st5dm esm 8alat
      util.errorsTable.add(err_line());
      util.errorsTable.add("    you can't use $element as instruction ");
    }
  }
  try_size(){
    //ToDo : size error
    util.errorsTable.add(err_line());
    util.errorsTable.add("    error in instruction");
  }

  try_var(String element){

    if(element == null)
      return;
    element=element.trim();
    print("sss"+element);
    if(element.indexOf('c')==0)
      element=element.substring(2,element.length-1);
    else if(element.indexOf('x')==0)
      element=element.substring(2,element.length-1);

    print("zzzzzzzzzzzzzzzz"+element);
    if(int.tryParse(element, radix: 16) == null){
      print("$element is not hex");
      if(element.indexOf(',') != -1){
        element=element.split(",")[0];
      }
      if(util.symTable.containsKey(element)  == true){
        if (double.tryParse(element[0]) != null ) {
          print(element);

          //TODO : error msmy 8alat
          util.errorsTable.add(err_line());
          util.errorsTable.add("*    error at $element");

        }
      }else{
        util.errorsTable.add(err_line());
        util.errorsTable.add("    error at $element");
      }
    }else{
      print("$element is        hex");

    }
  }
}
errors err=errors();