//
//  FoodTracker_EdTests.swift
//  FoodTracker-EdTests
//
//  Created by Jeff Howard on 11/5/16.
//  Copyright © 2016 Jeff Howard. All rights reserved.
//

import XCTest
@testable import FoodTracker_Ed

class FoodTracker_EdTests: XCTestCase {
    
    func testMealInitalizationSuccessds() {
        //Test lowest allowable value
        let zeroRatingMeal = Meal.init(initName: "Zero", initPhoto: nil, initRating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        //Test Max allowable valuie
        let maxRatingMeal = Meal.init(initName: "Max", initPhoto: nil, initRating: 5)
        XCTAssertNotNil(maxRatingMeal)
        
    }
    
    func testMealInitalizationFails() {
        //Test fail modes
        let noNameMeal = Meal.init(initName: "", initPhoto: nil, initRating: 0)
        XCTAssertNil(noNameMeal)
        
        let negRatingMeal = Meal.init(initName: "NegRating", initPhoto: nil, initRating: -1)
        XCTAssertNil(negRatingMeal)
        
        let largeRatingMeal = Meal.init(initName: "LARGE!", initPhoto: nil, initRating: 7)
        XCTAssertNil(largeRatingMeal)
    }
    
    //MARK: Meal Class Tests
    
    //MARK: Original code/generated code
    
    /****
    * Originally imported/generated code
 
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    */
    
}
