//
//  planeta_general.swift
//  RedesSociales
//
//  Created by alumno on 5/2/25.
//


import SwiftUI

struct PlanetasList: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.orange.ignoresSafeArea()
                
                if controlador.planeta_lista != nil {
                    
                    ScrollView {
                        LazyVStack {
                            Text("Planetas Dragon Ball")
                            
                                .font(.system(size: 30))
                                .bold()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                            ForEach(controlador.planeta_lista!.items) { planet in
                                NavigationLink{
                                    PlanetDetails()
                                } label : {
                                    VStack(alignment: .leading, spacing: 12){
                                        Text("\(planet.name)")
                                        
                                            .font(.system(size: 30))
                                            .bold()
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity)
                                        
                                        AsyncImage(url: URL(string: planet.image)) { image in
                                            image
                                                .image?.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 150, height: 250)
                                                .frame(maxWidth: .infinity)
                                                .clipped()
                                                .cornerRadius(10)
                                            
                                        }
                                        
                                        Text("Descripcion:  \(planet.description)")
                                            .frame(maxWidth: .infinity)
                                            .foregroundColor(.white)
                                            .bold()
                                        
                                        
                                        
                                        
                                        
                                    }
                                    .padding()
                                    .background(Color.blue.opacity(0.9))
                                    .cornerRadius(80)
                                    .shadow(radius: 10)
                                    .frame(width: 300)
                                    
                                    
                                }.simultaneousGesture(TapGesture().onEnded({
                                    print("Hola mundo")
                                    controlador.descargar_informacion_planetas(id: planet.id)
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
    PlanetasList()
        .environment(ControladorAplicacion())
}
