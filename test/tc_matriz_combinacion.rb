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

class MatrizDispersaFixnum < Prct09::MatrizDispersa
      def zero
        0
      end
end

class MatrizDispersaFraccion < Prct09::MatrizDispersa
      def zero
        Prct09::Fraccion.new(0, 1)
      end
end

class Test_Matriz_Combinacion < Test::Unit::TestCase

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
