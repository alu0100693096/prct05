# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion

require "./racional.rb"
require "test/unit"

class Test_Fraccion < Test::Unit::TestCase

	def test_suma
    		assert_equal("5/3", Fraccion.new(2,3).suma(Fraccion.new(1,1)).to_s )
  	end

	def test_resta
		assert_equal("11/10", Fraccion.new(3,2).resta(Fraccion.new(2,5)).to_s )
	end

	def test_producto
		assert_equal("5/8", Fraccion.new(15,3).producto(Fraccion.new(1,8)).to_s )
	end
	
	def test_division
		assert_equal("2/3", Fraccion.new(4,2).division(Fraccion.new(3,1)).to_s )
	end

	def test_typecheck #Dará error, porque varias veces se comparan los parametros con enteros en la clase
		assert_raise( RuntimeError ) { Fraccion.new('2', '4') }
	end

	def test_failure
		assert_equal("3,4", Fraccion.new(1,2).suma(Fraccion.new(4,2)).to_s, "Suma fallida" )
	end
	
end
