import wollok.game.*

class Tile {
	var property number = 1
	var property image ="paredLadrillos" + number +".jpg"
	var property position = game.center()
	const property resistencia = -1
	
	method cambiarImagenes() {
		number++
		self.image("paredLadrillos" + number +".jpg")
		if(number == 3) number = 0
	}
	
	method impacto() {}
	
}