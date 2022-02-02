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
    @IBOutlet weak var nombreIzq: NSLayoutConstraint!
    @IBOutlet weak var nombreDrch: NSLayoutConstraint!
    @IBOutlet weak var altoNick: NSLayoutConstraint!
    @IBOutlet weak var altoNombre: NSLayoutConstraint!
    @IBOutlet weak var altoApellidos: NSLayoutConstraint!
    
    
    @IBOutlet weak var altoBtnListado: NSLayoutConstraint!
    @IBOutlet weak var apellidosDrch: NSLayoutConstraint!
    @IBOutlet weak var apellidosIzq: NSLayoutConstraint!
    @IBOutlet weak var altoFeedBack: NSLayoutConstraint!
    @IBOutlet weak var separacionBotBtn: NSLayoutConstraint!
    
    @IBOutlet weak var btnGuardarIzq: NSLayoutConstraint!
    @IBOutlet weak var btnListadoDerecha: NSLayoutConstraint!
    
    @IBOutlet weak var sepracionBtnListado: NSLayoutConstraint!
    
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
            if(UIScreen.main.bounds.height>900){
                asignarConstrintsTabletLandscape()
            }else{
                asignarConstrintsMobileLandscape()
            }
        }
        else
        {
            altoLogo.constant = 100
            anchoLogo.constant = 100
            separacionBotBtn.constant = 10
            sepracionBtnListado.constant = 10
            sepracionBtnListado.constant = 10
            altoNick.constant = 40
            altoNombre.constant = 40
            altoApellidos.constant = 40
            altoBtn.constant = 40
            altoBtnListado.constant = 40
            nombreIzq.constant = 50
            nombreDrch.constant = 50
            apellidosIzq.constant = 50
            apellidosDrch.constant = 50
            nickUsuarioizq.constant = 50
            btnGuardarIzq.constant = 50
            btnListadoDerecha.constant = 50
            nickUsuariodrch.constant = 50
            
            lblnick.font = UIFont.systemFont(ofSize: 24.0)
            lblnombre.font = UIFont.systemFont(ofSize: 24.0)
            lblApellidos.font = UIFont.systemFont(ofSize: 24.0)
        }
    }
    private func asignarConstrintsMobileLandscape(){
        altoLogo.constant = 35
        anchoLogo.constant = 35
        altoNick.constant = 30
        altoNombre.constant = 30
        altoApellidos.constant = 30
        altoFeedBack.constant = 0
        altoBtn.constant = 35
        altoBtnListado.constant = 35
        //Izq Drch
        nombreIzq.constant = 100
        nombreDrch.constant = 100
        apellidosIzq.constant = 100
        apellidosDrch.constant = 100
        nickUsuarioizq.constant = 100
        nickUsuariodrch.constant = 100
        btnGuardarIzq.constant = 100
        btnListadoDerecha.constant = 100
        //Separacion btn
        separacionBotBtn.constant = 10
       
        //Font
        lblnick.font = UIFont.systemFont(ofSize: 16.0)
        lblnombre.font = UIFont.systemFont(ofSize: 16.0)
        lblApellidos.font = UIFont.systemFont(ofSize: 16.0)
     
        
    }
    private func asignarConstrintsTabletLandscape(){
        print(UIScreen.main.bounds.height)
        altoLogo.constant = UIScreen.main.bounds.height/3
        anchoLogo.constant = UIScreen.main.bounds.height/3
        altoNick.constant = UIScreen.main.bounds.height/20
        altoNombre.constant =  UIScreen.main.bounds.height/20
        altoApellidos.constant =  UIScreen.main.bounds.height/20
        altoFeedBack.constant = UIScreen.main.bounds.height/20
        altoBtn.constant = UIScreen.main.bounds.height/20
        altoBtnListado.constant = UIScreen.main.bounds.height/20
        
        //Izq Drch
        nombreIzq.constant = UIScreen.main.bounds.height/4
        nombreDrch.constant = UIScreen.main.bounds.height/4
        apellidosIzq.constant = UIScreen.main.bounds.height/4
        apellidosDrch.constant = UIScreen.main.bounds.height/4
        nickUsuarioizq.constant = UIScreen.main.bounds.height/4
        nickUsuariodrch.constant = UIScreen.main.bounds.height/4
        btnGuardarIzq.constant = UIScreen.main.bounds.height/4
        btnListadoDerecha.constant = UIScreen.main.bounds.height/4
        //Separacion btn
        separacionBotBtn.constant = 10
  
        //Font
        lblnick.font = UIFont.systemFont(ofSize:  UIScreen.main.bounds.height/30)
        lblnombre.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height/30)
        lblApellidos.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height/30)
      
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

