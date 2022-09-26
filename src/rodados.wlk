import wollok.game.*
import direcciones.*
import colores.*
import paredess.*


class Corsa {
	var color 
	var property position = new Position(x=0,y=0) // game.at(0,0) // game.origin()
	var property image = color.image()
	const posiciones = [self.position()]
	const property resistencia = -1
	
	method capacidad() = 4
	method velocidad() = 150
	method peso() = 1300
	method color() = color
	
	method moverseHacia(direccion) {
		position = direccion.nuevaUbicacion(position)
		posiciones.add(position)
	}
	
	method pasoPor(posicion) = posiciones.contains(posicion)
	
	method pasoPorFila(numero) = self.filasPorLasQuePaso().contains(numero)
	method filasPorLasQuePaso() = posiciones.map({p=>p.x()})
	
	method recorrioFilas(lista_de_numeros) = 
		lista_de_numeros.asSet().intersection(self.filasPorLasQuePaso().asSet()) == lista_de_numeros.asSet()
//		lista_de_numeros.asSet().difference(self.filasPorLasQuePaso().asSet()) == #{}

	method chocarContra(otro) {
		otro.impacto()
		if(otro.resistencia() != 0 ) {
			self.position(posiciones.get(posiciones.size()-2))
			posiciones.add(position)
		}
	}
	
	method impacto() {
		
	}
}

class Kwid {
	var property tieneTanqueAdicional = false
	
	method capacidad() {
		if(tieneTanqueAdicional) {return 3}
		else {return 4}
	}
	method velocidad() = if(tieneTanqueAdicional) 120 else 110
	method peso() = 1200 + if(tieneTanqueAdicional) 150 else 0
	method color() = "azul"
}

object trafic {
	var property motor = motorBataton
	var property interior = interiorPopular
	
	method velocidad() = motor.velocidad()
	method capacidad() = interior.capacidad()
	method peso() = 4000 + interior.peso() + motor.peso()
	method color() = "blanco"
}

object interiorComodo {
	method capacidad() = 5
	method peso() = 700
}

object interiorPopular {
	method capacidad() = 12
	method peso() = 1000
}

object motorBataton {
	method peso() = 500
	method velocidad() = 80
}

object motorPulenta {
	method peso() = 800
	method velocidad() = 130
}

class AutoEspecial {
	var property capacidad
	var property velocidad
	var property peso
	var property color
}