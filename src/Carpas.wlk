import Marcas.*
import Personas.*

class Carpa { 
    const property limiteDeGenteAdmitida
    var property personasEnCarpa = []
    var property tocaBandaTradicional
    var property marcaDeCerveza
    
    method cantidadPersonasEnCarpa() {
    	return personasEnCarpa.size()
    }
    
    method agregarPersonaEnCarpa(persona) {
    	if (self.puedeEntrar(persona))
    		personasEnCarpa.add(persona)
    	else throw new Exception(message = "La persona no puede ingresar a la carpa.")
    }
    
    method entraUnoMas() {
    	return self.cantidadPersonasEnCarpa() < limiteDeGenteAdmitida   	
    }

    method dejaIngresar(persona) {
    	return self.entraUnoMas() and not persona.estaEbria()
    }
    
	method puedeEntrar(persona) {
		return persona.quiereEntrar(self) and self.dejaIngresar(persona)
	}
    
    method servirCerveza(persona, capacidadJarra) {
    	const jarra = new Jarra(capacidad = capacidadJarra, marca = marcaDeCerveza)
    	if (personasEnCarpa.contains(persona)) {
    		persona.agregarJarra(jarra)
    	}
    	else throw new Exception(message = "La persona no está en la carpa.")
    }
    
    method cantEbriosEmpedernidos() {
    	return personasEnCarpa.count{persona => persona.esEbrioEmpedernido()} 
    }
}
