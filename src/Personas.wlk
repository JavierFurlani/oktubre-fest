import Marcas.*
import Carpas.*

class Persona {
	var property peso
	const property jarrasCompradas = []
	var property leGustaMusicaTradicional
	var property nivelDeAguante
	
	method agregarJarra(jarra) {
		jarrasCompradas.add(jarra)
	}
	
	method estaEbria() {
		return self.totalDeAlcohol() * self.peso() > nivelDeAguante
	}
	
	method totalDeAlcohol() {
		return jarrasCompradas.sum({ jarra => jarra.contenidoDeAlcohol() })
	}

	method leGusta(cerveza)
	
	method quiereEntrar(carpa) {
		return self.leGusta(carpa.marcaDeCerveza()) && leGustaMusicaTradicional == carpa.tocaBandaTradicional()
	}
	
	method puedeEntrar(carpa) {
		return self.quiereEntrar(carpa) && carpa.dejaIngresar(self)
	}
	
	method entre(carpa) {
		return if (self.quiereEntrar(carpa) && self.puedeEntrar(carpa)) true else
		throw new Exception(message = "La persona no puede ingresar a la carpa.")
		
	}
}

class PersonaBelga inherits Persona {
	
	override method leGusta(cerveza) {
		return cerveza.contenidoLupuloPorLitro() > 4
	}
}

class PersonaAlemana inherits Persona {
	
	override method leGusta(cerveza) {
		return true
	}

	override method quiereEntrar(carpa) {
		return super(carpa) && carpa.personasEnCarpa().size().even()
	}
}

class PersonaCheca inherits Persona {
	
	override method leGusta(cerveza) {
		return cerveza.graduacion() > 0.08
	}
}