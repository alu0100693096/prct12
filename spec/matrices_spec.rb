require "prct09"

describe Prct09::Matriz do

end

describe Prct09::MatrizDensa do
  before :all do

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

  end

  # ENTEROS
  describe "Operaciones con enteros" do
    before :all do
      # Crear matrices m1, m2, m3
      @m1 = MatrizDensaFixnum.new(2, 2)
      @m2 = MatrizDensaFixnum.new(2, 2)
      @m3 = MatrizDensaFixnum.new(2, 2)

      # Inicializar m1, m2
    end

    # Inicializar m3
    it "Deben poder sumarse 2 matrices" do
      (@m1+@m2).should eq(@m3)
    end
    it "Deben poder restarse 2 matrices" do
      (@m1-@m2).should eq(@m3)
    end
    it "Deben poder multiplicarse 2 matrices" do
      (@m1*@m2).should eq(@m3)
    end
    it "Deben poder compararse 2 matrices" do
      @m1.should eq(@m3)
    end
  end

  # FRACCIONES
  describe "Operaciones con fracciones" do
    before :all do
      # Crear matrices m1, m2, m3
      @m1 = MatrizDensaFraccion.new(2, 2)
      @m2 = MatrizDensaFraccion.new(2, 2)
      @m3 = MatrizDensaFraccion.new(2, 2)
    end

    it "Deben poder sumarse 2 matrices" do
      (@m1+@m2).should eq(@m3)
    end
    it "Deben poder restarse 2 matrices" do
      (@m1-@m2).should eq(@m3)
    end
    it "Deben poder multiplicarse 2 matrices" do
      (@m1*@m2).should eq(@m3)
    end
    it "Deben poder compararse 2 matrices" do
      @m1.should eq(@m3)
    end
  end

  # TIPOS DIFERENTES
  describe "Operaciones con tipos diferentes" do
    before :all do
      # Crear matrices m1, m2, m3
    end

    it "Deben poder sumarse 2 matrices" do
      (@m1+@m2).should eq(@m3)
    end
    it "Deben poder restarse 2 matrices" do
      (@m1-@m2).should eq(@m3)
    end
    it "Deben poder multiplicarse 2 matrices" do
      (@m1*@m2).should eq(@m3)
    end
    it "Deben poder compararse 2 matrices" do
      @m1.should eq(@m3)
    end
  end
end

describe Prct09::MatrizDispersa do

end
