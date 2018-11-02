//
//  Meal.swift
//  FoodTracker
//
//  Created by fanyunyimac on 2018/10/28.
//  Copyright © 2018年 Apple Inc. All rights reserved.
//

import UIKit
import os.log
//编码时需要用到的coding key
struct PropertyKey {
    static let name = "name"
    static let photo = "photo"
    static let rating = "rating"
}

class Meal : NSObject,NSCoding{
    //存储数据的文件路径(URL)
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let storeURL = DocumentsDirectory.appendingPathComponent("fyyMeals")
    
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
    
    //把Meal类各个属性编码，根据coding key
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience  init?(coder aDecoder: NSCoder) {
        //因为decodeObject(forKey:方法返回的是Any？,所以加上guard
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("不能解码姓名name", log: OSLog.default, type: .debug)
            return nil
        }
        //因为photo是UIImage？类型
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        //因为decodeInteger(forKey:方法返回的是Int
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        //便利构造器中必须使用指派构造器
        self.init(name: name, photo: photo, rating: rating)
    }
    
}
