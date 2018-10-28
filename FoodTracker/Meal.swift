//
//  Meal.swift
//  FoodTracker
//
//  Created by fanyunyimac on 2018/10/28.
//  Copyright © 2018年 Apple Inc. All rights reserved.
//

import UIKit
class Meal {
    var name : String
    var photo : UIImage?
    var rating : Int
    //名字和分数不能为空，图片为可选类型
    init?(name : String, photo : UIImage?, rating : Int) {
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
