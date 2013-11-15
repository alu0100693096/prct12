module Prct09

class Matriz
  include Enumerable
  attr_reader :filas, :columnas

  # Constructor. No crea ningún contenedor
  def initialize(filas, columnas)
    validate_sizes(filas, columnas)
    @filas = filas
    @columnas = columnas
  end

  # Método para poder utilizar Enumerable
  def each()
    for i in 0...self.filas
      for j in 0...self.columnas
        yield self[i, j]
      end
    end
  end

  # Suma de matrices
  def +(other)
    if((self.filas == other.filas) && (self.columnas == other.columnas))
      sum = Matriz.new(self.filas, self.columnas)
      i = 0
      while i < self.filas do
        j = 0
        while j < self.columnas do
          sum[i, j] = self[i, j] + other[i, j]
          j = j+1
        end
        i = i+1
      end
      sum
    else
      puts "Las matrices no se pueden sumar, no son del mismo tamanio"
    end
  end

  # Resta de matrices
  def -(other)
    if((self.filas == other.filas) && (self.columnas == other.columnas))
      sum = Matriz.new(self.filas, self.columnas) # CAMBIARLO: Matriz es abstracta
      i = 0
      while i < self.filas do
        j = 0
        while j < self.columnas do
          sum[i, j] = self[i, j] - other[i, j]
          j = j+1
        end
        i = i+1
      end
      sum
    else
      puts "Las matrices no se pueden restar, no son del mismo tamanio"
    end
  end

  # Multiplicación de matrices
  def *(other)
    # Comprobamos que el número de columnas de la matriz 1 y el número de filas
    # de la matriz 2 coinciden para poder realizar la multiplicación.
    if self.columnas != other.filas
      raise(ArgumentError, "Matrices no multiplicables.")
      return
    end

    # Crea una matrix con tantas filas como la matriz 1 y tantas columnas como la matriz 2.
    result = Matriz.new(rows, other.columns) # CAMBIARLO: Matriz es abstracta

    # Algoritmo de la multiplicación de matrices.
    for i in 0...result.filas
      for j in 0...result.columnas
        for k in 0...columnas
          if result[i, j] != nil
            result[i, j] = result[i, j] + (self[i, k] * other[k, j])
          else
            result[i, j] = self[i, k] * other[k, j]
          end
        end
      end
    end
    result
  end

  # Comparación de matrices
  def ==(other)
    if(self.filas != other.filas || self.columnas != other.columnas)
      return false
    end
    for i in 0...self.filas
      for j in 0...self.columnas
        if(self[i, j] != other[i, j])
          return false
        end
      end
    end
    true
  end

  def !=(other)
    return !(self == other)
  end

 protected
  # Métodos para ser llamados por las subclases para modificar el nº de filas
  # y de columnas
  def filas=(value)
    @filas = value
  end

  def columnas=(value)
    @columnas = value
  end

  # Se asegura que los valores pasados están dentro del rango [0, Infinito)
  # y que son números enteros. En caso contrario lanza una excepción.
  def validate_sizes(*values)
    values.each do |x|
      raise(ArgumentError, "#{x} no es un valor correcto") unless(x.integer? and x >= 0)
    end
  end

end

end
