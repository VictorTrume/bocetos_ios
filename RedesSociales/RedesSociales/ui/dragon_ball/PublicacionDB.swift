import SwiftUI

struct DetallesPersonaje: View {
    
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ZStack {
            
            Color.orange.ignoresSafeArea()
            ScrollView{
                VStack {
                    Text("\(controlador.personaje?.name ?? "Valor por defecto")")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                    Text("Afiliacion:  \(controlador.personaje?.affiliation ?? "Valor por defecto")")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                    Text("Planeta de Origen: \(controlador.personaje?.originPlanet?.name ?? "Valor por defecto")")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                    
                    if let url = URL(string: controlador.personaje?.image ?? "aqui va mi imagen"){
                        AsyncImage(url: url) { imagen in
                            imagen.image?
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 150, height: 200)
                    }
                    
                    Text("\(controlador.personaje?.description ?? "Valor por defecto")")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                    
                    
                    
                    Spacer()
                    
                    NavigationLink {
                        PerfilBasicoVista()
                    } label: {
                        Text("Ver perfil")
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                    }
                    .simultaneousGesture(TapGesture().onEnded({
                        controlador.ver_perfil(id: controlador.publicacion_seleccionada!.userId)
                    }))
                }
                .padding()
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetallesPersonaje()
            .environment(ControladorAplicacion())
    }
}

