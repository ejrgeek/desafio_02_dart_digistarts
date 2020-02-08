import 'dart:io';
import 'package:desafio_dois/binary_calc.dart' as binary_calc;

void main(List<String> arguments) {

  var operation = stdin.readLineSync();
  var first_value = stdin.readLineSync();
  var second_value = stdin.readLineSync();
  var result;

  result = binary_calc.calcBin(operation, first_value, second_value);

  print(result);

}