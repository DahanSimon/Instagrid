//
//  photoLayoutView.swift
//  Instagrid
//
//  Created by Simon Dahan on 01/12/2019.
//  Copyright © 2019 Simon Dahan. All rights reserved.
//

import UIKit

class PhotoLayoutView: UIView {
    
    
    @IBOutlet weak var bottomBigButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var topLeftButton: UIButton!
    
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBOutlet weak var topBigButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    
    @IBOutlet var buttonsArray: [UIButton]!
    
    func updateFromGrid(grid: Grid) {
        changeLayout(grid.layout)
        reinitialiseButtonImage(images: grid.images)
    }
    
    func changeLayout(_ selectedLayout: Layout) {
        switch selectedLayout {
        case .layout1:
            topLeftButton.isHidden = true
            topRightButton.isHidden = true
            bottomBigButton.isHidden = true
            
            topBigButton.isHidden = false
            bottomLeftButton.isHidden = false
            bottomRightButton.isHidden = false
            
            
        case .layout2:
            topLeftButton.isHidden = false
            topRightButton.isHidden = false
            bottomBigButton.isHidden = false
            
            topBigButton.isHidden = true
            bottomLeftButton.isHidden = true
            bottomRightButton.isHidden = true
            
        case .layout3:
            topLeftButton.isHidden = false
            topRightButton.isHidden = false
            bottomBigButton.isHidden = true
            
            topBigButton.isHidden = true
            bottomLeftButton.isHidden = false
            bottomRightButton.isHidden = false
        }
    }
    /// Set images to the right buttons
    func reinitialiseButtonImage(images: [Int: UIImage]) {
        for button in self.buttonsArray {
            if let image = images[button.tag] {
                button.setImage(image, for: UIControl.State.normal)
                button.imageView?.contentMode = .scaleToFill
            }
            else {
                button.setImage( #imageLiteral(resourceName: "Plus.png"), for: UIControl.State.normal)
            }
        }
    }
}
