//
//  perfil_transformaciones.swift
//  RedesSociales
//
//  Created by alumno on 4/11/25.
//

import SwiftUI

struct PerfilTransformacion: View {
    @Environment(ControladorAplicacion.self) var controlador

    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea() 

            ScrollView {
                VStack {
                    Text("Transformaciones:")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .center)

                    ForEach(controlador.personaje!.transformations!) { fases in
                        VStack(spacing: 10) {
                            Text(fases.name)
                                .foregroundColor(.white)
                                .font(.body)
                                .bold()

                            AsyncImage(url: URL(string: fases.image)) { image in
                                image
                                    .image?.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 250)
                                    .frame(maxWidth: .infinity)
                                    .clipped()
                                    .cornerRadius(10)
                            }
                            .onDisappear {
                                print("Adios papus")
                            }
                            .padding()
                            .background(Color.blue.opacity(0.9))
                            .cornerRadius(80)
                            .shadow(radius: 10)
                            .frame(width: 300)
                        }
                        .padding(.bottom)
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

