//
//  ViewController.swift
//  ImageAndSwitch
//
//  Created by 22 on 12/9/24.
//

import UIKit

class ViewController: UIViewController {
    let imageOff:UIImage? = UIImage(named: "lamp_off.png")
    let imageOn:UIImage? = UIImage(named: "lamp_on.png")
    var zoom = false
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imageOff
    }

    @IBAction func zoom(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var width = imageView.frame.width
        var height = imageView.frame.height
        if !zoom {
            width*=scale
            height*=scale
            sender.se	tTitle("축소", for:.normal)
        }
        else{
            width/=scale
            height/=scale
            sender.setTitle("확대", for:.normal)
        }
        imageView.frame.size=CGSize(width:width, height: height)
        zoom = !zoom
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn{
            imageView.image=imageOn
        }
        else{
            imageView.image=imageOff
            
        }
    }
}

