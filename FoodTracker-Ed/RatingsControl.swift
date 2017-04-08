//
//  RatingsControl.swift
//  FoodTracker-Ed
//
//  Created by Jeff Howard on 11/27/16.
//  Copyright © 2016 Jeff Howard. All rights reserved.
//

import UIKit

class RatingsControl: UIStackView {

    
//MARK: Init
    override init(frame: CGRect) {
        
        print("RatingsControl.init called")
        super.init(frame: frame)
        setupButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        //can't call print on a required init
        //print("RatingsControl.init? called")
        //setupButtons()
        super.init(coder: aDecoder)
        
        
    }

//MARK:  Button Action
    func ratingButtonTapped(button: UIButton){
        print("button pressed 👍")
    }
    
//MARK:  Private Methods
    
    private func setupButtons() {
        //Create the button
        print("button setup")
        
        /*
        //Revised approach
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.backgroundColor = UIColor.red
        button.translatesAutoresizingMaskIntoConstraints = false
       
        //register button action
        button.addTarget(self, action: #selector(RatingsControl.ratingButtonTapped(button:)), for: .touchUpInside)
       
        //Add Button to Stack
        //addSubview(button)
        addSubview(button)
        */
        
        //Code Per Project Tutorial
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        //Add Constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        //Add to the stack
        addArrangeSubview(button)
         
        
        
    }
}
