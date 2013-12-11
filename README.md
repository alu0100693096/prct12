# Prct12

- Estado actual de construcción de la gema: [![Build Status](https://travis-ci.org/alu0100700459/prct12.png?branch=master)](https://travis-ci.org/alu0100700459/prct12)
- Estado actual de las dependencias de la gema: [![Dependency Status](https://gemnasium.com/alu0100700459/prct12.png)](https://gemnasium.com/alu0100700459/prct12)

Clases que permiten gestionar matrices densas o dispersas de forma diferente
para mejorar el uso de la memoria.

La clase Matriz será la interfaz de las clases MatrizDensa y MatrizDispersa,
las cuales son subclases de la clase Matriz e implementan de forma adecuada
las funcionalidades heredadas.

## Instalación

Añadir la siguiente línea al Gemfile de tu aplicación:

    gem 'prct12'

Y luego ejecutar:

    $ bundle

O instálalo manualmente mediante:

    $ gem install prct12

## Uso

### Librería

Para utilizar esta librería en tu aplicación Ruby, debes incluir el fichero
prct12:

    require 'prct12'

Para colaborar en la escritura del código se deben instalar las dependencias
de la librería. Esto se hace automáticamente ejecutando:

    bundle

En caso de no tener bundle instalado o que la versión sea más antigua, antes
hay que ejecutar:

    gem install bundle

Para utilizar las clases MatrizDensa y MatrizDispersa para los tipos de datos que necesites, debes hacer tu propia
clase y que implemente el método `zero` que devuelva el valor 0 de ese tipo de dato. Ejemplo:

```ruby
require "prct12"
class MatrizDensaEnteros < Prct12::MatrizDensa
  def zero
    0
  end
end
```

### DSL

Esta librería viene también con un DSL específico que permite definir operaciones entre matrices con más facilidad.
Para ello, la sintaxis es la siguiente:

```ruby
test = Prct12::MatrizDSL(MatrizDensaEnteros) do
  operacion <nombre_operacion>
  [salida <nombre_salida> [<nombre_fichero>]]*
  [operando <definicion_operando>]*
end
```

`<nombre_operacion> = Prct12::TipoOperacion::{SUMA | RESTA | MULTIPLICACION | NINGUNA}`
`<nombre_salida> = Prct12::TipoSalida::{CONSOLA | FICHERO | NINGUNA}`
`<definicion_operando> = Array de Array. Ej: [[1,2,3], [4,5,6]]`

- Si se especifican varias operaciones, tendrá validez la última que aparezca.
- Se pueden especificar varias salidas o ninguna, pero si se especifica `Prct12::TipoSalida::NINGUNA`, las demás se invalidan.
- Se pueden especificar tantos operandos como se deseen.

## Contribuir

1. Haz un fork
2. Crea tu rama de características (`git checkout -b my-new-feature`)
3. Haz un commit con tus cambios (`git commit -am 'Add some feature'`)
4. Haz un push de los cambios (`git push origin my-new-feature`)
5. Crea una Pull Request
