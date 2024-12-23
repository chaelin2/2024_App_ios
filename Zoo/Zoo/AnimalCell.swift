//
//  AnimalCell.swift
//  Zoo
//
//  Created by 22 on 12/12/24.
//

import UIKit

protocol AnimalCellDelegate: AnyObject {
    func didTapPhoto(at index : Int)
    func didTapRemove(at index : Int)
}

class AnimalCell: UICollectionViewCell {
    @IBOutlet weak var imageViewRemove: UIImageView!
    @IBOutlet weak var imageViewPhoto: UIImageView!
    
   
    @IBOutlet weak var labelTrait: UILabel!
    @IBOutlet weak var labelDiet: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    weak var delegate : AnimalCellDelegate?
    override func awakeFromNib(){
        super.awakeFromNib()
        //이미지 모서리 둥글게
        imageViewPhoto.layer.cornerRadius = 8.0
        imageViewPhoto.clipsToBounds = true
        
        //tap gesture recognizer 추가
        let tapGesturePhoto = UITapGestureRecognizer(target: self, action: #selector(photoTapped))
        imageViewPhoto.isUserInteractionEnabled = true
        imageViewPhoto.addGestureRecognizer(tapGesturePhoto)
        
        let tapGestureRemove = UITapGestureRecognizer(target: self, action: #selector(removeTapped))
        imageViewRemove.isUserInteractionEnabled = true
        imageViewRemove.addGestureRecognizer(tapGestureRemove)
    }
    
    @objc func photoTapped(){
        delegate?.didTapPhoto(at: self.tag)
    }
    @objc func removeTapped(){
        delegate?.didTapRemove(at: self.tag)
    }
}
