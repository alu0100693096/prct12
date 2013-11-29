require "prct11/matriz"

module Prct11

#Clase que permite la representación de matrices dispersas. Hereda de la clase matriz.
class MatrizDispersa < Matriz
  private
    #Clase que representa la clave del hash que guarda la matriz dispersa.
    class Posicion
      #f=fila. c=columna.
      attr_accessor :f, :c
      #Constructor que inicializa los valores de f y c.
      def initialize(fil, col)
        @f, @c = fil, col
      end
      #Función que devuelve el valor hash de cada objeto.
      def hash
        @f.hash ^ @c.hash
      end
      #Función para comprobar si dos objetos son iguales dentro de un hash.
      def eql?(other)
        @f == other.f and @c == other.c
      end
    end

  public
 
  #Constructor. Llama al de la clase madre para las filas y las columnas, 
  #e inicializa el hash especificando como valor por defecto el cero.
  def initialize(filas, columnas)
    super(filas, columnas)
    @container = Hash.new(zero)
  end

  #Modifica el número de filas de la matriz y borra los elementos sobrantes si
  #el número de filas nuevo es menor.
  def filas=(value)
    validate_sizes(value)

    if value < filas
      @container.each_key do |k|
        if k.f >= value
          @container.delete k
        end
      end
    end

    filas = value
  end

  #Modifica el número de columnas de la matriz y borra los elementos sobrantes
  #si el nuevo número de columnas es menor.
  def columnas=(value)
    validate_sizes(value)

    if value < columnas
      @container.each_key do |k|
        if k.c >= value
          @container.delete k
        end
      end
    end

    columnas = value
  end
  
  #Permite acceder a un elemento de la matriz con el operador [].
  def [](fila, columna)
    @container[Posicion.new(fila, columna)]
  end

  #Permite asignar un valor a una posición de la matriz con el operador [].
  def []=(fila, columna, valor)
    if valor != zero
      @container[Posicion.new(fila, columna)] = valor
    else
      @container.delete(Posicion.new(fila, columna))
    end
  end

end # class MatrizDispersa

end # module Prct11
