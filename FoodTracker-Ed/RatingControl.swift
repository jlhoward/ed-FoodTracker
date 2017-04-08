//
//  RatingControl.swift
//  FoodTracker-Ed
//
//  Created by Jeff Howard on 4/8/17.
//  Copyright © 2017 Jeff Howard. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

  //MARK: Initalizer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Private Methods
    private func setupButtons() {
        
        //Create the button
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        //Add Constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        //Add button to the stack
        addArrangedSubview(button)
        
    }
}
