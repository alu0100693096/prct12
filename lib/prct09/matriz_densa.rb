require "prct09/matriz"

module Prct09

class MatrizDensa < Matriz
  def initialize(fils, cols)
    super(fils, cols)
    @container = Array.new(fils){ Array.new(cols, zero) }
  end

  def filas=(value)
    validate_sizes(value)

    if value > filas
      (value - filas).times { @container << Array.new(columnas, zero) }
    elsif value < filas
      @container.slice!(-1, filas - value)
    end

    filas = value
  end

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

  def [](fila, columna)
    @container[fila][columna]
  end

  def []=(fila, columna, valor)
    @container[fila][columna] = valor
  end

  #Maximo y minimo (Se definen en cada subclase porque en cada una es diferente)
  def max
    maxi = -9999
    for i in 0...self.filas
      for j in 0...self.columnas
        if(self[i,j] > maxi)
          maxi = self[i,j]
        end
      end
    end
    maxi
  end

  def min
    mini = 9999
    for i in 0...self.filas
      for j in 0...self.columnas
        if(self[i,j] < mini)
          mini = self[i,j]
        end
      end
    end
    mini
  end

end

end

