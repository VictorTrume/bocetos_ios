//
//  publicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI
let publicacion_falsa = Publicacion(userId: 1, id: 1, title: "Lorem ipsum", body: "Et dolor sit amet")

struct PublicacionVista: View{

    @Environment(ControladorAplicacion.self) var controlador
    
    
    //var publicacion_a_mostrar = controlador.publicacion_seleccionada
    
    var body: some View{
        
        Text("\(controlador.publicacion_seleccionada?.title ?? "Valor por defecto")")
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .font(.system(size: 25))
            .background(Color.black)
            
            .frame(maxWidth: .infinity)
        Text("\(controlador.publicacion_seleccionada?.body ?? "Valor por defecto")")
            .foregroundColor(.white)
            .background(Color.black)
            .frame(maxWidth: .infinity)
        Spacer()
        NavigationLink{
            PerfilBasicoVista()
        }label: {
        Text("Ver perfil")
        }.simultaneousGesture(TapGesture().onEnded({
            controlador.ver_perfil(id: controlador.publicacion_seleccionada!.userId)
        })).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .font(.system(size: 15))
            .background(Color.blue)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .cornerRadius(80)
        
        ScrollView{
            VStack{
                ForEach(controlador.comentarios){ comentario in
                    Text("Usuario: \(comentario.name)")
                    Text("\(comentario.body)")
                    
                }
            }
        }
    }
    
        
}

#Preview {
    NavigationStack{
        PublicacionVista()
            .environment(ControladorAplicacion())
    }
}
