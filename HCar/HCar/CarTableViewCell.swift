//
//  CarTableViewCell.swift
//  HCar
//
//  Created by 22 on 12/17/24.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageViewCar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
