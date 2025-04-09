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
        NavigationStack{
        ZStack {
            Color.orange.ignoresSafeArea()
            
            if controlador.pagina_resultados != nil {
                
                ScrollView {
                    LazyVStack {
                        ForEach(controlador.pagina_resultados!.items) { personaje in
                            NavigationLink{
                                DetallesPersonaje()
                            } label: {
                                VStack{
                                    Text("\(personaje.name)")
                                        .font(.system(size: 30))
                                        .bold()
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .background(Color.blue)
                                    
                                    
                                    AsyncImage(url: URL(string: personaje.image)) { image in
                                        image
                                            .image?.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 150, height: 250)
                                            .frame(maxWidth: .infinity)
                                            
                                    }
                                    
                                    Text("Raza:  \(personaje.race)")
                                        .frame(maxWidth: .infinity)
                                        
                                        .foregroundColor(.white)
                                        .bold()
                                    
                                    Text("Nivel de poder:  \(personaje.ki)")
                                        .frame(maxWidth: .infinity)
                                        
                                        .foregroundColor(.white)
                                        .bold()
                                    
                                    Spacer()
                                }
                            
                                
                                }  .simultaneousGesture(TapGesture().onEnded({
                                    print("Hola mundo")
                                    controlador.descargar_informacion_personaje(id: personaje.id)
                                }))
                            }
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
