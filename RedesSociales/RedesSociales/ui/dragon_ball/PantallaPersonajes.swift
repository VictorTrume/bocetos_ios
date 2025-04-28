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
                        Text("Personajes Dragon Ball")
                           
                            .font(.system(size: 40))
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                        ForEach(controlador.pagina_resultados!.items) { personaje in
                            NavigationLink{
                                DetallesPersonaje()
                            } label: {
                                VStack(alignment: .leading, spacing: 12){
                                    Text("\(personaje.name)")
                                       
                                        .font(.system(size: 30))
                                        .bold()
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                  
                                    AsyncImage(url: URL(string: personaje.image)) { image in
                                        image
                                            .image?.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 150, height: 250)
                                            .frame(maxWidth: .infinity)
                                            .clipped()
                                            .cornerRadius(10)
                                            
                                    }
                                    
                                    Text("Raza:  \(personaje.race)")
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.white)
                                        .bold()

                                    
                                    Text("Nivel de poder:  \(personaje.ki)")
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.white)
                                        .bold()

                                    
                                }
                                .padding()
                                .background(Color.blue.opacity(0.9))
                                .cornerRadius(80)
                                .shadow(radius: 10)
                                .frame(width: 300)
                            
                                
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
