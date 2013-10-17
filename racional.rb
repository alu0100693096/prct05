# Implementar en este fichero la clase para crear objetos racionales

require "./gcd.rb"

class Fraccion
attr_reader :a,:b
     
	def initialize(a,b)
                		
		#Si b es 0, se le asigna 1, ya que no puede valer 0 el denominador
		if (b == 0)
			puts "El denominador no puede ser cero. Se le ha asignado 1 por defecto"
			b = 1
		end

		#Por comodidad, evitamos los negativos, sobretodo en el denominador

		if a < 0 && b < 0 # si ambos son negativos, - y - se anulan
			a = a.abs
			b = b.abs
		elsif b < 0 # a/-b es lo mismo que -a/b
			a = a * (-1)
			b = b.abs
		end

		#simplificacion
		gd = gcd(a,b)
                a = a/gd
                b = b/gd
		
	        @a, @b = a, b

	end

	def to_s #mostrar por pantalla el racional
		if a == 0 #si a vale 0, el valor total es 0
			return "0"
		elsif b == 1 #si b vale 1, no tiene por que mostrarse
			return "#{@a}"
		else
			return "#{@a}/#{@b}"
		end
	end
	
	def suma(other)
		y = mcm(@b,other.b) #se halla el minimo comun multiplo por si los denominadores no son iguales. Si son distintos, no se pueden sumar tal cual.
		x = (@a * (y/@b) + other.a * (y/other.b))
		#simplificamos a la minima expresion
		gd = gcd(x,y) 
		x = x/gd
		y = y/gd
		Fraccion.new(x,y)
	end
	
	def resta(other)
		y = mcm(@b, other.b) #se halla el minimo comun multiplo por si los denominadores no son iguales. Si son distintos, no se pueden restar tal cual.
		x = (@a * (y/@b) - other.a * (y/other.b))
		#simplificamos a la minima expresion
		gd = gcd(x,y)
		x = x/gd
		y = y/gd
		Fraccion.new(x,y)
	end
	
	def producto(other)
		x = @a * other.a
		y = @b * other.b
		#simplificacion
		gd = gcd(x,y)
		x = x/gd
		y = y/gd
		Fraccion.new(x,y)
	end

	def division(other)
		x = @a * other.b
		y = @b * other.a
		#simplificacion
		gd = gcd(x,y)
		x = x/gd
		y = y/gd
		Fraccion.new(x,y)
	end

	def mcm(u, v) #creo una funcion para poder hacer el minimo comun multiplo
		x = u
		y = v
		while x != y
			if x < y
				x = x+u
			elsif x > y
				y = y+v
			end
		end
		x
	end


end
