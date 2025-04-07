
import SwiftUI
//let publicacion_falsa = Publicacion(userId: 1, id: 1, title: "Lorem ipsum", body: "Et dolor sit amet")

struct DetallesPersonaje : View{

    @Environment(ControladorAplicacion.self) var controlador
    
    
    //var publicacion_a_mostrar = controlador.publicacion_seleccionada
    
    var body: some View{
        
        Text("\(controlador.personaje_seleccionado?.name ??  "Valor por defecto")")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .font(.system(size: 25))
            .frame(maxWidth: .infinity)
            .background(Color.black)
         
        Text("\(controlador.personaje_seleccionado?.description ?? "Valor por defecto")")
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.black)

        Spacer()
        NavigationLink{
            PerfilBasicoVista()
        }label: {
        Text("Ver perfil")
        }.simultaneousGesture(TapGesture().onEnded({
            controlador.ver_perfil(id: controlador.publicacion_seleccionada!.userId)
        })).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .font(.system(size: 15))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
       
    }
    
        
}

#Preview {
    NavigationStack{
        DetallesPersonaje()
            .environment(ControladorAplicacion())
    }
}
