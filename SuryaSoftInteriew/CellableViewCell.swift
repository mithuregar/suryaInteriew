//
//  CellableViewCell.swift
//  SuryaSoftInteriew
//
//  Created by Ganesh on 3/1/19.
//  Copyright © 2019 Mithu. All rights reserved.
//

import UIKit

class CellableViewCell: UITableViewCell {

    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(imageUrl: String, email: String, name: String) {
        self.ImageView.image = UIImage(named: imageUrl)
        self.nameLabel.text = name
        self.emailLabel.text = email
    }

}
