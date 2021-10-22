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
    	if (persona.puedeEntrar())
    	personasEnCarpa.add(persona)
    }
    
    method dejaIngresar(persona) {
    	return personasEnCarpa.size() < limiteDeGenteAdmitida and not persona.estaEbria()
    }
    
    method servirCerveza(persona, capacidadJarra) {
    	const jarra = new Jarras(capacidad = capacidadJarra, marca = marcaDeCerveza)
    	return if (personasEnCarpa.contains(persona)) true else
    	throw new Exception(message = "La persona no puede ingresar a la carpa.")
    }
}
