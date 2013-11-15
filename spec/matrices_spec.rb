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
    describe "Matrices densas" do
      before :all do
        # Crear matrices m1, m2, m3
        @m1 = MatrizDensaFixnum.new(2, 2)
        @m2 = MatrizDensaFixnum.new(2, 2)
        @m3 = MatrizDensaFixnum.new(2, 2)

        # Inicializar m1, m2
        @m1[0, 0] = 1
        @m1[0, 1] = 2
        @m1[1, 0] = 7
        @m1[1, 1] = 3
      
        @m2[0, 0] = 3
        @m2[0, 1] = 4
        @m2[1, 0] = 1
        @m2[1, 1] = 2
      end
  

      # Inicializar m3, la matriz resultado, para cada operación
    
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
    end
    #Dispersas
    #Densas-dispersas
  end

  # FRACCIONES
  describe "Operaciones con fracciones" do
    describe "Matrices densas" do
      before :all do
        # Crear matrices m1, m2, m3
        @m1 = MatrizDensaFraccion.new(2, 2)
        @m2 = MatrizDensaFraccion.new(2, 2)
        @m3 = MatrizDensaFraccion.new(2, 2)
      
        # Inicializar m1, m2
        @m1[0, 0] = 1/2
        @m1[0, 1] = 2/2
        @m1[1, 0] = 7/2
        @m1[1, 1] = 3/2
      
        @m2[0, 0] = 3/3
        @m2[0, 1] = 4/3
        @m2[1, 0] = 1/3
        @m2[1, 1] = 2/3
      end

      # Inicializar m3, la matriz resultado, para cada operación
    
      it "Deben poder sumarse 2 matrices" do
        @m3[0, 0] = 3/2
        @m3[0, 1] = 7/3
        @m3[1, 0] = 23/6
        @m3[1, 1] = 13/6
      
        (@m1+@m2).should eq(@m3)
      end
      it "Deben poder restarse 2 matrices" do
        @m3[0, 0] = -1/2
        @m3[0, 1] = -1/3
        @m3[1, 0] = 19/6
        @m3[1, 1] = 5/6
      
        (@m1-@m2).should eq(@m3)
      end
      it "Deben poder multiplicarse 2 matrices" do
        @m3[0, 0] = 5/6
        @m3[0, 1] = 4/3
        @m3[1, 0] = 4
        @m3[1, 1] = 17/3
      
        (@m1*@m2).should eq(@m3)
      end
      it "Deben poder compararse 2 matrices" do
        @m3[0, 0] = 1/2
        @m3[0, 1] = 2/2
        @m3[1, 0] = 7/2
        @m3[1, 1] = 3/2
      
        @m1.should eq(@m3)
      end
    end
    #Dispersas
    #Densas-dispersas
  end

  # TIPOS DIFERENTES
  describe "Operaciones con tipos diferentes" do
    describe "Matrices densas" do
      before :all do
        # Crear matrices m1, m2, m3
        @m1 = MatrizDensaFixnum.new(2, 2)
        @m2 = MatrizDensaFraccion.new(2, 2)
        @m3 = MatrizDensaFraccion.new(2, 2) #El resultado se almacena en forma de fracción para una mayor precisión
      
        # Inicializar m1, m2
        @m1[0, 0] = 1
        @m1[0, 1] = 2
        @m1[1, 0] = 3
        @m1[1, 1] = 4
      
        @m2[0, 0] = 5/2
        @m2[0, 1] = 4/2
        @m2[1, 0] = 1/2
        @m2[1, 1] = 3/2
      end
    
      it "Deben poder sumarse 2 matrices" do
        @m3[0, 0] = 7/2
        @m3[0, 1] = 4/1
        @m3[1, 0] = 7/2
        @m3[1, 1] = 11/2
      
        (@m1+@m2).should eq(@m3)
      end
      it "Deben poder restarse 2 matrices" do
        @m3[0, 0] = -3/2
        @m3[0, 1] = 0/1
        @m3[1, 0] = 5/2
        @m3[1, 1] = 5/2
      
        (@m1-@m2).should eq(@m3)
      end
      it "Deben poder multiplicarse 2 matrices" do
        @m3[0, 0] = 7/2
        @m3[0, 1] = 5
        @m3[1, 0] = 17/2
        @m3[1, 1] = 12/1
      
        (@m1*@m2).should eq(@m3)
      end
      it "Deben poder compararse 2 matrices" do
        @m3[0, 0] = 1/1
        @m3[0, 1] = 2/1
        @m3[1, 0] = 3/1
        @m3[1, 1] = 8/2
      
        @m1.should eq(@m3)
      end
    end
    #Dispersas
    #Densas-dispersas
  end
end

describe Prct09::MatrizDispersa do

end
