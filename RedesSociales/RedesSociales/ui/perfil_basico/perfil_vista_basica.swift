//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 3/28/25.
//

import SwiftUI
import PhotosUI

struct PerfilBasicoVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    @State var foto_seleccionada: PhotosPickerItem? = nil
    @State var foto_a_mostrar: UIImage? = nil

    var body: some View {
        ZStack {
            Color.orange.opacity(0.8)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    PhotosPicker(selection: $foto_seleccionada) {
                        Image(uiImage: foto_a_mostrar ?? UIImage(resource: .elcesar))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(.circle)
                    }
                    .onChange(of: foto_seleccionada) { valor_anterior, valor_nuevo in
                        Task {
                            if let foto_seleccionada, let datos = try? await foto_seleccionada.loadTransferable(type: Data.self) {
                                if let imagen = UIImage(data: datos) {
                                    foto_a_mostrar = imagen
                                }
                            }
                        }
                    }

                    VStack(alignment: .leading) {
                        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Cosme Fulanito")")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Roger")")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "quetevalga@simios.com")")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
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
