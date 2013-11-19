require "prct09/matriz"

module Prct09

class MatrizDispersa < Matriz
  private
    class Posicion
      attr_accessor :f, :c
      def initialize(fil, col)
        @f, @c = fil, col
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
    end
  end
end

end
