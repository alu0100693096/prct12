require "prct09"

describe Prct09::Matriz do
  before :all do
    # Definir las clases concretas
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
  end

  describe "Operaciones con enteros" do
    before :all do
      @m1 = MatrizDensaFixnum.new(2, 2)
      @m2 = MatrizDispersaFixnum.new(2, 2)
      @m3 = MatrizDensaFixnum.new(2, 2)

      @m1[0, 0] = 2
      @m1[0, 1] = 4
      @m1[1, 0] = 1
      @m1[1, 1] = 6

      @m2[0, 0] = 0
      @m2[0, 1] = 0
      @m2[1, 0] = 3
      @m2[1, 1] = 0
    end

    it "Deben poder sumarse 2 matrices" do
      @m3[0, 0] = 2
      @m3[0, 1] = 4
      @m3[1, 0] = 4
      @m3[1, 1] = 6

      (@m1+@m2).should eq(@m3)
    end

    it "Deben poder restarse 2 matrices" do
      @m3[0, 0] = 2
      @m3[0, 1] = 4
      @m3[1, 0] = -2
      @m3[1, 1] = 6

      (@m1-@m2).should eq(@m3)
    end

    it "Deben poder multiplicarse 2 matrices" do
      @m3[0, 0] = 12
      @m3[0, 1] = 0
      @m3[1, 0] = 18
      @m3[1, 1] = 0

      (@m1*@m2).should eq(@m3)
    end

    it "Deben poder compararse 2 matrices" do
      @m3[0, 0] = 0
      @m3[0, 1] = 0
      @m3[1, 0] = 3
      @m3[1, 1] = 0

      @m2.should eq(@m3)
    end

  end

  describe "Operaciones con fracciones" do
    before :all do
      @m1 = MatrizDensaFraccion.new(2, 2)
      @m2 = MatrizDispersaFraccion.new(2, 2)
      @m3 = MatrizDensaFraccion.new(2, 2)

      @m1[0, 0] = Prct09::Fraccion.new(3, 1)
      @m1[0, 1] = Prct09::Fraccion.new(4, 3)
      @m1[1, 0] = Prct09::Fraccion.new(2, 6)
      @m1[1, 1] = Prct09::Fraccion.new(9, 13)

      @m2[0, 0] = Prct09::Fraccion.new(13, 2)
      @m2[0, 1] = Prct09::Fraccion.new(0, 1)
      @m2[1, 0] = Prct09::Fraccion.new(0, 1)
      @m2[1, 1] = Prct09::Fraccion.new(5, 3)
    end

    it "Deben poder sumarse 2 matrices" do
      @m3[0, 0] = Prct09::Fraccion.new(19, 2)
      @m3[0, 1] = Prct09::Fraccion.new(4, 3)
      @m3[1, 0] = Prct09::Fraccion.new(1, 3)
      @m3[1, 1] = Prct09::Fraccion.new(92, 39)

      (@m1+@m2).should eq(@m3)
    end

    it "Deben poder restarse 2 matrices" do
      @m3[0, 0] = Prct09::Fraccion.new(-7, 2)
      @m3[0, 1] = Prct09::Fraccion.new(4, 3)
      @m3[1, 0] = Prct09::Fraccion.new(1, 3)
      @m3[1, 1] = Prct09::Fraccion.new(-38, 39)

      (@m1-@m2).should eq(@m3)
    end

    it "Deben poder multiplicarse 2 matrices" do
      @m3[0, 0] = Prct09::Fraccion.new(39, 2)
      @m3[0, 1] = Prct09::Fraccion.new(20, 9)
      @m3[1, 0] = Prct09::Fraccion.new(13, 6)
      @m3[1, 1] = Prct09::Fraccion.new(15, 13)

      (@m1*@m2).should eq(@m3)
    end

    it "Deben poder compararse 2 matrices" do
      @m3[0, 0] = Prct09::Fraccion.new(13, 2)
      @m3[0, 1] = Prct09::Fraccion.new(0, 1)
      @m3[1, 0] = Prct09::Fraccion.new(0, 1)
      @m3[1, 1] = Prct09::Fraccion.new(5, 3)

      @m2.should eq(@m3)
    end

  end

  describe "Operaciones combinadas" do
    before :all do
      @m1 = MatrizDensaFixnum.new(2, 2)
      @m2 = MatrizDispersaFraccion.new(2, 2)
      @m3 = MatrizDensaFraccion.new(2, 2)

      @m1[0, 0] = 12
      @m1[0, 1] = 6
      @m1[1, 0] = 4
      @m1[1, 1] = -9

      @m2[0, 0] = Prct09::Fraccion.new(12, 7)
      @m2[0, 1] = Prct09::Fraccion.new(0, 1)
      @m2[1, 0] = Prct09::Fraccion.new(3, 2)
      @m2[1, 1] = Prct09::Fraccion.new(0, 1)
    end

    it "Deben poder sumarse 2 matrices" do
      @m3[0, 0] = Prct09::Fraccion.new(96, 7)
      @m3[0, 1] = Prct09::Fraccion.new(6, 1)
      @m3[1, 0] = Prct09::Fraccion.new(11, 2)
      @m3[1, 1] = Prct09::Fraccion.new(-9, 1)

      (@m1+@m2).should eq(@m3)
    end

    it "Deben poder restarse 2 matrices" do
      @m3[0, 0] = Prct09::Fraccion.new(72, 7)
      @m3[0, 1] = Prct09::Fraccion.new(6, 1)
      @m3[1, 0] = Prct09::Fraccion.new(5, 2)
      @m3[1, 1] = Prct09::Fraccion.new(-9, 1)

      (@m1-@m2).should eq(@m3)
    end

    it "Deben poder multiplicarse 2 matrices" do
      @m3[0, 0] = Prct09::Fraccion.new(207, 7)
      @m3[0, 1] = Prct09::Fraccion.new(0, 1)
      @m3[1, 0] = Prct09::Fraccion.new(-93, 14)
      @m3[1, 1] = Prct09::Fraccion.new(0, 1)

      (@m1*@m2).should eq(@m3)
    end

    it "Deben poder compararse 2 matrices" do
      @m3[0, 0] = Prct09::Fraccion.new(12, 7)
      @m3[0, 1] = Prct09::Fraccion.new(0, 1)
      @m3[1, 0] = Prct09::Fraccion.new(3, 2)
      @m3[1, 1] = Prct09::Fraccion.new(0, 1)

      @m2.should eq(@m3)
    end

  end
end
