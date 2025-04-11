//
//  perfil_transformaciones.swift
//  RedesSociales
//
//  Created by alumno on 4/11/25.
//

import SwiftUI

struct PerfilTransformacion: View{
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        ScrollView{
            ZStack{
                Color.orange.ignoresSafeArea()
                VStack{
                    Text("Transformaciones:  ")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    ForEach(controlador.personaje!.transformations!) { fases in
                        
                        Text("\(fases.name)")
                            .foregroundColor(.white)
                            .font(.body)
                            .padding(.top)
                        Spacer()
                        
                        AsyncImage(url: URL(string: fases.image)) { image in
                            image
                                .image?.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 250)
                                .frame(maxWidth: .infinity)
                                .clipped()
                                .cornerRadius(10)
                            
                        }
                        .onDisappear(){
                            print("Adios papus")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}

