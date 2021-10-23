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
    
    method entraUnoMas() {
    	return self.cantidadPersonasEnCarpa() < limiteDeGenteAdmitida   	
    }
    
    method dejaIngresar(persona) {
    	return self.entraUnoMas() and not persona.estaEbria()
    }
    
    method servirCerveza(persona, capacidadJarra) {
    	const jarra = new Jarras(capacidad = capacidadJarra, marca = marcaDeCerveza)
    	if (personasEnCarpa.contains(persona)) {
    		persona.agregarJarra(jarra)
    	}
    	// return if (personasEnCarpa.contains(persona)) true 
    	else throw new Exception(message = "La persona no está en la carpa.")
    }
    
    method cantEbriosEmpedernidos() {
    	return personasEnCarpa.count{persona => persona.esEbrioEmpedernido()} 
    }
}
