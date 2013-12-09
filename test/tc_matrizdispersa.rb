require "prct12"
require "test/unit"

class MatrizDispersaFixnum < Prct12::MatrizDispersa
    #Devuelve un cero.
    def zero
        0
    end
end

class MatrizDispersaFraccion < Prct12::MatrizDispersa
    #Devuelve un cero.
    def zero
        Prct12::Fraccion.new(0, 1)
    end
end

#Clase para probar operaciones entre matrices dispersas.
class Test_Matriz_Dispersa < Test::Unit::TestCase

    #Crear e inicializar matrices.
    def setup
        # Crear matrices
        # --Enteras
        @m1 = MatrizDispersaFixnum.new(2, 2)
        @m2 = MatrizDispersaFixnum.new(2, 2)
        @m3 = MatrizDispersaFixnum.new(2, 2)
        # --Fracciones
        @m4 = MatrizDispersaFraccion.new(2, 2)
        @m5 = MatrizDispersaFraccion.new(2, 2)
        @m6 = MatrizDispersaFraccion.new(2, 2)

        # Inicializar
        # --Enteras
        @m1[0, 0] = 4
        @m1[0, 1] = 0
        @m1[1, 0] = 0
        @m1[1, 1] = 0

        @m2[0, 0] = 2
        @m2[0, 1] = 0
        @m2[1, 0] = 0
        @m2[1, 1] = 0

        # --Fracciones
        @m4[0, 0] = Prct12::Fraccion.new(0, 1)
        @m4[0, 1] = Prct12::Fraccion.new(0, 1)
        @m4[1, 0] = Prct12::Fraccion.new(1, 2)
        @m4[1, 1] = Prct12::Fraccion.new(0, 1)

        @m5[0, 0] = Prct12::Fraccion.new(0, 1)
        @m5[0, 1] = Prct12::Fraccion.new(0, 1)
        @m5[1, 0] = Prct12::Fraccion.new(3, 2)
        @m5[1, 1] = Prct12::Fraccion.new(0, 1)
    end

    #Pruebas con enteros.
    def test_enteros
        #Suma
        @m3[0, 0] = 6
        @m3[0, 1] = 0
        @m3[1, 0] = 0
        @m3[1, 1] = 0
        assert_equal(@m3, @m1+@m2)

        #Resta
        @m3[0, 0] = 2
        @m3[0, 1] = 0
        @m3[1, 0] = 0
        @m3[1, 1] = 0
        assert_equal(@m3, @m1-@m2)

        #Multiplicación
        @m3[0, 0] = 8
        @m3[0, 1] = 0
        @m3[1, 0] = 0
        @m3[1, 1] = 0
        assert_equal(@m3, @m1*@m2)

        #Comparación
        @m3[0, 0] = 4
        @m3[0, 1] = 0
        @m3[1, 0] = 0
        @m3[1, 1] = 0
        assert_equal(@m3, @m1)

        #Mínimo
        assert_equal(@m1.min,0)

        #Máximo
        assert_equal(@m1.max,4)

    end

    #Pruebas con fracciones.
    def test_fracciones
        #Suma
        @m6[0, 0] = Prct12::Fraccion.new(0, 1)
        @m6[0, 1] = Prct12::Fraccion.new(0, 1)
        @m6[1, 0] = Prct12::Fraccion.new(2, 1)
        @m6[1, 1] = Prct12::Fraccion.new(0, 1)
        assert_equal(@m6, @m4+@m5)

        #Resta
        @m6[0, 0] = Prct12::Fraccion.new(0, 1)
        @m6[0, 1] = Prct12::Fraccion.new(0, 1)
        @m6[1, 0] = Prct12::Fraccion.new(-1, 1)
        @m6[1, 1] = Prct12::Fraccion.new(0, 1)
        assert_equal(@m6, @m4-@m5)

        #Multiplicación
        @m6[0, 0] = Prct12::Fraccion.new(0, 1)
        @m6[0, 1] = Prct12::Fraccion.new(0, 1)
        @m6[1, 0] = Prct12::Fraccion.new(0, 1)
        @m6[1, 1] = Prct12::Fraccion.new(0, 1)
        assert_equal(@m6, @m4*@m5)

        #Comparación
        @m6[0, 0] = Prct12::Fraccion.new(0, 1)
        @m6[0, 1] = Prct12::Fraccion.new(0, 1)
        @m6[1, 0] = Prct12::Fraccion.new(1, 2)
        @m6[1, 1] = Prct12::Fraccion.new(0, 1)
        assert_equal(@m6, @m4)

        #Mínimo
        assert_equal(@m4.min,Prct12::Fraccion.new(0, 1))

        #Máximo
        assert_equal(@m4.max,Prct12::Fraccion.new(1, 2))

    end

    #Pruebas con enteros y fracciones.
    def test_combinacion
        #Suma
        @m6[0, 0] = Prct12::Fraccion.new(4, 1)
        @m6[0, 1] = Prct12::Fraccion.new(0, 1)
        @m6[1, 0] = Prct12::Fraccion.new(1, 2)
        @m6[1, 1] = Prct12::Fraccion.new(0, 1)
        assert_equal(@m6, @m1+@m4)

        #Resta
        @m6[0, 0] = Prct12::Fraccion.new(4, 1)
        @m6[0, 1] = Prct12::Fraccion.new(0, 1)
        @m6[1, 0] = Prct12::Fraccion.new(-1, 2)
        @m6[1, 1] = Prct12::Fraccion.new(0, 1)
        assert_equal(@m6, @m1-@m4)

        #Multiplicación
        @m6[0, 0] = Prct12::Fraccion.new(0, 1)
        @m6[0, 1] = Prct12::Fraccion.new(0, 1)
        @m6[1, 0] = Prct12::Fraccion.new(0, 1)
        @m6[1, 1] = Prct12::Fraccion.new(0, 2)
        assert_equal(@m6, @m1*@m4)

        #Comparación
        @m6[0, 0] = Prct12::Fraccion.new(4, 1)
        @m6[0, 1] = Prct12::Fraccion.new(0, 1)
        @m6[1, 0] = Prct12::Fraccion.new(0, 1)
        @m6[1, 1] = Prct12::Fraccion.new(0, 1)
        assert_equal(@m6, @m1)
    end

end
