require "prct11/matriz"

module Prct11

#Clase que permite la representación de matrices densas. Hereda de la clase matriz.
class MatrizDensa < Matriz
  #Constructor. Llama al de la clase madre para las filas y las columnas, 
  #e inicializa la matriz a 0 mediante un array de arrays.
  def initialize(fils, cols)
    super(fils, cols)
    @container = Array.new(fils){ Array.new(cols, zero) }
  end
  
  #Modifica el número de filas de la matriz.
  def filas=(value)
    validate_sizes(value)

    if value > filas
      (value - filas).times { @container << Array.new(columnas, zero) }
    elsif value < filas
      @container.slice!(-1, filas - value)
    end

    filas = value
  end

  #Modifica el número de columnas de la matriz.
  def columnas=(value)
    validate_sizes(value)

    if value != columnas
      @container.each do |x|
        if value > columnas
          (value - columnas).times { x << zero }
        else
          x.slice!(-1, columnas - value)
        end
      end
    end

    columnas = value
  end

  #Permite acceder a un elemento de la matriz con el operador [].
  def [](fila, columna)
    @container[fila][columna]
  end

  #Permite asignar un valor a una posición de la matriz con el operador [].
  def []=(fila, columna, valor)
    @container[fila][columna] = valor
  end

end # class MatrizDensa

end # module Prct11
