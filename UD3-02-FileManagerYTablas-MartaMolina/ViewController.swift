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
    @IBOutlet weak var txtNickUsuario: UITextField!
    
    //Constrainst
    @IBOutlet weak var altoLogo: NSLayoutConstraint!
    @IBOutlet weak var anchoLogo: NSLayoutConstraint!
    @IBOutlet weak var nickUsuariodrch: NSLayoutConstraint!
    @IBOutlet weak var nickUsuarioizq: NSLayoutConstraint!
    @IBOutlet weak var nickAlblNombre: NSLayoutConstraint!
    @IBOutlet weak var nombreIzq: NSLayoutConstraint!
    @IBOutlet weak var nombreDrch: NSLayoutConstraint!
    @IBOutlet weak var altoNick: NSLayoutConstraint!
    @IBOutlet weak var altoNombre: NSLayoutConstraint!
    @IBOutlet weak var altoApellidos: NSLayoutConstraint!
    @IBOutlet weak var apellidosDrch: NSLayoutConstraint!
    @IBOutlet weak var apellidosIzq: NSLayoutConstraint!
    @IBOutlet weak var altoFeedBack: NSLayoutConstraint!
    @IBOutlet weak var separacionBotBtn: NSLayoutConstraint!
    
    
    
    
    
    var xmlUsuario = String()
    var listaPersonas = [[String:String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Vista
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let orientation = UIDevice.current.orientation
        if orientation.isLandscape
        {
            altoLogo.constant = 30
            anchoLogo.constant = 30
        }
        else
        {
            altoLogo.constant = 100
            anchoLogo.constant = 100
        }
    }
    
    //Logica
    @IBAction func guardar(_ sender: Any) {
        let usuario : Bool = recogerDatos()
        if(usuario){
            FileUtilsXML.shared.pasarAlXML(listaPersonas: listaPersonas)
        }
    }
    
    private func recogerDatos()->Bool{
        let nombre: String = txtNombre.text ?? ""
        let apellidos : String = txtApellidos.text ?? ""
        let nickUsuario : String = txtNickUsuario.text ?? ""
        if(!(nombre == "") && !(apellidos == ""))
        {
            var persona : [String:String] = ["nickusuario":nickUsuario,"nombre": nombre,"apellidos":apellidos]
            listaPersonas.append(persona)
            txtNombre.text = ""
            txtApellidos.text = ""
            txtNickUsuario.text = ""
            
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

