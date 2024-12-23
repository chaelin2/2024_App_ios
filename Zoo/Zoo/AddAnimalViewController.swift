//
//  AddAnimalViewController.swift
//  Zoo
//
//  Created by 22 on 12/13/24.
//

import UIKit

class AddAnimalViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var labelTrait: UILabel!
    
    
    @IBOutlet weak var textFieldDiet: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var imageButton: UIButton!
    
    var animal: Animal?
    var selectedIndex: Int = 0
    var animalImage: UIImage?
    var trait : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        labelTrait.text = "털이 긴가?"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func selectPhoto(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "사진추가", message: "가져올 방법 선택", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "카메라", style: .default){
            _ in self.openCamera()
        }
        let albumAction = UIAlertAction(title: "앨범", style: .default){
            _ in self.openAlbum()
        }
        let cancleAction  = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(cameraAction)
        alertController.addAction(albumAction)
        alertController.addAction(cancleAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let picker  = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }
        else {
            showAlert("카메라 사용 불가")
        }
    }
    
    func openAlbum(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker  = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }else {
            showAlert("앨범 사용 불가")
        }
    }
    // Alert 메시지 표시
        func showAlert(_ message: String) {
            let alert = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
  
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.editedImage] as? UIImage{
            setButtonImage(selectedImage)
        } else if let originalImage = info[.originalImage] as? UIImage{
            setButtonImage(originalImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func setButtonImage(_ image: UIImage){
        imageButton.setImage(image, for: .normal)
        imageButton.imageView?.contentMode = .scaleAspectFill
        imageButton.clipsToBounds = true
        animalImage = image
    }
    
    
    
    
    @IBAction func selectType(_ sender: UISegmentedControl) {
        selectedIndex = sender.selectedSegmentIndex
        labelTrait.text = {
            switch selectedIndex{
            case 0 : return "털이 짧냐?"
            case 1 : return "날수있냐?"
            case 2 : return "온도?"
            default: return ""
            }
        }()
    }
    @IBAction func setTrait(_ sender: UISwitch) {
        trait = sender.isOn
    }
    
    
    @IBAction func buttonOK(_ sender: UIBarButtonItem) {
        animal = {
            switch selectedIndex {
            case 0: return Mammal(name: textFieldName!.text!, diet: textFieldDiet.text!, photo:animalImage , shortFur: trait)
            case 1: return Bird(name: textFieldName!.text!, diet: textFieldDiet.text!, photo:animalImage , canFly: trait)
            case 2: return Reptile(name: textFieldName!.text!, diet: textFieldDiet.text!, photo:animalImage , temperatureControl: trait)
            default:
                return nil
            }
        }()
        Zoo.shared.addAnimal(animal!)
        navigationController?.popViewController(animated: true)
    }
    
}
