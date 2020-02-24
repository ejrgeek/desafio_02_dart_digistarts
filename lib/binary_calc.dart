int _convertBinToDec(String value){
  var newValue = '0';
  if (value.isNotEmpty){
    newValue = int.parse(value, radix: 2).toRadixString(10);
  }
return int.parse(newValue);
}

/// Metodo responsavel por converter de decimal para binario
String _convertDecToBin(String value){
  var newValue = '0';
  var newBinaryNumber = '0';

  if (value != null){
    print(value);
    newValue = int.parse(value, radix: 10).toRadixString(2);
  }

  if (newValue.length < 8 ){
    newBinaryNumber = '0'*(8-newValue.length);
    newBinaryNumber += newValue;
  }

  return newBinaryNumber;
}


/// Metodo responsavel para verificar se o valor está entre 0 e 255 ou um deles
bool _verifyValue(int value){
  var status = false;
  if (value >= 0 || value <= 255){
    status = true;
  }
  return status;
}

/// Metodo responsavel por controlar todo o modulo de conversao 
String calcBin(String operation, String firstValue, String secondValue){

  var newFirstValue = _convertBinToDec(firstValue);
  var newSecondValue = _convertBinToDec(secondValue);
  var result = 0;

  if ( _verifyValue(newFirstValue) && _verifyValue(newSecondValue) && firstValue.isNotEmpty && secondValue.isNotEmpty){

    switch (operation){
      
      case '+':
        result = newFirstValue + newSecondValue;
        break;
      
      case '-':
        result = newFirstValue - newSecondValue;
        break;
      
      case '*':
        result = newFirstValue * newSecondValue;
        break;

      case '/':
        result = (newFirstValue / newSecondValue).round();
        break;

      case '%':
        result = (newFirstValue % newSecondValue).round();
        break;
      default:
        break;
    }

  }

return _convertDecToBin(result.toString());

}