import 'package:test/test.dart';

void main() {
  
  int _convertBinToDec(String value){
    var new_value = int.parse(value, radix: 2).toRadixString(10);
    return int.parse(new_value);
  }

  String _convertDecToBin(String value){
    var new_value = int.parse(value, radix: 10).toRadixString(2);
    var new_binary_number;

    if (new_value.length < 8 ){
      new_binary_number = '0'*(8-new_value.length);
      new_binary_number += new_value;
    }

    return new_binary_number;
  }

  bool _verifyValue(int value){
    return true ? value >= 0 || value <= 255 : false;
  }


  String calcBin(String operation, String first_value, String second_value){

    var new_first_value = _convertBinToDec(first_value);
    var new_second_value = _convertBinToDec(second_value);
    var result;

    if ( _verifyValue(new_first_value) && _verifyValue(new_second_value) ){

      switch (operation){
        
        case '+':
          result = new_first_value + new_second_value;
          break;
        
        case '-':
          result = new_first_value - new_second_value;
          break;
        
        case '*':
          result = new_first_value * new_second_value;
          break;

        case '/':
          result = (new_first_value / new_second_value).round();
          break;

        case '%':
          result = (new_first_value % new_second_value).round();
          break;
        default:
          break;
      }

    }

    return _convertDecToBin(result.toString());

  }

  test('soma dos binarios', (){
    expect(calcBin('+', '000000001', '00000011'), equals('00000100'));
  });

  test('subtração dos binarios', (){
    expect(calcBin('-', '00000010', '00000001'), equals('00000001'));
  });

  test('multiplicação dos binarios', (){
    expect(calcBin('*', '00000001', '00000011'), equals('00000011'));
  });

  test('divisão dos binarios', (){
    expect(calcBin('/', '01100100', '00000010'), equals('00110010'));
  });

  test('resto dos binarios', (){
    expect(calcBin('%', '00010100', '00000011'), equals('00000010'));
  });

}