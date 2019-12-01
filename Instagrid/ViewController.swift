//
//  ViewController.swift
//  Instagrid
//
//  Created by Simon Dahan on 27/11/2019.
//  Copyright © 2019 Simon Dahan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var bottomBigButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var topLeftButton: UIButton!
    
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBOutlet weak var topBigButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var photoLayoutView: photoLayoutView!
    
    override func viewDidLoad() {
        topLeftButton.isHidden = true
        topRightButton.isHidden = true
        bottomBigButton.isHidden = true
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var selectedButton = 0
    var selectedLayout = 0
    
    @IBAction func bigBottomButton(_ sender: Any) {
        selectedButton = 1
        selectingImage()
    }
    @IBAction func topRightButton(_ sender: Any) {
        selectedButton = 2
        selectingImage()
    }
    
    @IBAction func topLeftButton(_ sender: Any) {
        selectedButton = 3
        selectingImage()
        
    }
    @IBAction func bottomLeftButton(_ sender: Any) {
        selectedButton = 4
        selectingImage()
    }
    
    @IBAction func topBigButton(_ sender: Any) {
        selectedButton = 5
        selectingImage()
    }
    @IBAction func bottomRightButton(_ sender: Any) {
        selectedButton = 6
        selectingImage()
    }
    
    
    
    @IBAction func layout1Button(_ sender: Any) {
        photoLayoutView.selectedLayout = 1
        photoLayoutView.changeLayout()
    }
    @IBAction func layout2Button(_ sender: Any) {
        photoLayoutView.selectedLayout = 2
        photoLayoutView.changeLayout()
    }
    @IBAction func layout3Button(_ sender: Any) {
        photoLayoutView.selectedLayout = 3
        photoLayoutView.changeLayout()
    }
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            switch selectedButton {
            case 1:
                bottomBigButton.setImage(image, for: UIControl.State.normal)
            case 2:
                topRightButton.setImage(image, for: UIControl.State.normal)
            case 3:
                topLeftButton.setImage(image, for: UIControl.State.normal)
            case 4:
                bottomLeftButton.setImage(image, for: UIControl.State.normal)
            case 5:
                topBigButton.setImage(image, for: UIControl.State.normal)
            case 6:
                bottomRightButton.setImage(image, for: UIControl.State.normal)
            default:
                print("error")
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
}

