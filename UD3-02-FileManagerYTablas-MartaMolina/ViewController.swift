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
        let nombre: String = txtNombre.text ?? ""
        let apellidos : String = txtApellidos.text ?? ""
        //print(comprobarRutaArchivo())
        if(!(nombre == "") && !(apellidos == ""))
        {
            var persona : [String:String] = ["nombre": nombre,"apellidos":apellidos]
            listaPersonas.append(persona)
            txtNombre.text = ""
            txtApellidos.text = ""
        }
    }
  
    func getRutaArchivoCompleta()-> URL{
        //Singelton de FileManager
        let fileManager = FileManager.default
        guard let ruta = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return URL(string: "")!}
        let archivoUrl = ruta.appendingPathComponent("usuarios.xml")
        return archivoUrl
    }
}

