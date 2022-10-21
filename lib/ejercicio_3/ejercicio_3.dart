import 'dart:html';

// ACLARACIOBN
// En general se DEBE poner cada clase en 1 fichero con el nombre de la clase
// Por ser una prueba y por falta de tiempo, ademas de ser clases vacias no
// lo hago

abstract class Tienda {}

mixin ColorNaranja {}

mixin ColorVerde {}

abstract class Ropa extends Tienda {}

class Gorra extends Ropa with ColorNaranja {}

class Camiseta extends Ropa with ColorVerde {}

abstract class Bicicletas extends Tienda {}

class Mtb extends Bicicletas {}

class Carretera extends Bicicletas {}

abstract class Deportivas extends Tienda {}

class Adidas extends Deportivas {}

class Nike extends Deportivas {}
