#!/usr/bin/env ruby

require 'prct12'

class MatrizDensaFixnum < Prct12::MatrizDensa
  def zero
    0
  end
end

test = Prct12::MatrizDSL.new(MatrizDensaFixnum) do
  operacion Prct12::TipoOperacion::MULTIPLICACION
  salida Prct12::TipoSalida::FICHERO, "salida.txt"
  salida Prct12::TipoSalida::CONSOLA
  operando [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  operando [[9, 8, 7], [6, 5, 4], [3, 2, 1]]
  operando [[23, 4, 64], [2, 0, 0], [23, 4, 12]]
end
