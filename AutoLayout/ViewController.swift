//
//  ViewController.swift
//  AutoLayout
//
//  Created by Achsuthan Mahendran on 12/31/19.
//  Copyright © 2019 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Lets Avaoid polluting ViewLoad
    //{} is referred to as a closure, or anon. function
    let bearImageView: UIImageView = {
         //Create a imageview
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        //This enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //Fit the image to imageView
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let lblTextView: UITextView = {
        let textView = UITextView()
        //Enable the autolayout to uitextview 
        textView.translatesAutoresizingMaskIntoConstraints = false
        //Set the bold font to textview
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        //Make it center alligned
        textView.textAlignment = .center
        //Disable editable
        textView.isEditable = false
        //Disable selectable
        textView.isSelectable = false
        //Disable scrollable
        textView.isScrollEnabled = false
        //Set the text to textview
        textView.text = "Join us today in our fun and games!"
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Add the imageview to view
        //Removed becase of need to add this image view to image container
        //view.addSubview(bearImageView)
        view.addSubview(lblTextView)
        
        setupLayout()
    }
    
    private func setupLayout(){
        //Create a container for put the iamge into all the screen sizes
        let topImageContainerView = UIView()
        //Add the image container to view
        view.addSubview(topImageContainerView)
        //Enable auto layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        //Set the top anchor from top view
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //Set the leading anchor from view leading anchor
        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //Set the trailling acchor from view trilling anchor
        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //Set the height of the view with the 0.5 multyplier of device height anchor
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        //Add the image view to topImagecontainer
        topImageContainerView.addSubview(bearImageView)
        //Set the image to center align with image container
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        //Set the iamge height related with topimage container with the multiplier of 0.5
        bearImageView.heightAnchor.constraint(lessThanOrEqualTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        /**
         //Commented becase it should be related with the top image container
         //This is for center y
         //imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
         //Set the top value
         bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
         //This is for center x
         bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         //Set the width for image
         bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
         //Set the height for image
         bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
         //.isActive = true is used to activate the constrain
         ***/
        
        
        
        //Set the top anchor from TopImageContiner bottom 0
        lblTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 0).isActive = true
        //Commented its shoubld be based on the topImagecontainer view
        //lblTextView.topAnchor.constraint(equalTo: bearImageView.bottomAnchor, constant: 100).isActive = true
        //Left side will start from left side of the view
        lblTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //Right side end up with the right side of the view
        lblTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //This is must to view the label in the view
        lblTextView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 0).isActive = true
    }
    
    
}

