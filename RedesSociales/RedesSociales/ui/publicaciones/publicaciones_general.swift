//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI


struct GeneralPublicaciones: View{
    //@StateObject var controlador = ControladorPublicaciones()
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(controlador.publicaciones){ publicacion in
                        NavigationLink{
                            PublicacionVista()
                        } label: {
                            HStack{
                                Text("\(publicacion.id)")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .font(.system(size: 20))
                                
                                   
                                VStack{
                                    Text("\(publicacion.title)")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .font(.system(size: 25))
                                        .frame(maxWidth: .infinity)
                                    Text("\(publicacion.body)")
                                        .frame(maxWidth: .infinity)
                                    
                                }
                                
                                
                            }.background(Color.black)
                                .foregroundColor(.white)
                                .padding()
                                .cornerRadius(80)
                            
                             
                                
                        }  .simultaneousGesture(TapGesture().onEnded({
                            controlador.seleccionar_publicacion(publicacion)
                        }))
                    }
                    
                }
            }
            .onAppear{
                print("hola mundo")
                
            }
        }
    }
}


#Preview {
    GeneralPublicaciones()
        .environment(ControladorAplicacion())
}
