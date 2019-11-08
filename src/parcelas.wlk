class Parcela {
	var property ancho = 1
	var property  largo = 1
	var property horasDeSol = 1
	var property plantas = []
	
	method agregarPlanta(planta){
		plantas.add(planta)
	}
	
	method sacarPlanta(planta){
		plantas.remove(planta)
	}
	
	method superficie(){
		return ancho * largo
	}
	
	method cantidadMaxDePlantas(){
		return if (ancho > largo){
			self.superficie() / 5
		}else{
			(self.superficie() / 3) + largo
		}
	}
	
	method tieneComplicaciones(){
		return (plantas.any({p=> p.cuantasHorasSolTolera() < horasDeSol}))
	}
	
	method condNoPlantarDeMas(){
		return self.cantidadMaxDePlantas() == plantas.size()
	}
	
	method condHorasDeSol(planta){
		return horasDeSol - planta.cuantasHorasSolTolera() <= 2 // ver bien este
														// tipo de condiciones!!!!
	}
	
	
	method plantarUnaPlanta(planta){
		if (self.condNoPlantarDeMas() or self.condHorasDeSol(planta)){
		self.error("no se puede plantar")
		} else{
			self.agregarPlanta(planta)
		}	
	}
	
}
