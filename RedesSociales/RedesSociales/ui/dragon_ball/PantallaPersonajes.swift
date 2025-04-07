//
//  PantallaPersonajes.swift
//  RedesSociales
//
//  Created by alumno on 4/4/25.
//


import SwiftUI

struct PantallaPersonajes: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            if controlador.pagina_resultados != nil {
                
                ScrollView {
                    LazyVStack {
                        ForEach(controlador.pagina_resultados!.items) { personaje in
                            NavigationLink{
                                DetallesPersonaje()
                            }label: {
                                Text("\(personaje.name)")
                                    .font(.system(size: 30))
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.orange)
                                
                                AsyncImage(url: URL(string: personaje.image)) { image in
                                    image
                                        .image?.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 150, height: 250)
                                        .frame(maxWidth: .infinity)
                                        .background(Color.blue)
                                }
                                
                                Text("Raza:  \(personaje.race)")
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .bold()
                                
                                Text("Nivel de poder:  \(personaje.ki)")
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .bold()
                                
                                Spacer()
                            }
                            .simultaneousGesture(TapGesture().onEnded({
                                controlador.seleccionar_personaje(personaje)
                            }))
                            
                        }
                    }
                }
                
            
            }
        }
    }
}

#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
