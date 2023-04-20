//
//  TableViewCell.swift
//  InstaWithoutDBAndCloud
//
//  Created by 王文琪 on 4/19/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgContainer: UIImageView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
