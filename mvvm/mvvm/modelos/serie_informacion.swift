//
//  aqui_guarda_sus_modelos.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//
import Foundation

struct Temporada{
    var nombre: String
    var cantidad_capitulos: Int
}
struct Plataforma{
    var nombre: String
    var icono: String
}

struct InformacionSerie: Identifiable{
    var id: InformacionSerie = .self
    
    var nombre: String
    var tipo: String
    
    
    var plataformas: [String] = [] // Aqui tengo una deuda tecnica para indicar otras plataformas de forma mas facil.
    
    var fecha_estreno: Int
    var sinopsis: String
    
    var temporadas: [Temporada] = []
    
    var caraturla: String
    
    
}
