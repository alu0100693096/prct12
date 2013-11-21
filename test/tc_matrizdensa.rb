require "prct09"
require "test/unit"

class MatrizDensaFixnum < Prct09::MatrizDensa
    def zero
        0
    end
end

class MatrizDensaFraccion < Prct09::MatrizDensa
    def zero
        Prct09::Fraccion.new(0, 1)
    end
end

class Test_Matriz_Densa < Test::Unit::TestCase

    def setup
        # Crear matrices
        # --Enteras
        @m1 = MatrizDensaFixnum.new(2, 2)
        @m2 = MatrizDensaFixnum.new(2, 2)
        @m3 = MatrizDensaFixnum.new(2, 2)
        # --Fracciones
        @m4 = MatrizDensaFraccion.new(2, 2)
        @m5 = MatrizDensaFraccion.new(2, 2)
        @m6 = MatrizDensaFraccion.new(2, 2)

        # Inicializar
        # --Enteras
        @m1[0, 0] = 1
        @m1[0, 1] = 2
        @m1[1, 0] = 7
        @m1[1, 1] = 3

        @m2[0, 0] = 3
        @m2[0, 1] = 4
        @m2[1, 0] = 1
        @m2[1, 1] = 2

        # --Fracciones
        @m4[0, 0] = Prct09::Fraccion.new(1, 2)
        @m4[0, 1] = Prct09::Fraccion.new(2, 2)
        @m4[1, 0] = Prct09::Fraccion.new(7, 2)
        @m4[1, 1] = Prct09::Fraccion.new(3, 2)
      
        @m5[0, 0] = Prct09::Fraccion.new(3, 3)
        @m5[0, 1] = Prct09::Fraccion.new(4, 3)
        @m5[1, 0] = Prct09::Fraccion.new(1, 3)
        @m5[1, 1] = Prct09::Fraccion.new(2, 3)
    end

    def test_enteros
        #Suma
        @m3[0, 0] = 4
        @m3[0, 1] = 6
        @m3[1, 0] = 8
        @m3[1, 1] = 5
        assert_equal(@m3, @m1+@m2)

        #Resta
        @m3[0, 0] = -2
        @m3[0, 1] = -2
        @m3[1, 0] = 6
        @m3[1, 1] = 1
        assert_equal(@m3, @m1-@m2)

        #Multiplicación
        @m3[0, 0] = 5
        @m3[0, 1] = 8
        @m3[1, 0] = 24
        @m3[1, 1] = 34
        assert_equal(@m3, @m1*@m2)

        #Comparación
        @m3[0, 0] = 1
        @m3[0, 1] = 2
        @m3[1, 0] = 7
        @m3[1, 1] = 3
        assert_equal(@m3, @m1)

        #Mínimo
        assert_equal(@m1.min,1)

        #Máximo
        assert_equal(@m1.max,7)

    end

    def test_fracciones
        #Suma
        @m6[0, 0] = Prct09::Fraccion.new(3, 2)
        @m6[0, 1] = Prct09::Fraccion.new(7, 3)
        @m6[1, 0] = Prct09::Fraccion.new(23, 6)
        @m6[1, 1] = Prct09::Fraccion.new(13, 6)
        assert_equal(@m6, @m4+@m5)

        #Resta
        @m6[0, 0] = Prct09::Fraccion.new(-1, 2)
        @m6[0, 1] = Prct09::Fraccion.new(-1, 3)
        @m6[1, 0] = Prct09::Fraccion.new(19, 6)
        @m6[1, 1] = Prct09::Fraccion.new(5, 6)
        assert_equal(@m6, @m4-@m5)

        #Multiplicación
        @m6[0, 0] = Prct09::Fraccion.new(5, 6)
        @m6[0, 1] = Prct09::Fraccion.new(4, 3)
        @m6[1, 0] = Prct09::Fraccion.new(4, 1)
        @m6[1, 1] = Prct09::Fraccion.new(17, 3)
        assert_equal(@m6, @m4*@m5)

        #Comparación
        @m6[0, 0] = Prct09::Fraccion.new(1, 2)
        @m6[0, 1] = Prct09::Fraccion.new(2, 2)
        @m6[1, 0] = Prct09::Fraccion.new(7, 2)
        @m6[1, 1] = Prct09::Fraccion.new(3, 2)
        assert_equal(@m6, @m4)

        #Mínimo
        assert_equal(@m4.min,Prct09::Fraccion.new(1, 2))

        #Máximo
        assert_equal(@m4.max,Prct09::Fraccion.new(7, 2))
    end

    def test_combinacion
        #Suma
        @m6[0, 0] = Prct09::Fraccion.new(3, 2)
        @m6[0, 1] = Prct09::Fraccion.new(3, 1)
        @m6[1, 0] = Prct09::Fraccion.new(21, 2)
        @m6[1, 1] = Prct09::Fraccion.new(9, 2)
        assert_equal(@m6, @m1+@m4)

        #Resta
        @m6[0, 0] = Prct09::Fraccion.new(1, 2)
        @m6[0, 1] = Prct09::Fraccion.new(1, 1)
        @m6[1, 0] = Prct09::Fraccion.new(7, 2)
        @m6[1, 1] = Prct09::Fraccion.new(3, 2)
        assert_equal(@m6, @m1-@m4)

        #Multiplicación
        @m6[0, 0] = Prct09::Fraccion.new(15, 2)
        @m6[0, 1] = Prct09::Fraccion.new(4, 1)
        @m6[1, 0] = Prct09::Fraccion.new(14, 1)
        @m6[1, 1] = Prct09::Fraccion.new(23, 2)
        assert_equal(@m6, @m1*@m4)

        #Comparación
        @m6[0, 0] = Prct09::Fraccion.new(1, 1)
        @m6[0, 1] = Prct09::Fraccion.new(2, 1)
        @m6[1, 0] = Prct09::Fraccion.new(7, 1)
        @m6[1, 1] = Prct09::Fraccion.new(3, 1)
        assert_equal(@m6, @m1)
    end

end
