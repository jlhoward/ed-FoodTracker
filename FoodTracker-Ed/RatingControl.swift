//
//  RatingControl.swift
//  FoodTracker-Ed
//
//  Created by Jeff Howard on 4/8/17.
//  Copyright © 2017 Jeff Howard. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0
    /*
        Keeping the buttons private but exposing the final rating
     
    */

    //MARK: Initalizer
    override init(frame Frame: CGRect) {
        super.init(frame: Frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
            print("Button Pressed 👍")
    }
    
    
    //MARK: Private Methods
    private func setupButtons() {
        
        //Logging
        print("setupButtons Called 🤙")
        
        //Create 5
        for _ in 0..<5 {
            //Create the button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            //Add Constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            //Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            /* lots of stuff going on....
            The target is self, which refers to the current instance of the enclosing class. In this case, it refers to the RatingControl object that is setting up the buttons.
            The #selector expression returns the Selector value for the provided method. A selector is an opaque value that identifies the method. Older APIs used selectors to dynamically invoke methods at runtime. While newer APIs have largely replaced selectors with blocks, many methods—like performSelector(_:) and addTarget(_:action:forControlEvents:)—still take selectors as arguments. In this example, the #selector(RatingControl.ratingButtonTapped(_:)) expression returns the selector for your ratingButtonTapped(_:) action method. This lets the system call your action method when the button is tapped.
            The UIControlEvents option set defines a number of events that controls can respond to. Typically buttons respond to the .touchUpInside event. This occurs when the user touches the button, and then lifts their finger while the finger is still within the button’s bounds. This event has an advantage over .touchDown, because the user can cancel the event by dragging their finger outside the button before lifting it.
            Note that because you’re not using Interface Builder, you don’t need to define your action method with the IBAction attribute; you just define the action like any other method. You can use a method that takes no arguments, that takes a single sender argument, or that takes both a sender and an event argument.
             */
            
            
            //Add button to the stack
            addArrangedSubview(button)
            
            //Track the button in the array
            ratingButtons.append(button)
        }
    }
}
