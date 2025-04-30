//
//  perfil_planeta.swift
//  RedesSociales
//
//  Created by alumno on 4/28/25.
//
import SwiftUI

struct PerfilPlaneta: View {
    @Environment(ControladorAplicacion.self) var controlador

    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()

            ScrollView {
                VStack {
                    Text("Planeta \(controlador.personaje!.originPlanet!.name)")
                        .font(.system(size: 25))
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)

                   
                    
                    Text("\(controlador.personaje!.originPlanet!.description)")
                        .foregroundColor(.white)
                        .font(.body)
                        .background(Color.yellow.opacity(0.5))
                        .cornerRadius(5)
                        .shadow(radius: 4)
                        .frame(width: 370, height: 300)
                        .cornerRadius(12)
                       

                

                    AsyncImage(url: URL(string: controlador.personaje!.originPlanet!.image)) { image in
                        image
                            .image?.resizable()
                            .aspectRatio(contentMode: .fit)
                           
                    
                            .clipped()
                            .cornerRadius(10)
                    }
                    .onDisappear {
                        print("Adios papus")
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
