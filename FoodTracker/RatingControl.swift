//
//  RatingControl.swift
//  FoodTracker
//
//  Created by student on 2018/10/20.
//  Copyright © 2018年 Apple Inc. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //五个图标按钮
    private var ratingButtons = [UIButton]()
    //菜品的评分数
    var ratingScore = 0 {
        didSet {
            updateButtonSelectedStatus()
        }
    }
    
    //用户按下评分按钮后更新按钮们的状态
    private func updateButtonSelectedStatus() {
        for (index,button) in ratingButtons.enumerated() {
            button.isSelected = index < ratingScore
            //不是很懂这个部分
            let hintString: String?
            if ratingScore == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            let valueString: String
            switch (ratingScore) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(ratingScore) stars set."
            }
            
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
    
    //Add inspectable properties
    @IBInspectable var startSize : CGSize = CGSize(width : 44.0, height:44.0) {
        didSet {
            setUpButtons()
        }
    }
    @IBInspectable var starCount : Int = 5 {
        didSet {
            setUpButtons()
        }
    }
    
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
    
    //评分按钮被按下的方法
    func ratingButtonclicked(button:UIButton){
        //如果UIbutton在按钮中
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        //显示点击的按钮的分数
        let selectedRating = index + 1
        //如果是重复点击的话则置为0
        if selectedRating == ratingScore {
            ratingScore = 0
        } else {
            // 否则置为点击按钮的分数
            ratingScore = selectedRating
        }
    }
    
    //创建五个图标按钮
    private func setUpButtons(){
        //清除存在的按钮
        for button in ratingButtons {
            //he view’s position and size will no longer be managed by the stack view.
            removeArrangedSubview(button)
            //清除视图
            button.removeFromSuperview()
        }
        //加载按钮图像，ensure the system can find and load the image
        //means that the app can load th images using the UImage()
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightStar = UIImage(named: "highlightStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            let button = UIButton()
            //设置按钮图像
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightStar, for: .highlighted)
            button.setImage(highlightStar, for: [.highlighted,.selected])
            button.backgroundColor = UIColor.yellow
            //因为是stack view 所以不用自己加约束，否则会冲突
            //button.translatesAutoresizingMaskIntoConstraints = false
            //button.heightAnchor.constraint(equalToConstant: startSize.height).isActive = true
            //button.widthAnchor.constraint(equalToConstant: startSize.width).isActive = true
            //set the accessibility label
            button.accessibilityLabel = "Set \(index) star rating!!!"
            //按钮按下调用的方法
            button.addTarget(self, action: #selector(RatingControl.ratingButtonclicked(button:)), for: .touchUpInside)
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
        updateButtonSelectedStatus()
    }
    
}
