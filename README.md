


<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://sudoai.codes/Sampiler%20sic%20xe/#/">
    <img src="https://miro.medium.com/max/3840/1*68k6w8FfHgrT_H8OTVM1rw.png" alt="Logo">
  </a>

  <h3 align="center">Sampiler</h3>

  <p align="center">
    An awesome a 2-pass SIC Assembler using Flutter.
    <br />
    <a href="https://sudoai.codes/Sampiler%20sic%20xe/#/"><strong>Explore the app »</strong></a>


  </p>







<!-- ABOUT THE PROJECT -->
## About The Project
***Home screen***
![Product Name Screen Shot](https://raw.githubusercontent.com/yousefmasry4/Sampiler/main/sampiler1.png)
***Options***
![Product Name Screen Shot](https://raw.githubusercontent.com/yousefmasry4/Sampiler/main/samp2.png)
***error detection***
![Product Name Screen Shot](https://raw.githubusercontent.com/yousefmasry4/Sampiler/main/samp4.png)
***Output***
![Product Name Screen Shot](https://raw.githubusercontent.com/yousefmasry4/Sampiler/main/samp3.png)
### Built With
* Flutter
* Dart


### Installation


1. Handling Directive ‘BYTE’ with ‘X’ and 'c'
```DART
          case "byte":
            int s=element.operands_normal.substring(2,element.operands_normal.length-1).length;
            currentAddress += element.operands_normal.toString().toLowerCase().indexOf('x') == 0?int.parse((s/2).ceil().toString()):s;break;
```
2. Handling all posible error 
[Errors.dart](https://github.com/yousefmasry4/Sampiler/blob/main/lib/Code/Errors.dart)
4. input formater 
[Code](https://github.com/yousefmasry4/Sampiler/blob/9aca81e4ba4fa7f1b6ff98ccb75fed7d04b321d1/lib/main.dart#L81)
```DART
      String x = result.toString().split(",").last;
      print(result.toString().split("/")[0].split(":")[1]);
```

[input formater part 2](https://github.com/yousefmasry4/Sampiler/blob/9aca81e4ba4fa7f1b6ff98ccb75fed7d04b321d1/lib/Code/C_lINE.dart#L36)
```DART
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
```





<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/yousefmasry4/Sampiler/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Yousseff El Masry - [linkedin](https://www.linkedin.com/in/yousseff-el-masry-9346a6156/) - youssefmasry04@gmail.com






