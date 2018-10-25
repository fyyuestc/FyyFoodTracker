//
//  RatingControl.swift
//  FoodTracker
//
//  Created by student on 2018/10/20.
//  Copyright © 2018年 Apple Inc. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    //两个构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpButtons()
    }
    //Right now,your initializers are placeholders that simply call the superclass's implements
    
    //创建图标按钮
    private func setUpButtons(){
         let button = UIButton()
         button.backgroundColor = UIColor.red
         button.translatesAutoresizingMaskIntoConstraints = false
         button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
         button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
         addArrangedSubview(button)
    }
}
