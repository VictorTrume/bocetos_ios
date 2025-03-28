//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 3/28/25.
//

import SwiftUI

struct PerfilBasicoVista: View{
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Cosme Fulanito")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Roger")")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "quetevalga@simios.com")")
            .onDisappear(){
                print("Adios papus")
            }
    }
}

#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
