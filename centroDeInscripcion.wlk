import elAlambiqueViajero.*


object centroDeInscripcion {
    var lugarDeCarrera = paris
    const vehiculosEnCarrera = []
    const vehiculosRechazados = []

    method inscribir(unAuto) {
        if (lugarDeCarrera.puedeLlegar(unAuto)) {
            vehiculosEnCarrera.add(unAuto)
    } else {
        vehiculosRechazados.add(unAuto)
    }
    }

    method lugarDeCarrera() {
        return lugarDeCarrera
    }

    method vehiculosEnCarrera () {
        return vehiculosEnCarrera
    }

    method vehiculosRechazados() {
        return vehiculosRechazados
    }

    method replanificarCarreraEn(unLugar) {
        lugarDeCarrera = unLugar

        vehiculosEnCarrera.addAll(vehiculosRechazados.filter({c => unLugar.puedeLlegar(c)}))
        vehiculosRechazados.removeAll(vehiculosRechazados.filter({c => unLugar.puedeLlegar(c)}))
    
        vehiculosRechazados.addAll(vehiculosEnCarrera.filter({c => not unLugar.puedeLlegar(c)}))
        vehiculosEnCarrera.removeAll(vehiculosEnCarrera.filter({c => not unLugar.puedeLlegar(c)}))
    }


    method iniciarCarrera() {
        vehiculosEnCarrera.forEach({c => c.desgaste()})
        return self.ganadorDeCarrera(vehiculosEnCarrera)
    }

    method ganadorDeCarrera(vehiculos) {
        return vehiculosEnCarrera.max({c => c.nivelDeVelocidad()})
    }
 }