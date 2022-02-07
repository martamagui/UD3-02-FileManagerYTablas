//
//  TVCellUser.swift
//  UD3-02-FileManagerYTablas-MartaMolina
//
//  Created by user211717 on 1/19/22.
//

import UIKit

class TVCellUser: UITableViewCell {
    @IBOutlet weak var lblNombreApellidos: UILabel!
    
    @IBOutlet weak var lblNickUsuario: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
