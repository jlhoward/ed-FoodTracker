//
//  ViewController.swift
//  FoodTracker-Ed
//
//  Created by Jeff Howard on 11/5/16.
//  Copyright © 2016 Jeff Howard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Enable ViewControl to handle delegate callbacks for the text field
        nameTextField.delegate = self
        
    }
    
    // MARK:  UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        // This method gives us a chance to evaluate the information entered
        // We are setting the meal Label to match what was entered
        mealNameLabel.text = textField.text
        
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //The second UIImagePickerControllerDelegate method that you need to implement, 
        // imagePickerController(_:didFinishPickingMediaWithInfo:), gets called when a 
        // user selects a photo. This method gives you a chance to do something with
        // the image or images that a user selected from the picker. In your case, you’ll
        // take the selected image and display it in your UI.
        
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        //The info dictionary contains the original image that was selected in the picker,
        // and the edited version of that image, if one exists. To keep things simple, 
        // you’ll use the original, unedited image for the meal photo, which is what this 
        // line of code stores into the selectedImage constant.
    
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //If nothing happens then you may have run into a privacy issue
        // check the debug logs in this case, I need to set a key
        // NSPhotoLibraryUsageDescription  in the Info.plist
        //
        // check https://developer.apple.com/library/prerelease/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW17
        // And check http://stackoverflow.com/questions/39519773/nsphotolibraryusagedescription-key-must-be-present-in-info-plist-to-use-camera-r
        
        //Hide the Keyboard
        nameTextField.resignFirstResponder()
        
        //Let user user select a photo from their media library,  
        //UIImpagePickerControl is a view control for photo media
        // setting the source time to Photo Library limits to the
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        
        //make sure the imagePicker knows when an image is selecte
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
            mealNameLabel.text = "Default Text"
    }
    
    // MARK:  Old commented out code
    //override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }

    //@IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
                //Hide the keyboard
    //          nameTextField.resignFirstResponder()
    //}


}

