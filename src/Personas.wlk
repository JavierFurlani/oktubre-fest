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
	
	method paisDeNacimiento()
	
	method quiereEntrar(carpa) {
		return self.leGusta(carpa.marcaDeCerveza()) && leGustaMusicaTradicional == carpa.tocaBandaTradicional()
	}
	
	method entrarACarpa(carpa) {
		carpa.agregarPersonaEnCarpa(self)
	}
	
	method esEbrioEmpedernido() {
		return self.estaEbria() and jarrasCompradas.all{jarra => jarra.capacidad() >= 1}
	}
	
	method esPatriota() {
		return jarrasCompradas.all{jarra => jarra.marca().hechaEn() == self.paisDeNacimiento()}
	}
}

class PersonaBelga inherits Persona {
	override method paisDeNacimiento() = belgica
	
	
	override method leGusta(cerveza) {
		return cerveza.contenidoLupuloPorLitro() > 4
	}
}

class PersonaAlemana inherits Persona {
	override method paisDeNacimiento() = alemania
	
	override method leGusta(cerveza) {
		return true
	}

	override method quiereEntrar(carpa) {
		return super(carpa) && carpa.cantidadPersonasEnCarpa().even()
	}
}

class PersonaCheca inherits Persona {
	override method paisDeNacimiento() = republicaCheca
	
	override method leGusta(cerveza) {
		return cerveza.graduacion() > 0.08
	}
}