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
            .fontWeight(.bold)
            .foregroundColor(.white)  
            .font(.system(size: 25))
            .frame(maxWidth: .infinity)
            .background(Color.black)
         
        Text("\(controlador.publicacion_seleccionada?.body ?? "Valor por defecto")")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.black)

        Spacer()
        NavigationLink{
            PerfilBasicoVista()
        }label: {
        Text("Ver perfil")
        }.simultaneousGesture(TapGesture().onEnded({
            controlador.ver_perfil(id: controlador.publicacion_seleccionada!.userId)
        })).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .font(.system(size: 15))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
       
       
        
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
