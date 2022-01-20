//
//  UserListViewController.swift
//  UD3-02-FileManagerYTablas-MartaMolina
//
//  Created by user211717 on 1/15/22.
//

import UIKit

class UserListViewController: UITableViewController, XMLParserDelegate{
    @IBOutlet weak var miTabla: UITableView!
    
    var itemList = [Item]()
    var parser: XMLParser = XMLParser()
    var item : Item?
    var nombreElemento = String()
    var nombre = String()
    var apellido =  String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepararParser()
    }
    override func viewWillAppear(_ animated: Bool) {
        //prepararParser()
    }
    
    ////----Tabla
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = miTabla.dequeueReusableCell(withIdentifier: "Celda") as! TVCellUser
        celda.lblNombre.text = itemList[indexPath.row].nombre
        celda.lblApellidos.text = itemList[indexPath.row].apellidos
        return celda
    }
    
    private func getRutaArchivoCompleta()-> URL{
        guard let ruta = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return URL(string: "")!}
        let archivoUrl = ruta.appendingPathComponent("usuarios.xml")
        return archivoUrl
    }
    
    func prepararParser(){
        //Cambia el String de urlXML a Url y carga la petición en la webView
        let urlXML : String = getRutaArchivoCompleta().absoluteString
        guard let url = URL(string: urlXML) else {return}
        guard let parser = XMLParser(contentsOf: url) else { return}
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
    
    
    
    //Lee cada elemento del XML y va añadiendo cada caracter a su correspondiente String
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
        itemList.append(datosItem)
    }
    //Segue ejecutada al pulsar sobre un elemento de la lista.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        item =  itemList[indexPath.row]
    }
    /*Cuando termina el elemento una vez termina de leer cada item,
     si coincide la categoría con la indicada en la anterior pantalla
     lo añade a la lista de la tabla. Si no, no.
     */
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

    
}
