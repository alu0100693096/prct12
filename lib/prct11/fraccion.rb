module Prct11

#Clase que permite representar fracciones y realizar operaciones entre ellas
class Fraccion
    include Comparable
    #num=Numerador. denom=Denominador.
    attr_reader :num, :denom

    #Función para inicializar el objeto de tipo fracción.
    def initialize(n,d)
        raise 'El denominador no puede ser 0' unless d != 0
        @num, @denom = n, d

        if n == 0
            @denom = 1
        else
            reducir
        end
    end

    #Función para transformar la fracción a un String.
    def to_s
        "#{num}/#{denom}"
    end

    #Función para calcular el resultado del cociente en Float.
    def to_f
        # to_f pasa a número flotante
        (@num.to_f/@denom.to_f)
    end

    #Función que sirve para realizar las operaciones de comparación.
    def <=>(other)
        if !(other.is_a? Fraccion)
            other = Fraccion.new(other, 1)
        end
        d = @denom * other.denom
        (d/@denom)*@num <=> (d/other.denom)*other.num
    end

    #Función para sumar una fracción con otro elemento.
    def +(other)
        if !(other.is_a? Fraccion)
            other = Fraccion.new(other, 1)
        end
        d = @denom * other.denom
        Fraccion.new((d/@denom)*@num + (d/other.denom)*other.num, d)
    end

    #Función para restar una fracción con otro elemento.
    def -(other)
        if !(other.is_a? Fraccion)
            other = Fraccion.new(other, 1)
        end
        d = @denom * other.denom
        Fraccion.new((d/@denom)*@num - (d/other.denom)*other.num, d)
    end

    #Función para multiplicar una fracción con otro elemento.
    def *(other)
        if !(other.is_a? Fraccion)
            Fraccion.new(@num*other, @denom)
        else
            Fraccion.new(@num*other.num, @denom*other.denom)
        end
    end

    #Función para dividir una fracción con otro elemento.
    def /(other)
        if !(other.is_a? Fraccion)
            Fraccion.new(@num, @denom*other)
        else
            Fraccion.new(@num*other.denom, @denom*other.num)
        end
    end

    #Función para hallar el módulo de dos fracciones. 
    #Como siempre será cero, devolverá la fracción 0/1.
    def %(other)
        Fraccion.new(0, 1)
    end

    #Función para hallar la fracción cambiada de signo.
    def -@
        Fraccion.new(-@num, @denom)
    end
    
    #Función que permite operaciones con un entero. La operación retorna una fracción.
    def coerce(other)
        [Fraccion.new(other, 1), self]
    end

    #Función para hallar el valor absoluto de una fracción.
    def abs
        # En el método initialize se llama a "reducir", así que está
        # garantizado que si es negativo, será el numerador el que tenga el
        # signo.
        Fraccion.new(@num.abs, @denom)
    end

    #Función para hallar la inversa de una fracción.
    def rec
        # Damos la vuelta a la fracción.
        Fraccion.new(@denom, @num)
    end

private

    #Función que pasa la fracción actual a su forma más reducida y coloca el signo de la 
    #fracción en el numerador.
    def reducir
        # Si alguno es negativo, que sea el numerador. Si ambos son negativos,
        # se pasan a positivos.
        if @denom < 0
            @num = -@num
            @denom = -@denom
        end

        # Para reducir la fracción se dividen numerador y denominador entre el
        # máximo común divisor de ambos.
        mcd = gcd(@num, @denom)
        if mcd != 0
            @num /= mcd
            @denom /= mcd
        end
    end

    #Función para calcular el máximo común divisor entre dos números enteros a y b.
    def gcd(a, b)
        a,b = a.abs, b.abs
        while b != 0
            a, b = b, a % b
        end
        a
    end

end #-- class Fraccion

end #-- module Prct11
