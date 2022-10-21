import 'dart:io';
import 'package:prueba_evaluacion_continua/ejercicio_1/meses.dart';

void ejercicio_1() {
  // Pedimos el mes hasta que introduzca un mes valido (1 a 12)
  int mes = 0;

  do {
    stdout.writeln("Introduzca el mes del año (1 a 12): ");

    mes = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

    if (mes < 1 || mes > 12) {
      stdout.writeln("Mes incorrecto...");
    }
  } while (mes < 1 || mes > 12);

  // Para escribir el nombre del mes apartir del nº uso "values.elementAt.name"
  stdout.writeln(
      "Mes seleccionado: $mes : ${Meses.values.elementAt(mes - 1).name}");

  // Calculamos la cantidad de dias del mes.
  // Para calcular los dias en un mes lo ideal seria usar date_util 0.1.4
  // https://pub.dev/packages/date_util usariamos daysInMonth

  // Hago chapucilla con enums y algo aproximado con switch case
  Meses mesEnum = Meses.values.elementAt(mes - 1);
  int diasMes = 0;

  switch (mesEnum) {
    // Asumo febrero con 28 dias, pero podria usar un bolBisiesto
    case Meses.febero:
      diasMes = 28;
      break;

    // Meses de 31 dias
    case Meses.enero:
    case Meses.marzo:
    case Meses.mayo:
    case Meses.julio:
    case Meses.agosto:
    case Meses.octubre:
    case Meses.diciembre:
      diasMes = 31;
      break;

    // Meses de 30 dias
    case Meses.abril:
    case Meses.junio:
    case Meses.septiembre:
    case Meses.noviembre:
      diasMes = 30;
  }

  stdout.writeln("${Meses.values.elementAt(mes - 1).name} tiene $diasMes dias");

  // Pedimos la cantidad de dias que ha faltado.
  stdout.writeln("Introduzca el numero de faltas de asistencia:");
  int? faltas = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  // Calculo el porcentaje
  // % faltas = (faltas de asistencia / total dias mes) x 100.

  double porcentajeAusencia = (faltas / diasMes) * 100;
  double porcentajeAsistencia = 100 - ((faltas / diasMes) * 100);
  print("Ausencia: $porcentajeAusencia %");
  print("Asistencia: $porcentajeAsistencia %");

  // En funcion del porcentaje, saco un mensaje u otro
  /*
  Si un empleado tiene más del 25% de faltas en el trabajo en un mes está despedido 
  Si el empleado tiene el 100% de asistencia en un mes será bonificado
  Si cuenta con más del 75% de asistencia en un mes mantendrá su sueldo.
  */
  if (porcentajeAusencia > 25.0) {
    stdout.writeln("Empleado DESPEDIDO!!!");
  } else if (porcentajeAsistencia > 75.0) {
    stdout.writeln("Empleado mantiene su sueldo.");
    if (porcentajeAsistencia == 100.0) {
      stdout.writeln("Empleado ademas recibe un BONUS!!!");
    }
  }
}
