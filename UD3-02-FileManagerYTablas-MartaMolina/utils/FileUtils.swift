//
//  FileUtils.swift
//  UD3-02-FileManagerYTablas-MartaMolina
//
//  Created by user211717 on 1/22/22.
//

import Foundation

class FileUtilsXML{
    
    static var shared : FileUtilsXML {
        let yoMismo =  FileUtilsXML()
        return yoMismo
    }
    
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
    func prepararParaParseo()->Data{
        let urlXML : String = getRutaArchivoCompleta().absoluteString
        let url = URL(string: urlXML)!
        var xmlTexto : String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><userlist>"
        do{
            xmlTexto.append(try String(contentsOf: url, encoding: .utf8))
            xmlTexto.append("</userlist>")
            
        }catch{}
        let data: Data = Data(_:xmlTexto.utf8)
        return data
    }
}
