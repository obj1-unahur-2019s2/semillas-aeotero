class Planta{
	
	var property anioDeObtencion = 1990 	// inicializar con valores posibles
	var property altura = 1				// inicializar con valores posibles
	
	method cuantasHorasSolTolera()
	method esFuerte(){
		return (self.cuantasHorasSolTolera() > 10)
	}
	method daSemillas(){
		return (self.esFuerte())
	}
	method espacioQueOcupa()
}


class Menta inherits Planta {
	
	override method cuantasHorasSolTolera(){
		return 6
	}
	
	override method daSemillas(){
		return ( super() or altura > 0.4)
	}
	
	override method espacioQueOcupa(){
		return (altura*3)
	}
}

class Soja inherits Planta{
	
	override method cuantasHorasSolTolera(){
		return if (altura < 0.5){
			 6
		}else if (altura <= 1){
			 7
		}else{
			 9
		}
	}
	
	method semillaPosteriorAl2007(){
		return (anioDeObtencion > 2007)
	}
	
	method alturaMayorA1Mts(){
		return (altura >= 1)
	}
	
	override method daSemillas(){
		return (super() or self.semillaPosteriorAl2007() and self.alturaMayorA1Mts())
	}
	
	override method espacioQueOcupa(){
		return (altura / 2)
	}
}

class Quinoa inherits Planta {
	var property horasDeTolerancia = 0
	
	override method cuantasHorasSolTolera(){
		return horasDeTolerancia
	}
	
	override method espacioQueOcupa(){
		return (0.5)
	}
	
	method semillaAnteriorAl2005(){
		return (anioDeObtencion < 2005)
	}
	
	override method daSemillas(){
		return (super() or self.semillaAnteriorAl2005())
	}
}




