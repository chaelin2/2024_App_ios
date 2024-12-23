//
//  TableViewCell.swift
//  BMI
//
//  Created by 22 on 12/11/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelBMI: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelDateAndTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
