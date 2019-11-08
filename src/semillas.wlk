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
	
	method parcelaIdeal(parcela)
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
	
	override method parcelaIdeal(parcela){
		return parcela.superficie() > 6
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
	
	override method parcelaIdeal(parcela){
		return (parcela.horasDeSol() == self.cuantasHorasSolTolera())
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
	
	override method parcelaIdeal(parcela){
		return parcela.plantas().all({p=> p.altura < 1.5})
	}
}

class SojaTransgenica inherits Soja {
	override method daSemillas(){
		return false
	}
	
	override method parcelaIdeal(parcela){
		return (parcela.cantidadMaxDePlantas() == 1)
	}
}

class HiedraBuena inherits Menta {
	
	override method espacioQueOcupa(){
		return super() * 2
	}
}




