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
    var perfil_a_mostrar: Perfil? = nil
    
    var personaje_seleccionado: MonoChino? = nil
    var planeta_a_mostrar: Planeta? = nil
    var transformaciones_a_mostrar: Transformacion? = nil
    
    // Seccion Dragon Ball
    var pagina_resultados: PaginaResultado? = nil
    var personaje : MonoChino? = nil
    var planetas : Planeta? = nil
    var planeta_lista : PaginaResultadoPlanetas? = nil
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
            
            await self.descargar_monos_chinos()
            
            await self.descargar_planetas()
        }
    }
    
    
    func descargar_monos_chinos() async{
        guard let pagina_descargada: PaginaResultado = try? await DragonBallAPI().descargar_pagina_personajes() else{return}
        
        self.pagina_resultados = pagina_descargada
    }
    
    func descargar_planetas() async{
        guard let pagina_descargada_planetas: PaginaResultadoPlanetas = try? await
                DragonBallAPI().descargar_pagina_planetas() else{return}
        
        self.planeta_lista = pagina_descargada_planetas
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
    
    func descargar_perfil(id: Int)  async -> Void {
        guard let perfil: Perfil = try? await PlaceHolderAPI().descargar_perfil(id: id) else {return}
        perfil_a_mostrar = perfil
    }
    
    func ver_perfil(id: Int) -> Void{
        Task.detached{
            await self.descargar_perfil(id: id)
        }
    }
    
    func seleccionar_personaje(_ personaje: MonoChino) -> Void{
        personaje_seleccionado = personaje
        
        Task.detached(operation: {
            await self.descargar_comentarios()
        })
        
    }
    
    func descargar_info_personaje(id: Int) async{
        guard let mono_chino: MonoChino = try? await DragonBallAPI().descargar_informacion_personajes(id: id) else {return}
        
        self.personaje = mono_chino
    }
    
    func descargar_info_planeta(id: Int) async{
        guard let planetita: Planeta = try? await DragonBallAPI().descargar_informacion_planetas(id: id) else {return}
        
        self.planetas = planetita
    }
    
    func descargar_informacion_personaje(id: Int){
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
    }
    
    func descargar_informacion_planetas(id: Int){
        Task.detached(operation: {
            await self.descargar_info_planeta(id: id)
        })
    }
    
 
}
