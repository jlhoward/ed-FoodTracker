//
//  Meal.swift
//  FoodTracker-Ed
//
//  Created by Jeff Howard on 4/13/17.
//  Copyright © 2017 Jeff Howard. All rights reserved.
//

//import Foundation  <<-- UIKit includes foundation, adding UIKit to work with the UI apps
import UIKit

class Meal {
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //var = variable, let = constant
    
    //MARK: Initalization
    init?(initName: String, initPhoto: UIImage?, initRating: Int){
        
        //fail if the name or rating are not set
        guard !initName.isEmpty else { return nil }
        guard initRating <= 5 || initRating > 0 else { return nil }
        
        //Set properties
        self.name = initName
        self.photo = initPhoto
        self.rating = initRating
    }
}


