require "prct12/matriz"

module Prct12

# Módulo que agrupa los símbolos que identifican las distintas operaciones que
# se pueden realizar entre matrices.
module TipoOperacion
  SUMA =            :suma
  RESTA =           :resta
  MULTIPLICACION =  :multiplicacion
  DIVISION =        :division
  NINGUNA =         :ninguna
end

# Módulo que agrupa los símbolos que identifican los distintos medios por los
# que se reproducirá el resultado de la operación.
module TipoSalida
  CONSOLA = :consola
  FICHERO = :fichero
  NINGUNA = :ninguna
end

# Clase que permite definir un DSL para la manipulación de matrices.
class MatrizDSL

  # El constructor. Permite definir el tipo de matriz que se va a crear y sus
  # características. Un ejemplo de instanciación de la clase MatrizDSL sería:
  #
  # class MatrizDensaFixnum < Prct12::MatrizDensa
  #   def zero
  #     0
  #   end
  # end
  #
  # matriz = Prct12::MatrizDSL(MatrizDensaFixnum) do
  #   operacion Prct12::TipoOperacion::SUMA
  #   salida Prct12::TipoSalida::FICHERO, "salida.txt"
  #   operando [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  #   operando [[9, 8, 7], [6, 5, 4], [3, 2, 1]]
  # end
  def initialize(tipo_matriz, &bloque)
    if !(tipo_matriz.is_a? Class)
      raise ArgumentError, "Se esperaba que el tipo del argumento fuera una clase"
    end

    @tipo = tipo_matriz
    @op = TipoOperacion::NINGUNA
    @out = []
    @mats = []

    instance_eval(&bloque)
  end

  # Indica la operación a realizar. Si se especifica varias veces, prevalece la
  # última.
  def operacion(tipo_operacion)

    # Recorremos el Array de constantes del módulo TipoOperacion y si hay algún
    # símbolo que tiene el mismo valor, es que se ha introducido un valor
    # válido y lo podemos asignar.
    TipoOperacion.constants.each do |x|
      if(TipoOperacion.const_get(x) == tipo_operacion)
        @op = tipo_operacion
        return
      end
    end

    # Si el valor no es válido, lo indicamos lanzando una excepción
    raise ArgumentError, "Se esperaba que el argumento fuera una constante del modulo TipoOperacion valida"
  end

  # Indica los distintos métodos de salida que se utilizarán para mostrar el
  # resultado. Se pueden indicar varios.
  #
  # En el caso de que se indique un fichero de salida para una salida de tipo
  # NINGUNA o CONSOLA, se desechará su valor.
  #
  # Especificar NINGUNA invalida cualquier otra opción.
  def salida(tipo_salida, fichero_salida = "")

    # Si ya se ha especificado NINGUNA, se desecha cualquier otra opción.
    if (@out.size == 1) && (@out[0] == TipoSalida::NINGUNA)
      return
    end

    # Buscamos cuál fue el tipo que se indicó.
    TipoSalida.constants.each do |x|
      if(TipoSalida.const_get(x) == tipo_salida)

        # Si el tipo no es NINGUNA, lo añadimos y eliminamos duplicados.
        if tipo_salida != TipoSalida::NINGUNA
          @out.push tipo_salida
          @out.uniq!

        # Si el tipo es NINGUNA, se eliminan todas las salidas y se deja sólo
        # esa.
        else
          @out.clear
          @out.push tipo_salida
        end
        return
      end
    end

    # Si se ha metido un valor no permitido, lo indicamos.
    raise ArgumentError, "Se esperaba que el argumento fuera una constante del modulo TipoSalida valida"
  end

  # Añade una matriz (representada como Array de Arrays) para realizar la
  # operación. Se pueden añadir tantas como se desee y el orden en el que se
  # indican importa.
  def operando(def_matriz)

  end

  # Devuelve un array con las matrices utilizadas como operandos y la matriz
  # resultado, utilizando el tipo especificado en el constructor.
  def to_matriz_array

  end

  # Devuelve la matriz resultado de la operación utilizando el tipo indicado en
  # el constructor.
  def to_m

  end

end #-- class MatrizDSL

end #-- module Prct12