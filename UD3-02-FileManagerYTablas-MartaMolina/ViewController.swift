//
//  ViewController.swift
//  UD3-02-FileManagerYTablas-MartaMolina
//
//  Created by user211717 on 1/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtApellidos: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var tvFeedBack: UILabel!
    var listaPersonas = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func guardar(_ sender: Any) {
        let usuario : Bool = recogerDatos()
        if(usuario){
            let user = transformarDiccionarios()
            escribirArchivo(user: user)
            //TODO Hacer que aparezca o no el mensaje de error
        }
    }
    private func escribirArchivo(user:String){
        do {
            try user.write(to: getRutaArchivoCompleta(),atomically: true, encoding: .utf8)
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    private func transformarDiccionarios()->String{
        var xmlUsuario : String = ""
        xmlUsuario.append("<userlist>")
        for usuario in listaPersonas{
            xmlUsuario.append("<item>")
            for i in usuario{
                xmlUsuario.append("<\(i.key)>\(i.value)</\(i.key)>")
            }
            xmlUsuario.append("</item>")
        }
        xmlUsuario.append("</userlist>")
        print(xmlUsuario)
        return xmlUsuario;
    }
    
    private func recogerDatos()->Bool{
        let nombre: String = txtNombre.text ?? ""
        let apellidos : String = txtApellidos.text ?? ""
        if(!(nombre == "") && !(apellidos == ""))
        {
            var persona : [String:String] = ["nombre": nombre,"apellidos":apellidos]
            listaPersonas.append(persona)
            txtNombre.text = ""
            txtApellidos.text = ""
            print(listaPersonas)
            return true
        }
        return false
    }
    
    private func getRutaArchivoCompleta()-> URL{
        guard let ruta = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return URL(string: "")!}
        let archivoUrl = ruta.appendingPathComponent("usuarios.xml")
        return archivoUrl
    }
}

