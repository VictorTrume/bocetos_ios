//
//  agregar_serie.swift
//  mvvm
//
//  Created by alumno on 3/19/25.
//

import SwiftUI

struct AgregarSerie: View {
    @Environment(VistaModeloBasico.self) private var controlador
    @State var nombre_de_la_serie: String = ""
    @State var tipo_de_la_serie: String = ""
    @State var plataformas: [Plataforma] = [
        Plataforma(nombre: "Hulu", icono: "Icono Plus"),
        Plataforma(nombre: "Netflix", icono: "Icono Plus"),
        Plataforma(nombre: "MAX", icono: "Icono Plus"),
        Plataforma(nombre: "Disney +", icono: "Icono Plus"),
        Plataforma(nombre: "Tubi", icono: "Icono Plus"),
        Plataforma(nombre: "TvAbierta", icono: "Icono Plus"),
    ]
    @State var indicar_problemas: Bool = false
    
    var body: some View {
        Text("Hola mundo")
        TextField("El nombre de la serie", text: $nombre_de_la_serie)
        if indicar_problemas{
            Text("Tu serie no tiene nombre y no jala jajajajajaja")
        }
        TextField("Tipo", text: $tipo_de_la_serie)
        
        Spacer()
        Text("Plataformas")
        ScrollView{
            
            HStack{
                ForEach(plataformas){ plataforma in
                    Text(plataforma.nombre)
                    
                }
            }
        }
       
        Button("Agregar Plataforma"){
            print("Agregar una plataforma que falta implementar")
        }
        
        Button("Agregar serie"){
            print("agregando serie")
            
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, tipo: tipo_de_la_serie,plataformas: plataformas, fecha_estreno: 1, sinopsis: "Pasa cosas", caraturla:"portada.jpg" )
            
            indicar_problemas =   !controlador.agregar_serie(serie: serie_nueva)
          
        }
    }
}
/*
 var nombre: String
 var tipo: String
 
 
 var plataformas: [Plataforma] = [] // Aqui tengo una deuda tecnica para indicar otras plataformas de forma mas facil.
 
 var fecha_estreno: Int
 var sinopsis: String
 
 var temporadas: [Temporada] = []
 
 var caraturla: String
 */

#Preview {
  AgregarSerie()
        .environment(VistaModeloBasico())
}
