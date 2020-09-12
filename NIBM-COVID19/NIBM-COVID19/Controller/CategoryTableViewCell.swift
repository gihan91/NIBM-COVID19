//
//  CategoryTableViewCell.swift
//  NIBM-COVID19
//
//  Created by Gihan on 9/10/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet var lblCategoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
