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
    var listaPersonas = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func guardar(_ sender: Any) {
        let usuario :  [String:String] = recogerDatos()
        if(usuario.count>1){
            print(transformarDiccionarios(usuario: usuario))
        }
        
        
    }
    private func transformarDiccionarios(usuario:[String:String])->String{
        var xmlUsuario : String = "<item>"
        for i in usuario{
            xmlUsuario.append("<\(i.key)>\(i.value)</\(i.key)>")
        }
        xmlUsuario.append("</item>")
        return xmlUsuario;
    }
    
    private func recogerDatos()->[String: String]{
        let nombre: String = txtNombre.text ?? ""
        let apellidos : String = txtApellidos.text ?? ""
        if(!(nombre == "") && !(apellidos == ""))
        {
            var persona : [String:String] = ["nombre": nombre,"apellidos":apellidos]
            listaPersonas.append(persona)
            txtNombre.text = ""
            txtApellidos.text = ""
            return persona
        }
        return ["fallo": "fallo"]
    }
    func getRutaArchivoCompleta()-> URL{
        //Singelton de FileManager
        let fileManager = FileManager.default
        guard let ruta = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return URL(string: "")!}
        let archivoUrl = ruta.appendingPathComponent("usuarios.xml")
        return archivoUrl
    }
}

