//
//  vista_modelo_basico.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import Foundation

@Observable

class VistaModeloBasico{
    var estado_actual_de_la_aplicacion: EstadosAplicacion = .mostrando_series
    
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie(serie: InformacionSerie? = nil) -> Bool{
        if let serie_nueva = serie{
            if serie_nueva.nombre == ""{
               return false
            }
            series_registradas.append(serie_nueva)
        }
        else{
            series_registradas.append(InformacionSerie(nombre: "purueba", tipo: "Prueba", fecha_estreno: 2017, sinopsis: "Aqui va mi sinopsis", caraturla: "caratula.png"))
        }
        estado_actual_de_la_aplicacion = .mostrando_series
       return true
    }
    
    func cambiar_a_agregar_serie () -> Void{
        estado_actual_de_la_aplicacion = .agregando_series
    }
}
