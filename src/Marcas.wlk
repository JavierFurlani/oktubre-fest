object alemania {}
object republicaCheca {}
object belgica {}
object mexico {}
object irlanda {}

class MarcasDeCerveza {
	var property contenidoLupuloPorLitro
	var property hechaEn
	method graduacion()
}

object graduacionReglamentaria {
	const property graduacion = 10.5
}

class Rubia inherits MarcasDeCerveza {
	const graduacion
	
	override method graduacion() {
		return graduacion
	}
}

class Negra inherits MarcasDeCerveza {
	
	override method graduacion() {
		return graduacionReglamentaria.graduacion().min(contenidoLupuloPorLitro * 2)
	}
}

class Roja inherits Negra {
	override method graduacion() {
		return super() * 1.25
	}
}

class Jarra {
	var property capacidad
	var property marca
	
	method contenidoDeAlcohol() {
		return self.capacidad() * (marca.graduacion() / 100)
	}
	
}