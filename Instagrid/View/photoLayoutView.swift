//
//  photoLayoutView.swift
//  Instagrid
//
//  Created by Simon Dahan on 01/12/2019.
//  Copyright © 2019 Simon Dahan. All rights reserved.
//

import UIKit

class photoLayoutView: UIView {
    
    @IBOutlet weak var bottomBigButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var topLeftButton: UIButton!
    
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBOutlet weak var topBigButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    
    @IBOutlet var selectedButton: [UIButton]!
    var selectedLayout = 0
    
    func changeLayout() {
        switch selectedLayout {
        case 1:
            topLeftButton.isHidden = true
            topRightButton.isHidden = true
            bottomBigButton.isHidden = true
            
            topBigButton.isHidden = false
            bottomLeftButton.isHidden = false
            bottomRightButton.isHidden = false
            
            
        case 2:
            topLeftButton.isHidden = false
            topRightButton.isHidden = false
            bottomBigButton.isHidden = false
            
            topBigButton.isHidden = true
            bottomLeftButton.isHidden = true
            bottomRightButton.isHidden = true
            
        case 3:
            topLeftButton.isHidden = false
            topRightButton.isHidden = false
            bottomBigButton.isHidden = true
            
            topBigButton.isHidden = true
            bottomLeftButton.isHidden = false
            bottomRightButton.isHidden = false
            
        default:
            topLeftButton.isHidden = true
            topRightButton.isHidden = true
            bottomBigButton.isHidden = true
            
            topBigButton.isHidden = false
            bottomLeftButton.isHidden = false
            bottomRightButton.isHidden = false
        }
    }
    func reinitialiseButtonImage() {
        for button in self.selectedButton {
            button.setImage(#imageLiteral(resourceName: "Plus"), for: UIControl.State.normal)
        }
    }
}
