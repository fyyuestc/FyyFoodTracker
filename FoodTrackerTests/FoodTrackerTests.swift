//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Jane Appleseed on 10/17/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //以test开头测试成功的案例
    func testMealInitialSuccess(){
        //有名且rating在范围内
        let zeroRatingMeal = Meal.init(name: "zeroTest", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        let positiveRatingMeal = Meal.init(name: "positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    //以test开头但测试失败的案例
    func testMealInitialFail(){
        //rating为负数
        let negativeRating = Meal.init(name: "negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRating)
        //rating超界
        let overRatingMeal = Meal.init(name: "overRating", photo: nil, rating: 6)
        XCTAssertNil(overRatingMeal)
        //没名字的
        let unamedMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(unamedMeal)
    }
    
    
  
    
    
}
