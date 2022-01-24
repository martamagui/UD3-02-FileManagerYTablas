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
    var xmlUsuario = String()
    var listaPersonas = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func guardar(_ sender: Any) {
        let usuario : Bool = recogerDatos()
        if(usuario){
            FileUtilsXML.shared.pasarAlXML(listaPersonas: listaPersonas)
        }
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
            //print(listaPersonas)
            return true
        }else{
            tvFeedBack.text="Por favor, rellene los campos."
        }
        return false
    }
    
    @IBAction func campoNombre(_ sender: Any) {
        tvFeedBack.text=""
    }
    @IBAction func campoApellidos(_ sender: Any) {
        tvFeedBack.text=""
    }
    
}

