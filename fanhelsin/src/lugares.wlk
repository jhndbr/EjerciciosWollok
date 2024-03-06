class Lugares{
	const ataques =#{}
	var property diaDestruccion
	method resistencia()
	 
	method nigmareTeam(){
		return ataques.map({ataque=>ataque.mountruoMasPeligroso()}).asSet()
	}
	
	method fueDestruido(ataque){
		return self.resistencia() < ataque.nivelsDevastacion()
	}
	method fechasDeAtaque(){
		return ataques.map({ataque=>ataque.fechaAtaque()})
	}
	
	method estabaDestruidaAntesDelultimoAtaque(){
		return ataques.fold(self.fechasDeAtaque().head(),{ataque=>})
	}
	method recibirAtaque(ataque){
		ataques.add(ataque)
		if (self.fueDestruido(ataque)){
			self.diaDestruccion(ataque.fechaAtaque())
		}
	}
}

class Aldea inherits Lugares{
	const casas = []
	override method resistencia(){
		return casas.sum({casa=>casa.resistenciaCasa()})
	}
	
}
class Castillo inherits Lugares{
	var resistenciaCastillo
	const resistenciaBase = 3000
	override method resistencia(){
		return resistenciaCastillo + resistenciaBase
	}
}


class Ataque {
	const fecha 
	const mounstruos =#{}
	
	method fechaAtaque()=fecha
	method mountruosAtaque()=mounstruos
	
	method mountruoMasPeligroso(){
		return mounstruos.max({mounstruo=>mounstruo.peligrosidad()})
	}
	method cantidadMountruosMasMalos(){
		return self.mounstruosMasMalos().size()
	}
	method mounstruosMasMalos() {
		return mounstruos.filter({mounstruo => mounstruo.esMasMalo()})
	}
	method AtaqueSerio(unAtaque){
		return unAtaque.cantidadMountruosMasMalos()>3
	}
	method nivelsDevastacion(){
		return mounstruos.sum({mounstruo=>mounstruo.peligrosidad()})
	}
	
	
}

class Casa {
	var resistenciaCasa
	method resistenciaCasa()=resistenciaCasa
}