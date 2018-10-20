//
//  RatingControl.swift
//  FoodTracker
//
//  Created by student on 2018/10/20.
//  Copyright © 2018年 Apple Inc. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    //Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    //Right now,your initializers are placeholders that simply call the superclass's implements
    
    //Create button
    private func setUpButton(){
         let button = UIButton()
        button.backgroundColor = UIColor.blue
        
    }
}
