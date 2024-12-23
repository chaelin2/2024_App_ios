//
//  AddCarViewController.swift
//  HCar
//
//  Created by 22 on 12/17/24.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

class AddCarViewController: UIViewController, UINavigationControllerDelegate {
    let db = Firestore.firestore()
    @IBOutlet weak var textFieldYear: UITextField!
    @IBOutlet weak var textFieldPrice: UITextField!
    
    @IBOutlet weak var buttonImage: UIButton!
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textViewDetails: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addImage(_ sender: UIButton) {
        let alertController = UIAlertController(title: "사진추가", message: "사진을 가져올 방법 선택", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "카메라", style: .default){
            _ in self.openCamera()
        }
        
        let albumAction = UIAlertAction(title: "앨범", style: .default){
            _ in self.openAlbum()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel,handler: nil)
        alertController.addAction(cameraAction)
        alertController.addAction(albumAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
          
        
    }
    
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }
    }
    
    func openAlbum(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        } else{
            showAlert("앨범 사용 불가")
        }
    }
    
    func showAlert( _ message: String){
        let alert = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    @IBAction func addCar(_ sender: UIBarButtonItem) {
        if let image = buttonImage.imageView?.image {
            uploadImage(image:image){urlString in
                if let urlString = urlString{
                    print("Image uploaded successfully: \(urlString)")
                    let car = Car(name: self.textFieldName.text!, price: Int(self.textFieldPrice.text!)!, year: Int(self.textFieldYear.text!)!, image: urlString, details: self.textViewDetails.text!, userId: Auth.auth().currentUser!.uid, isSale: false)
                    self.saveCar(car)
                } else{
                    print("faild to upload image")
                }
            }
        } else {
            print("failed to load image")
        }
    
        
//        let car = Car(name: textFieldName.text!, price: Int(textFieldPrice.text!)!, year:Int(textFieldYear.text!)!, imageName: nil
//                      //image: buttonImage.imageView?.image!
//        )
//        CarListManager.shared.addCar(car)
//        saveCar(car)
//        navigationController?.popViewController(animated: true)
    }
    
    
    func uploadImage(image: UIImage, completion: @escaping(String?)->Void){
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {return}
        let storageRef = Storage.storage().reference().child("image/\(UUID().uuidString).jpg")
        storageRef.putData(imageData, metadata: nil){ _, error in
            if let error = error{
                print("Error uploading image:\(error)")
                completion(nil)
            }else {
                storageRef.downloadURL{ url, _ in
                    completion(url?.absoluteString)}
            }
            
        }
    }
    func saveCar(_ car: Car){
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(car)
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
            let carRef = db.collection("cars").addDocument(data: jsonObject ?? [:]) { error in
                if let error = error {
                    print("Error writing document \(error)")
                }
            }
            
            db.collection("cars").document(carRef.documentID).updateData(["id": carRef.documentID]){
                updateError in
                if let updateError = updateError{
                    print("Error updating document Id \(updateError)")
                } else {
                    print("documentID successfully update")
                    self.navigationController?.popViewController(animated: true)
                }
                
            }
         
        } catch{
            print("Error encoding car \(error)")
        }
    }
}

extension AddCarViewController: UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage{
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
        buttonImage.setImage(image, for: .normal)
        buttonImage.imageView?.contentMode = .scaleAspectFill
        buttonImage.clipsToBounds = true
    }
}
