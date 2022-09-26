import wollok.game.*

object norte {
	method nuevaUbicacion(unaPosition) { return
		if(unaPosition.y() != game.height()-1) unaPosition.up(1)
		else new Position(x=unaPosition.x(),y=0)
	}
}

object sur {
	method nuevaUbicacion(unaPosition) { return
		if(unaPosition.y() != 0) unaPosition.down(1)
		else new Position(x=unaPosition.x(),y=game.height()-1)
	}	
}

object este {
	method nuevaUbicacion(unaPosition) { return
		if(unaPosition.x() != game.width()-1) unaPosition.right(1)
		else new Position(x=0,y=unaPosition.y())
	}
}

object oeste {
	method nuevaUbicacion(unaPosition) { return
		if(unaPosition.x() != 0) unaPosition.left(1)
		else new Position(x=game.width()-1,y=unaPosition.y())
	}	
}