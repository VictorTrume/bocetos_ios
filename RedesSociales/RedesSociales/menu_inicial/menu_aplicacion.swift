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
        
          Text("Hola mundo")
                .tabItem{Label("Es esta pantalla",
                               systemImage: "curcke")}
            
            Text("Hola dos")
                .tabItem{
                    Label{
                        Text("Dragon Ball DB")
                        Text("Esto es un segundo click")
                    } icon: {
                        Circle()
                            .frame(width: 44,height: 44,
                        alignment: .center)
                            .overlay(Text("Paquito el paco"))
                    }
                }
            Text("Hola desde pantalla 3")
                .tabItem { Label("Etiqueta de esta label",
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
