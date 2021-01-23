//
//  CircularButton.swift
//  SimonSays
//
//  Created by Klaus Fischer on 23.01.21.
//

import UIKit

class CircularButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = frame.size.height * 0.5
        layer.masksToBounds = true
        
    }

    override var isHighlighted: Bool{
        didSet{
            alpha = isHighlighted ? 1.0 : 0.5
        }
    }
    
}
