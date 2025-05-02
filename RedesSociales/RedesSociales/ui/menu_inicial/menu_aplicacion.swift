//
//  menu_aplicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/31/25.
//

import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        TabView{
            
            GeneralPublicaciones()
                .tabItem { Label("En esta pantallas", systemImage:
                "circle") }
                .badge(controlador.publicaciones.count)
        
            PlanetasList()
                .tabItem{Label("Planeta",
                               systemImage: "circle")}
            
            PantallaPersonajes()
                .tabItem{Label("Dragon Ball DB",
                                    systemImage: "circle")}
            PerfilBasicoVista()
            
                .tabItem { Label("Usuario",
                systemImage: "circle") }
            /*
            Tab("Etiqueta", systemImage: "Perfil"){
                Text("Referencia a la pantalla")
            }
             */
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
