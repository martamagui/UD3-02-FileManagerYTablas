//
//  UserListViewController.swift
//  UD3-02-FileManagerYTablas-MartaMolina
//
//  Created by user211717 on 1/15/22.
//

import UIKit

class UserListViewController: UITableViewController, XMLParserDelegate{
    @IBOutlet weak var miTabla: UITableView!
    
    var listaPersonas = [[String:String]]()
    var itemList = [Item]()
    var parser: XMLParser = XMLParser()
    var item : Item?
    var nombreElemento = String()
    var nombre = String()
    var apellido =  String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        prepararParser()
        miTabla.reloadData()
    }
    
    //----Tabla
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = miTabla.dequeueReusableCell(withIdentifier: "Celda") as! TVCellUser
        celda.lblNombre.text = itemList[indexPath.row].nombre
        celda.lblApellidos.text = itemList[indexPath.row].apellidos
        return celda
    }
    
    func prepararParser(){
        let data:Data = FileUtilsXML.shared.prepararParaParseo()
        let parser: XMLParser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        nombreElemento = elementName
        if nombreElemento == "item"
        {
            
            nombre = String()
            apellido = String()
            print(itemList.count)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let caracter = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if !caracter.isEmpty
        {
            if nombreElemento == "nombre"
            {
                nombre += caracter
            }
            else if nombreElemento == "apellidos"
            {
                apellido += caracter
            }
        }
    }
    
    func annadirElemento(){
        let datosItem = Item(nombre: nombre, apellidos: apellido)
        listaPersonas.append(["nombre": datosItem.nombre, "apellidos":datosItem.apellidos])
        itemList.append(datosItem)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        item =  itemList[indexPath.row]
    }
  
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item"
        {
            annadirElemento()
            print(itemList)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    //Borrar al deslizar
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let borrar =  UIContextualAction(style: .normal, title: "Borrar"){ _,_,_ in
            
            self.itemList.remove(at: indexPath.row)
            self.listaPersonas.remove(at: indexPath.row)
            self.miTabla.deleteRows(at: [indexPath], with: .fade)
            FileUtilsXML.shared.pasarAlXML(listaPersonas: self.listaPersonas)
        }
        borrar.image = UIImage(systemName: "trash")
        borrar.backgroundColor = UIColor(ciColor: .red)
        return UISwipeActionsConfiguration(actions: [borrar])
    }
    
}
