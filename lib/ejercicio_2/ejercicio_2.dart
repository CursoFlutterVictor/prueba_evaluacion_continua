import 'dart:io';

void ejercicio_2() {
  stdout.writeln("Introduzca su nota:");
  double? nota = double.tryParse(stdin.readLineSync() ?? '0.0') ?? 0.0;

  double notaCorte = 9.73;

  if (nota >= notaCorte) {
    stdout.writeln("Entra en la universidad");
  } else {
    stdout.writeln("Lo siento, no puede entrar a la universidad");
  }
}
