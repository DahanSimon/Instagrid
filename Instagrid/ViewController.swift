//
//  ViewController.swift
//  Instagrid
//
//  Created by Simon Dahan on 27/11/2019.
//  Copyright © 2019 Simon Dahan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet var mainView: UIView!
    let grid = Grid()
    override func viewDidLoad() {
        photoLayoutView.topLeftButton.isHidden = true
        photoLayoutView.topRightButton.isHidden = true
        photoLayoutView.bottomBigButton.isHidden = true
        
        
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeUp))
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeLeft))
        swipeUpGesture.direction = UISwipeGestureRecognizer.Direction.up
        swipeLeftGesture.direction = UISwipeGestureRecognizer.Direction.left
        mainView.addGestureRecognizer(swipeUpGesture)
        mainView.addGestureRecognizer(swipeLeftGesture)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func handleSwipeUp() {
        if UIDevice.current.orientation.isPortrait {
            share()
        }
    }
    
    @objc func handleSwipeLeft() {
        if UIDevice.current.orientation.isLandscape {
            share()
        }
    }
    
    func share() {
        let image = viewToImage()
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        present(vc, animated: true)
    }
    
    func viewToImage() -> UIImage{
        let renderer = UIGraphicsImageRenderer(size: photoLayoutView.bounds.size)
        let image = renderer.image { ctx in
            photoLayoutView.drawHierarchy(in: photoLayoutView.bounds, afterScreenUpdates: true)
        }
        return image
    }
    
    @IBOutlet weak var photoLayoutView: photoLayoutView!
    
    var selectedButton: UIButton?
    @IBAction func buttonTap(_ sender: UIButton) {
        selectedButton = sender
        selectingImage()
    }
    
    func selectingImage() {
        let selectImageController = UIImagePickerController()
        selectImageController.delegate = self
        
        selectImageController.sourceType = UIImagePickerController.SourceType.photoLibrary
        selectImageController.allowsEditing = false
        
        self.present(selectImageController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectedButton?.setImage(image, for: UIControl.State.normal)
            selectedButton?.imageView?.contentMode = .scaleAspectFill
            if let button = selectedButton {
                grid.images[button.tag] = image
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func layoutChange(_ sender: UIButton) {
        if let newLayout = Layout.init(rawValue: sender.tag) {
            setSelectedIcon(senderTag: sender.tag)
            grid.layout = newLayout
            photoLayoutView.updateFromGrid(grid: grid)
        }
    }
    
    func setSelectedIcon(senderTag: Int) {
        if let selectedButton = self.view.viewWithTag(senderTag) as? UIButton {
            for tag in 1...3 {
                if tag == senderTag {
                    selectedButton.setImage( #imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
                }
                else {
                    if let button = self.view.viewWithTag(tag) as? UIButton {
                        button.setImage(button.backgroundImage(for: UIControl.State.normal), for: UIControl.State.normal)
                    }
                }
            }
            
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if let previousOrientation = previousTraitCollection {
            if previousOrientation.verticalSizeClass.rawValue == 2 {
                shareLabel.text = "Swipe left to share"
            }
            else {
                shareLabel.text = "Swipe up to share"
            }
        }
    }
}

