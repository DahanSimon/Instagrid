//
//  ViewController.swift
//  Instagrid
//
//  Created by Simon Dahan on 27/11/2019.
//  Copyright © 2019 Simon Dahan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var topLeftImage: UIImageView!
    @IBOutlet weak var bigBottomImage: UIImageView!
    @IBOutlet weak var topRightImage: UIImageView!
    
    @IBOutlet weak var layout2View: UIView!
    
    var selectedImage = 0

    @IBAction func bigBottomButton(_ sender: Any) {
        selectedImage = 1
        selectingImage()
    }
    @IBAction func topRightButton(_ sender: Any) {
        selectedImage = 2
        selectingImage()
    }
    
    @IBAction func topLeftButton(_ sender: Any) {
       selectedImage = 3
        selectingImage()
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            switch selectedImage {
                case 1:
                    bigBottomImage.isHidden = false
                    bigBottomImage.image = image
                case 2:
                    topRightImage.isHidden = false
                    topRightImage.image = image
                case 3:
                    topLeftImage.isHidden = false
                    topLeftImage.image = image
                default:
                    topLeftImage.isHidden = false
                    topLeftImage.image = image
            }
        }
        else {
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    func selectingImage() {
        let newImage = UIImagePickerController()
        newImage.delegate = self
        
        newImage.sourceType = UIImagePickerController.SourceType.photoLibrary
        newImage.allowsEditing = false
        
        self.present(newImage, animated: true){
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

