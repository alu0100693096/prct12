module Prct11

#Clase que permite la representación y manipulación de matrices.
class Matriz
  include Enumerable
  #filas=filas. columnas=columnas.
  attr_reader :filas, :columnas

  #Constructor. No crea ningún contenedor.
  def initialize(filas, columnas)
    validate_sizes(filas, columnas)
    @filas = filas
    @columnas = columnas
  end

  #Iterador que recorre todos los elementos de la matriz.
  def each
    filas.times do |i|
      columnas.times do |j|
        yield self[i,j]
      end
    end
  end

  #Suma de matrices.
  def +(other)
    if((filas == other.filas) && (columnas == other.columnas))
      sum = self.class.new(filas, columnas)
      filas.times do |i|
        columnas.times do |j|
          sum[i, j] = self[i, j] + other[i, j]
        end
      end
      sum
    else
      puts "Las matrices no se pueden sumar, no son del mismo tamanio"
    end
  end

  #Resta de matrices.
  def -(other)
    if((filas == other.filas) && (columnas == other.columnas))
      res = self.class.new(filas, columnas)
      filas.times do |i|
        columnas.times do |j|
          res[i, j] = self[i, j] - other[i, j]
        end
      end
      res
    else
      puts "Las matrices no se pueden restar, no son del mismo tamanio"
    end
  end

  #Multiplicación de matrices.
  def *(other)
    # Comprobamos que el número de columnas de la matriz 1 y el número de filas
    # de la matriz 2 coinciden para poder realizar la multiplicación.
    if columnas != other.filas
      raise(ArgumentError, "Matrices no multiplicables.")
      return
    end

    #Crea una matriz con tantas filas como la matriz 1 y tantas columnas como la matriz 2.
    result = self.class.new(filas, other.columnas)

    #Algoritmo de la multiplicación de matrices.
    0.upto(result.filas-1) do |i|
      0.upto(result.columnas-1) do |j|
        0.upto(columnas-1) do |k|
          result[i, j] = result[i, j] + (self[i, k] * other[k, j])
        end
      end
    end
    result
  end

  #Comparación de matrices.
  def ==(other)
    if(filas != other.filas || columnas != other.columnas)
      return false
    end

    filas.times do |i|
      columnas.times do |j|
        if(self[i, j] != other[i, j])
          return false
        end
      end
    end

    true
  end

  #Cálculo del máximo de los elementos de la matriz.
  def max
    maxi = self[0, 0]
    self.each do |x|
      if x > maxi
        maxi = x
      end
    end
    maxi
  end

  #Cálculo del mínimo de los elementos de la matriz.
  def min
    mini = self[0,0]
    self.each do |x|
      if x < mini
        mini = x
      end
    end
    mini
  end

  #Método para convertir a String.
  def to_s
    s = ""
    filas.times do |i|
      columnas.times do |j|
        s << " #{self[i, j]}"
      end
      s << "\n"
    end
    s
  end

 protected
  #Método para ser llamado por las subclases para modificar el nº de filas.
  def filas=(value)
    @filas = value
  end

  #Método para ser llamado por las subclases para modificar el nº de columnas.
  def columnas=(value)
    @columnas = value
  end

  #Se asegura que los valores pasados están dentro del rango [0, Infinito)
  #y que son números enteros. En caso contrario lanza una excepción.
  def validate_sizes(*values)
    values.each do |x|
      raise(ArgumentError, "#{x} no es un valor correcto") unless(x.is_a?Integer and x >= 0)
    end
  end

end #-- class Matriz

end #-- module Prct11
