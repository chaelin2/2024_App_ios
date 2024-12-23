//
//  CarCell.swift
//  Car
//
//  Created by 22 on 12/13/24.
//

import UIKit


protocol CarCellDelegate: AnyObject {
    func didTapPhoto(at index : Int)
    func didTapRemove(at index : Int)
}
class CarCell: UICollectionViewCell {
    @IBOutlet weak var imageViewPhoto: UIImageView!
    
    
    
    
    @IBOutlet weak var feat: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
        
    
    weak var delegate : CarCellDelegate?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        imageViewPhoto.layer.cornerRadius = 8.0
        imageViewPhoto.clipsToBounds = true
    }
}
