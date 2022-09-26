import wollok.game.*

class Pared {
	var property resistencia = 3
	var property image = "paredLadrillos3.jpg"
	var property position = game.at(0.randomUpTo(game.width()-1).truncate(0),0.randomUpTo(game.height()-1).truncate(0))
	
	method impacto() {
		resistencia = 0.max(resistencia - 1)
		if(resistencia > 0) image = "paredLadrillos" + resistencia +".jpg"
		else game.removeVisual(self)
	}
	
}
