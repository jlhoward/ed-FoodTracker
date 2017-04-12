//
//  RatingControl.swift
//  FoodTracker-Ed
//
//  Created by Jeff Howard on 4/8/17.
//  Copyright © 2017 Jeff Howard. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //@IB....  lets the Interface Builder connect to the app
    
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectedStates()
        }
    }
    
    /*      Keeping the buttons private but exposing the final rating
    */
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
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
        
        // determine which button was pressed.
        guard let index = ratingButtons.index(of: button) else {
            fatalError("Button not in the index, fatal error for button: \(button)")
        }
        
        // calculate the rating of the button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
        
    }
    
    
    //MARK: Private Methods
    private func setupButtons() {
        
        //Logging
        print("setupButtons Called 🤙")
        
        //clear old buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
    
        //Load up Button Images
        let ratingImageBungle = Bundle(for: type(of: self))
        let filledStar =  UIImage(named: "filledStar", in: ratingImageBungle, compatibleWith: self.traitCollection)
        let emptyStar =  UIImage(named: "emptyStar", in: ratingImageBungle, compatibleWith: self.traitCollection )
        let highlightedStar = UIImage(named: "highlightedStar", in: ratingImageBungle, compatibleWith: self.traitCollection)
        
        //Create as many buttons as is defined in starCount
        for forIndex in 0..<starCount {
            //Create the button
            let button = UIButton()
            //button.backgroundColor = UIColor.red
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted,.selected])
            
            
            //Add Constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Set the accessibility label
            button.accessibilityLabel = "Set \(forIndex + 1) star rating star rating"

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
        
        updateButtonSelectedStates()
    }
    
    private func updateButtonSelectedStates() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
            
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            let valueString: String
            switch( rating ) {
                case 0: valueString = "No rating set"
                case 1: valueString = "1 star set"
                default: valueString = "\(rating) stars set"
            }
            
            //assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
    
}
