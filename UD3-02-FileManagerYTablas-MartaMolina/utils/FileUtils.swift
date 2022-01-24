//
//  FileUtils.swift
//  UD3-02-FileManagerYTablas-MartaMolina
//
//  Created by user211717 on 1/22/22.
//

import Foundation

class FileUtilsXML{
    
    func pasarAlXML(listaPersonas: [[String: String]]){
        escribirArchivo(user: transformarDiccionarios(listaPersonas: listaPersonas))
    }
    private func transformarDiccionarios(listaPersonas: [[String: String]])->String{
        var xmlUsuario = String()
        for usuario in listaPersonas{
            xmlUsuario.append("<item>")
            for i in usuario{
                xmlUsuario.append("<\(i.key)>\(i.value)</\(i.key)>")
            }
            xmlUsuario.append("</item>")
        }
        print(xmlUsuario)
        return xmlUsuario;
    }
    
    private func escribirArchivo(user:String){
        do {
            try user.write(to: getRutaArchivoCompleta(),atomically: true, encoding: .utf8)
        } catch let error {
            print("Error: \(error)")
        }
    }
    func getRutaArchivoCompleta()-> URL{
        guard let ruta = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return URL(string: "")!}
        let archivoUrl = ruta.appendingPathComponent("usuarios.xml")
        return archivoUrl
    }
}
