require "prct09/matriz"

module Prct09

class MatrizDispersa < Matriz
  private
    class Posicion
      attr_accessor :f, :c
      def initialize(fil, col)
        @f, @c = fil, col
      end
      def hash
        @f.hash ^ @c.hash
      end
      def eql?(other)
        @f == other.f and @c == other.c
      end
    end

  public
  def initialize(filas, columnas)
    super(filas, columnas)
    @container = Hash.new(zero)
  end

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

  def [](fila, columna)
    @container[Posicion.new(fila, columna)]
  end

  def []=(fila, columna, valor)
    if valor != zero
      @container[Posicion.new(fila, columna)] = valor
    else
      @container.delete(Posicion.new(fila, columna))
    end
  end

  #Maximo y minimo (Se definen en cada subclase porque en cada una es diferente) (Aquí no debe contrar los elementos nulos)
  def max
    maxi = -9999
    for i in 0...self.filas
      for j in 0...self.columnas
        if(self[i,j] > maxi && self[i,j] != 0)
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
        if(self[i,j] < mini && self[i,j] != 0)
          mini = self[i,j]
        end
      end
    end
    mini
  end
end

end
