//
//  contrador_app.swift
//  RedesSociales
//
//  Created by alumno on 3/26/25.
//

import Foundation

@Observable
@MainActor
public class ControladorAplicacion{
    var publicaciones: Array<Publicacion> = []
    var comentarios: Array<Comentario> = []
    
    var publicacion_seleccionada: Publicacion? = nil
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
        }
    }
    func descargar_publicaciones() async{
        defer{
            print("Esta funcion se mando a llamar despues de todos los await \(#function)")
        }
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else {return}
        publicaciones  = publicaciones_descargadas
    }
    
    func descargar_comentarios() async{
        defer{
            print("Esta funcion se mando a llamar despues de todos los await \(#function)")
        }
        guard let comentarios_descargados: [Comentario] = try? await PlaceHolderAPI().descargar_comentarios(post_id: self._publicacion_seleccionada!.id ) else {return}
        
        comentarios = comentarios_descargados
  
    }
    
    func seleccionar_publicacion(_ publicacion: Publicacion) -> Void{
        publicacion_seleccionada = publicacion
        
        Task.detached(operation: {
            await self.descargar_comentarios()
        })
        
       
    }
}
