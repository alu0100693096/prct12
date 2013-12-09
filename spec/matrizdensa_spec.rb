require "prct12"

describe Prct12::MatrizDensa do
  before :all do

    class MatrizDensaFixnum < Prct12::MatrizDensa
      def zero
        0
      end
    end

    class MatrizDensaFraccion < Prct12::MatrizDensa
      def zero
        Prct12::Fraccion.new(0, 1)
      end
    end

  end
 
  describe "Operaciones con enteros" do
    before :all do
      # Crear matrices
      @m1 = MatrizDensaFixnum.new(2, 2)
      @m2 = MatrizDensaFixnum.new(2, 2)
      @m3 = MatrizDensaFixnum.new(2, 2)

      # Inicializar matrices fijas
      @m1[0, 0] = 1
      @m1[0, 1] = 2
      @m1[1, 0] = 7
      @m1[1, 1] = 3

      @m2[0, 0] = 3
      @m2[0, 1] = 4
      @m2[1, 0] = 1
      @m2[1, 1] = 2
    end

    # @m3 será la matriz resultado, que se inicializará en cada test.
  
    it "Deben poder sumarse 2 matrices" do
      @m3[0, 0] = 4
      @m3[0, 1] = 6
      @m3[1, 0] = 8
      @m3[1, 1] = 5

      (@m1+@m2).should eq(@m3)
    end

    it "Deben poder restarse 2 matrices" do
      @m3[0, 0] = -2
      @m3[0, 1] = -2
      @m3[1, 0] = 6
      @m3[1, 1] = 1

      (@m1-@m2).should eq(@m3)
    end

    it "Deben poder multiplicarse 2 matrices" do
      @m3[0, 0] = 5
      @m3[0, 1] = 8
      @m3[1, 0] = 24
      @m3[1, 1] = 34

      (@m1*@m2).should eq(@m3)
    end

    it "Deben poder compararse 2 matrices" do
      @m3[0, 0] = 1
      @m3[0, 1] = 2
      @m3[1, 0] = 7
      @m3[1, 1] = 3

      @m1.should eq(@m3)
    end
    it "Debe poder calcularse el maximo correctamente" do
      (@m1.max).should eq(7)
    end
    it "Debe poder calcularse el minimo correctamente" do
      (@m1.min).should eq(1)
    end
    it "Debe encontrar un elemento que cumpla un bloque" do
      tmp = MatrizDensaFixnum.new(3, 3)
      tmp[0, 0] = 1
      tmp[0, 1] = 2
      tmp[0, 2] = 3
      tmp[1, 0] = 4
      tmp[1, 1] = 5
      tmp[1, 2] = 6
      tmp[2, 0] = 7
      tmp[2, 1] = 8
      tmp[2, 2] = 9
      
      (tmp.encontrar{|e| e*e >= 16}).should eq([1, 0])
    end
  end

  # FRACCIONES
  describe "Operaciones con fracciones" do
    before :all do
      # Crear matrices
      @m1 = MatrizDensaFraccion.new(2, 2)
      @m2 = MatrizDensaFraccion.new(2, 2)
      @m3 = MatrizDensaFraccion.new(2, 2)

      # Inicializar matrices fijas
      @m1[0, 0] = Prct12::Fraccion.new(1, 2)
      @m1[0, 1] = Prct12::Fraccion.new(2, 2)
      @m1[1, 0] = Prct12::Fraccion.new(7, 2)
      @m1[1, 1] = Prct12::Fraccion.new(3, 2)

      @m2[0, 0] = Prct12::Fraccion.new(3, 3)
      @m2[0, 1] = Prct12::Fraccion.new(4, 3)
      @m2[1, 0] = Prct12::Fraccion.new(1, 3)
      @m2[1, 1] = Prct12::Fraccion.new(2, 3)
    end

    # @m3 será la matriz resultado, que se inicializará en cada test.

    it "Deben poder sumarse 2 matrices" do
      @m3[0, 0] = Prct12::Fraccion.new(3, 2)
      @m3[0, 1] = Prct12::Fraccion.new(7, 3)
      @m3[1, 0] = Prct12::Fraccion.new(23, 6)
      @m3[1, 1] = Prct12::Fraccion.new(13, 6)

      (@m1+@m2).should eq(@m3)
    end

    it "Deben poder restarse 2 matrices" do
      @m3[0, 0] = Prct12::Fraccion.new(-1, 2)
      @m3[0, 1] = Prct12::Fraccion.new(-1, 3)
      @m3[1, 0] = Prct12::Fraccion.new(19, 6)
      @m3[1, 1] = Prct12::Fraccion.new(5, 6)

      (@m1-@m2).should eq(@m3)
    end

    it "Deben poder multiplicarse 2 matrices" do
      @m3[0, 0] = Prct12::Fraccion.new(5, 6)
      @m3[0, 1] = Prct12::Fraccion.new(4, 3)
      @m3[1, 0] = Prct12::Fraccion.new(4, 1)
      @m3[1, 1] = Prct12::Fraccion.new(17, 3)

      (@m1*@m2).should eq(@m3)
    end

    it "Deben poder compararse 2 matrices" do
      @m3[0, 0] = Prct12::Fraccion.new(1, 2)
      @m3[0, 1] = Prct12::Fraccion.new(2, 2)
      @m3[1, 0] = Prct12::Fraccion.new(7, 2)
      @m3[1, 1] = Prct12::Fraccion.new(3, 2)

      @m1.should eq(@m3)
    end
    it "Debe poder calcularse el maximo correctamente" do
      (@m1.max).should eq(Prct12::Fraccion.new(7, 2))
    end
    it "Debe poder calcularse el minimo correctamente" do
      (@m1.min).should eq(Prct12::Fraccion.new(1, 2))
    end
  end

  # TIPOS DIFERENTES
  describe "Operaciones con tipos diferentes" do
    before :all do
      # Crear matrices
      @m1 = MatrizDensaFixnum.new(2, 2)
      @m2 = MatrizDensaFraccion.new(2, 2)

      #El resultado se almacena en forma de fracción para una mayor precisión
      @m3 = MatrizDensaFraccion.new(2, 2)

      # Inicializar matrices fijas
      @m1[0, 0] = 1
      @m1[0, 1] = 2
      @m1[1, 0] = 3
      @m1[1, 1] = 4

      @m2[0, 0] = Prct12::Fraccion.new(5, 2)
      @m2[0, 1] = Prct12::Fraccion.new(4, 2)
      @m2[1, 0] = Prct12::Fraccion.new(1, 2)
      @m2[1, 1] = Prct12::Fraccion.new(3, 2)
    end
  
    it "Deben poder sumarse 2 matrices" do
      @m3[0, 0] = Prct12::Fraccion.new(7, 2)
      @m3[0, 1] = Prct12::Fraccion.new(4, 1)
      @m3[1, 0] = Prct12::Fraccion.new(7, 2)
      @m3[1, 1] = Prct12::Fraccion.new(11, 2)

      (@m1+@m2).should eq(@m3)
    end

    it "Deben poder restarse 2 matrices" do
      @m3[0, 0] = Prct12::Fraccion.new(-3, 2)
      @m3[0, 1] = Prct12::Fraccion.new(0, 1)
      @m3[1, 0] = Prct12::Fraccion.new(5, 2)
      @m3[1, 1] = Prct12::Fraccion.new(5, 2)

      (@m1-@m2).should eq(@m3)
    end

    it "Deben poder multiplicarse 2 matrices" do
      @m3[0, 0] = Prct12::Fraccion.new(7, 2)
      @m3[0, 1] = Prct12::Fraccion.new(5, 1)
      @m3[1, 0] = Prct12::Fraccion.new(19, 2)
      @m3[1, 1] = Prct12::Fraccion.new(12, 1)

      (@m1*@m2).should eq(@m3)
    end

    it "Deben poder compararse 2 matrices" do
      @m3[0, 0] = Prct12::Fraccion.new(1, 1)
      @m3[0, 1] = Prct12::Fraccion.new(2, 1)
      @m3[1, 0] = Prct12::Fraccion.new(3, 1)
      @m3[1, 1] = Prct12::Fraccion.new(8, 2)

      @m1.should eq(@m3)
    end
  end
end
