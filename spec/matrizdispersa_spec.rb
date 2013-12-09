require "prct12"

describe Prct12::MatrizDispersa do
  before :all do   
    class MatrizDispersaFixnum < Prct12::MatrizDispersa
      def zero
        0
      end
    end

    class MatrizDispersaFraccion < Prct12::MatrizDispersa
      def zero
        Prct12::Fraccion.new(0, 1)
      end
    end

    # Definir las matrices de enteros y fracciones
    @m1 = MatrizDispersaFixnum.new(2, 2)
    @m2 = MatrizDispersaFixnum.new(2, 2)
    @m3 = MatrizDispersaFixnum.new(2, 2)

    @m4 = MatrizDispersaFraccion.new(2, 2)
    @m5 = MatrizDispersaFraccion.new(2, 2)
    @m6 = MatrizDispersaFraccion.new(2, 2)
  end

  describe "Operaciones con enteros" do
    before :all do
      # Crear matrices de enteros
      @m1[0, 0] = 4
      @m1[0, 1] = 0
      @m1[1, 0] = 0
      @m1[1, 1] = 0

      @m2[0, 0] = 2
      @m2[0, 1] = 0
      @m2[1, 0] = 0
      @m2[1, 1] = 0
    end

    it "Deben poder sumarse 2 matrices" do
      @m3[0, 0] = 6
      @m3[0, 1] = 0
      @m3[1, 0] = 0
      @m3[1, 1] = 0

      (@m1+@m2).should eq(@m3)
    end
    it "Deben poder restarse 2 matrices" do
      @m3[0, 0] = 2
      @m3[0, 1] = 0
      @m3[1, 0] = 0
      @m3[1, 1] = 0
      
      (@m1-@m2).should eq(@m3)
    end
    it "Deben poder multiplicarse 2 matrices" do
      @m3[0, 0] = 8
      @m3[0, 1] = 0
      @m3[1, 0] = 0
      @m3[1, 1] = 0
      
      (@m1*@m2).should eq(@m3)
    end
    it "Deben poder compararse 2 matrices" do
      @m3[0, 0] = 4
      @m3[0, 1] = 0
      @m3[1, 0] = 0
      @m3[1, 1] = 0
      
      @m1.should eq(@m3)
    end
    it "Debe poder calcularse el maximo correctamente" do
      (@m1.max).should eq(4)
    end
    it "Debe poder calcularse el minimo correctamente" do
      (@m1.min).should eq(0)
    end
  end

  describe "Operaciones con fracciones" do
    before :all do
      # Crear matrices de fracciones
      @m4[0, 0] = Prct12::Fraccion.new(0, 1)
      @m4[0, 1] = Prct12::Fraccion.new(0, 1)
      @m4[1, 0] = Prct12::Fraccion.new(1, 2)
      @m4[1, 1] = Prct12::Fraccion.new(0, 1)

      @m5[0, 0] = Prct12::Fraccion.new(0, 1)
      @m5[0, 1] = Prct12::Fraccion.new(0, 1)
      @m5[1, 0] = Prct12::Fraccion.new(3, 2)
      @m5[1, 1] = Prct12::Fraccion.new(0, 1)
    end
    
    it "Deben poder sumarse 2 matrices" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(0, 1)
      @m6[1, 0] = Prct12::Fraccion.new(2, 1)
      @m6[1, 1] = Prct12::Fraccion.new(0, 1)
      
      (@m4+@m5).should eq(@m6)
    end
    it "Deben poder restarse 2 matrices" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(0, 1)
      @m6[1, 0] = Prct12::Fraccion.new(-1, 1)
      @m6[1, 1] = Prct12::Fraccion.new(0, 1)
      
      (@m4-@m5).should eq(@m6)
    end
    it "Deben poder multiplicarse 2 matrices" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(0, 1)
      @m6[1, 0] = Prct12::Fraccion.new(0, 1)
      @m6[1, 1] = Prct12::Fraccion.new(0, 1)
      
      (@m4*@m5).should eq(@m6)
    end
    it "Deben poder compararse 2 matrices" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(0, 1)
      @m6[1, 0] = Prct12::Fraccion.new(1, 2)
      @m6[1, 1] = Prct12::Fraccion.new(0, 1)
      
      @m4.should eq(@m6)
    end
    it "Debe poder calcularse el maximo correctamente" do
      (@m4.max).should eq(Prct12::Fraccion.new(1, 2))
    end
    it "Debe poder calcularse el minimo correctamente" do
      (@m4.min).should eq(Prct12::Fraccion.new(0, 1))
    end
  end

  describe "Operaciones combinadas" do
    before :all do
      # Crear matrices de fracciones y enteros
      @m1[0, 0] = 2
      @m1[0, 1] = 3
      @m1[1, 0] = 0
      @m1[1, 1] = 0

      @m4[0, 0] = Prct12::Fraccion.new(0, 1)
      @m4[0, 1] = Prct12::Fraccion.new(2, 3)
      @m4[1, 0] = Prct12::Fraccion.new(0, 1)
      @m4[1, 1] = Prct12::Fraccion.new(0, 1)
    end

    it "Deben poder sumarse 2 matrices" do
      @m6[0, 0] = Prct12::Fraccion.new(2, 1)
      @m6[0, 1] = Prct12::Fraccion.new(11, 3)
      @m6[1, 0] = Prct12::Fraccion.new(0, 1)
      @m6[1, 1] = Prct12::Fraccion.new(0, 1)

      (@m1+@m4).should eq(@m6)
    end
    it "Deben poder restarse 2 matrices" do
      @m6[0, 0] = Prct12::Fraccion.new(2, 1)
      @m6[0, 1] = Prct12::Fraccion.new(7, 3)
      @m6[1, 0] = Prct12::Fraccion.new(0, 1)
      @m6[1, 1] = Prct12::Fraccion.new(0, 1)

      (@m1-@m4).should eq(@m6)
    end
    it "Deben poder multiplicarse 2 matrices" do
      @m6[0, 0] = Prct12::Fraccion.new(0, 1)
      @m6[0, 1] = Prct12::Fraccion.new(4, 3)
      @m6[1, 0] = Prct12::Fraccion.new(0, 1)
      @m6[1, 1] = Prct12::Fraccion.new(0, 1)

      (@m1*@m4).should eq(@m6)
    end
    it "Deben poder compararse 2 matrices" do
      @m6[0, 0] = Prct12::Fraccion.new(2, 1)
      @m6[0, 1] = Prct12::Fraccion.new(3, 1)
      @m6[1, 0] = Prct12::Fraccion.new(0, 1)
      @m6[1, 1] = Prct12::Fraccion.new(0, 1)

      @m1.should eq(@m6)
    end

  end
end
