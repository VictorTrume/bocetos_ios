import SwiftUI

struct DetallesPersonaje: View {
    
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ZStack {
            
            Color.orange.ignoresSafeArea()
            ScrollView{
                VStack {
                    Text("\(controlador.personaje?.name ?? "Valor por defecto")")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("Afiliacion:  \(controlador.personaje?.affiliation ?? "Valor por defecto")")
                        .font(.title2)
                        .foregroundColor(.white)
                    Text("Planeta de Origen: \(controlador.personaje?.originPlanet?.name ?? "Valor por defecto")")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    if let url = URL(string: controlador.personaje?.image ?? "aqui va mi imagen"){
                        AsyncImage(url: url) { imagen in
                            imagen.image?
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                                
                        }
                        .frame(width: 150, height: 200)
                        .cornerRadius(12)
                    }
                    
                    Text("\(controlador.personaje?.description ?? "Valor por defecto")")
                        .foregroundColor(.white)
                        .font(.body)
                        .padding(.top)
                    
                    
                    
                    Spacer()
                    
                    NavigationLink {
                        PerfilTransformacion()
                    } label: {
                        Text("Ver Transformaciones")
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                         
                    }
                    .simultaneousGesture(TapGesture().onEnded({
                    }))
                }
                
                
               
                
                NavigationLink {
                    PerfilPlaneta()
                } label: {
                    Text("Informacion Planeta")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                        
                }
                .simultaneousGesture(TapGesture().onEnded({
                }))
            }
            .padding(60)
                
                
                
            }
        }
    }


#Preview {
    NavigationStack {
        DetallesPersonaje()
            .environment(ControladorAplicacion())
    }
}

