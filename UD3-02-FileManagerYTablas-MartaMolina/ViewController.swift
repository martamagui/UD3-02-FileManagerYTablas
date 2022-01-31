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
    @IBOutlet weak var lblnick: UILabel!
    @IBOutlet weak var lblnombre: UILabel!
    @IBOutlet weak var lblApellidos: UILabel!
    @IBOutlet weak var btnGuardar: UIButton!
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
    
    @IBOutlet weak var altoBtn: NSLayoutConstraint!
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
            altoLogo.constant = 35
            anchoLogo.constant = 35
            nickAlblNombre.constant = 2
            altoNick.constant = 30
            altoNombre.constant = 30
            altoApellidos.constant = 30
            altoFeedBack.constant = 0
            altoBtn.constant = 35
            //Izq Drch
            nombreIzq.constant = 100
            nombreDrch.constant = 100
            apellidosIzq.constant = 100
            apellidosDrch.constant = 100
            nickUsuarioizq.constant = 100
            nickUsuariodrch.constant = 100
            //Font
            lblnick.font = UIFont.systemFont(ofSize: 16.0)
            lblnombre.font = UIFont.systemFont(ofSize: 16.0)
            lblApellidos.font = UIFont.systemFont(ofSize: 16.0)
            btnGuardar.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
            
        }
        else
        {
            altoLogo.constant = 100
            anchoLogo.constant = 100
            nickAlblNombre.constant = 10
            altoNick.constant = 40
            altoNombre.constant = 40
            altoApellidos.constant = 40
            altoBtn.constant = 40
            nombreIzq.constant = 50
            nombreDrch.constant = 50
            apellidosIzq.constant = 50
            apellidosDrch.constant = 50
            nickUsuarioizq.constant = 50
            nickUsuariodrch.constant = 50
            lblnick.font = UIFont.systemFont(ofSize: 24.0)
            lblnombre.font = UIFont.systemFont(ofSize: 24.0)
            lblApellidos.font = UIFont.systemFont(ofSize: 24.0)
            btnGuardar.titleLabel?.font = UIFont.systemFont(ofSize: 24.0)
            
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

