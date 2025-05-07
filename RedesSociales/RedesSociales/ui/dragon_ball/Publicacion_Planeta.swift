//
//  Publicacion_Planeta.swift
//  RedesSociales
//
//  Created by alumno on 5/7/25.
//

import SwiftUI

struct PlanetDetails: View {
    
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ZStack {
            
            Color.orange.ignoresSafeArea()
            ScrollView{
                VStack {
                    Text("\(controlador.planetas?.name ?? "Valor por defecto")")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
      
                    
                    
                    if let url = URL(string: controlador.planetas?.image ?? "aqui va mi imagen"){
                        AsyncImage(url: url) { imagen in
                            imagen.image?
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                            
                        }
                        .background(Color.blue.opacity(0.9))
                        .cornerRadius(20)
                        .shadow(radius: 4)
                        .frame(width: 350, height: 300)
                        .cornerRadius(12)
                    }
                    
                    Text("\(controlador.planetas?.description ?? "Valor por defecto")")
                        .foregroundColor(.white)
                        .font(.body)
                        .padding(.top)
                    
                    
                    
                    Spacer()
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
            }
        }
    }
}
      

#Preview {
    PlanetDetails()
        .environment(ControladorAplicacion())
}
      

