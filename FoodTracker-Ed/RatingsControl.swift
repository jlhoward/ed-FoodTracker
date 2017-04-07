//
//  RatingsControl.swift
//  FoodTracker-Ed
//
//  Created by Jeff Howard on 11/27/16.
//  Copyright © 2016 Jeff Howard. All rights reserved.
//

import UIKit

class RatingsControl: UIView {

//MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButtons()
        
    }

//MARK:  Button Action
    func ratingButtonTapped(button: UIButton){
        print("button pressed 👍")
    }
    
//MARK:  Private Methods
    
    private func setupButtons() {
        //Create the button
        
        //Revised approach
         let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
         button.backgroundColor = UIColor.red
        
        //register button action
        button.addTarget(self, action: #selector(RatingsControl.ratingButtonTapped(button:)), for: .touchUpInside)
        //Add Button to Stack
         addSubview(button)
         
        
        /*
         // Text orignal code
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        
        //add Constraints
        button.translatesAutoresizingMaskIntoConstraints = false   //igrnores buttons defined characteristics
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        //add button to stack
        addSubview(button)
        */
        
    }
    
//MARK: Old Ratings Control code
    /*
     
     override func intrinsicContentSize() -> CGSize {
     return GSize(width: 240, height: 40)
     }
     
     Ignore for purposes of this app
    
     // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
