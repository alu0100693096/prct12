# Prct09

Clases que permiten gestionar matrices densas o dispersas de forma diferente
para mejorar el uso de la memoria.

La clase Matriz será la interfaz de las clases MatrizDensa y MatrizDispersa,
las cuales son subclases de la clase Matriz e implementan de forma adecuada
las funcionalidades heredadas.

## Instalación

Añadir la siguiente línea al Gemfile de tu aplicación:

    gem 'prct09'

Y luego ejecutar:

    $ bundle

O instálalo manualmente mediante:

    $ gem install prct09

## Uso

Para utilizar esta librería en tu aplicación Ruby, debes incluir el fichero
prct09:

    require 'prct09'

Para colaborar en la escritura del código se deben instalar las dependencias
de la librería. Esto se hace automáticamente ejecutando:

    bundle

En caso de no tener bundle instalado o que la versión sea más antigua, antes
hay que ejecutar:

    gem install bundle

## Contribuir

1. Haz un fork
2. Crea tu rama de características (`git checkout -b my-new-feature`)
3. Haz un commit con tus cambios (`git commit -am 'Add some feature'`)
4. Haz un push de los cambios (`git push origin my-new-feature`)
5. Crea una Pull Request
