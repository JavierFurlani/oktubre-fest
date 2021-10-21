class MarcasDeCerveza {
	var property contenidoLupuloPorLitro
	var property paisFabricacion
	method graduacion()
}

object graduacionReglamentaria {
	var property graduacion = 10
}

class Rubia inherits MarcasDeCerveza {
	
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

class Jarras {
	var property capacidad
	var property marca
}