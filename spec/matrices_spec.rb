require "prct09"

describe Prct09::Matriz do

end

describe Prct09::MatrizDensa do
  it "Nada" do
    @m1 = Prct09::MatrizDensa.new(1,2)
    @m1.filas.should eq(1)
  end
end

describe Prct09::MatrizDispersa do

end
