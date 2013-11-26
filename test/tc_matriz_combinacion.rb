require "prct11"
require "test/unit"

#Clase para devolver un cero en matrices densas de enteros.
class MatrizDensaFixnum < Prct11::MatrizDensa
    #Devuelve un cero.
    def zero
        0
    end
end

#Clase para devolver un cero en matrices densas de fracciones.
class MatrizDensaFraccion < Prct11::MatrizDensa
    #Devuelve un cero.
    def zero
        Prct11::Fraccion.new(0, 1)
    end
end

#Clase para devolver un cero en matrices dispersas de enteros.
class MatrizDispersaFixnum < Prct11::MatrizDispersa
    #Devuelve un cero.
    def zero
        0
    end
end

#Clase para devolver un cero en matrices dispersas de fracciones.
class MatrizDispersaFraccion < Prct11::MatrizDispersa
    #Devuelve un cero.
    def zero
        Prct11::Fraccion.new(0, 1)
    end
end

#Clase para probar operaciones entre matrices densas y dispersas.
class Test_Matriz_Combinacion < Test::Unit::TestCase

    #Crear e inicializar matrices.
    def setup
        # Crear matrices
        @m1 = MatrizDensaFixnum.new(2, 2)
        @m2 = MatrizDispersaFixnum.new(2, 2)
        @m3 = MatrizDensaFixnum.new(2, 2)

        # Inicializar
        # --Enteras
        @m1[0, 0] = 2
        @m1[0, 1] = 4
        @m1[1, 0] = 1
        @m1[1, 1] = 6

        @m2[0, 0] = 0
        @m2[0, 1] = 0
        @m2[1, 0] = 3
        @m2[1, 1] = 0
    end

    #Pruebas con enteros.
    def test_enteros
        #Suma
        @m3[0, 0] = 2
        @m3[0, 1] = 4
        @m3[1, 0] = 4
        @m3[1, 1] = 6
        assert_equal(@m3, @m1+@m2)

        #Resta
        @m3[0, 0] = 2
        @m3[0, 1] = 4
        @m3[1, 0] = -2
        @m3[1, 1] = 6
        assert_equal(@m3, @m1-@m2)

        #Multiplicación
        @m3[0, 0] = 12
        @m3[0, 1] = 0
        @m3[1, 0] = 18
        @m3[1, 1] = 0
        assert_equal(@m3, @m1*@m2)

        #Comparación
        @m3[0, 0] = 0
        @m3[0, 1] = 0
        @m3[1, 0] = 3
        @m3[1, 1] = 0
        assert_equal(@m3, @m2)
    end
end
