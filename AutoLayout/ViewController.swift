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
        
        
        //Create a Attributed Text
        //Add the text with heading style
        let attributtedText  = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributtedText.append(NSMutableAttributedString(string: "\n\n\n Are you ready for loads and loads of fun? Don't wait any longer! we hope to see you in our stores soon", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSMutableAttributedString.Key.strikethroughColor: UIColor.gray]))
        //Set the text to textview
        textView.attributedText = attributtedText
        
        //Set the bold font to textview
        //Commented becase we are goin to add attributted text
        //textView.font = UIFont.boldSystemFont(ofSize: 18)
        //Make it center alligned
        textView.textAlignment = .center
        //Disable editable
        textView.isEditable = false
        //Disable selectable
        textView.isSelectable = false
        //Disable scrollable
        textView.isScrollEnabled = false
        return textView
    }()
    
    let btButtonPrev :  UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let lblButtonPrevTitle: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    let lblButtonNextTitle: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    let btButtonNext :  UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Add the imageview to view
        //Removed becase of need to add this image view to image container
        //view.addSubview(bearImageView)
        view.addSubview(lblTextView)
        view.addSubview(btButtonPrev)
        view.addSubview(btButtonNext)
        
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
        lblTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        //Right side end up with the right side of the view
        lblTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        //This is must to view the label in the view
        lblTextView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 0).isActive = true
        
        
        btButtonPrev.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        btButtonPrev.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btButtonPrev.heightAnchor.constraint(equalToConstant: 100).isActive = true
        btButtonPrev.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        btButtonPrev.addSubview(lblButtonPrevTitle)
        lblButtonPrevTitle.text = "PREV"
        lblButtonPrevTitle.textColor = .gray
        lblButtonPrevTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        lblButtonPrevTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        btButtonNext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        btButtonNext.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btButtonNext.heightAnchor.constraint(equalToConstant: 100).isActive = true
        btButtonNext.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        btButtonNext.addSubview(lblButtonNextTitle)
        lblButtonNextTitle.text = "NEXT"
        lblButtonNextTitle.textColor = .red
        lblButtonNextTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        lblButtonNextTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        let indexViewContainer = UIView()
        indexViewContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(indexViewContainer)
        indexViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indexViewContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true
        indexViewContainer.widthAnchor.constraint(equalToConstant: 80).isActive = true
        indexViewContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        let index1 = UIView()
        index1.translatesAutoresizingMaskIntoConstraints = false
        indexViewContainer.addSubview(index1)
        index1.widthAnchor.constraint(equalTo: indexViewContainer.widthAnchor, multiplier: 0.25).isActive = true
        index1.heightAnchor.constraint(equalTo: indexViewContainer.heightAnchor).isActive = true
        index1.leadingAnchor.constraint(equalTo: indexViewContainer.leadingAnchor).isActive = true
        
        
        let round1 = UIView()
        round1.backgroundColor = .red
        round1.translatesAutoresizingMaskIntoConstraints = false
        index1.addSubview(round1)
        round1.centerXAnchor.constraint(equalTo: index1.centerXAnchor).isActive = true
        round1.centerYAnchor.constraint(equalTo: index1.centerYAnchor).isActive = true
        round1.widthAnchor.constraint(equalToConstant: 10).isActive = true
        round1.heightAnchor.constraint(equalToConstant: 10).isActive = true
        round1.layer.cornerRadius = 5
        
        
        let index2 = UIView()
        index2.translatesAutoresizingMaskIntoConstraints = false
        indexViewContainer.addSubview(index2)
        index2.widthAnchor.constraint(equalTo: indexViewContainer.widthAnchor, multiplier: 0.25).isActive = true
        index2.heightAnchor.constraint(equalTo: indexViewContainer.heightAnchor).isActive = true
        index2.leadingAnchor.constraint(equalTo: index1.trailingAnchor).isActive = true
        
        
        let round2 = UIView()
        round2.backgroundColor = .gray
        round2.translatesAutoresizingMaskIntoConstraints = false
        index2.addSubview(round2)
        round2.centerXAnchor.constraint(equalTo: index2.centerXAnchor).isActive = true
        round2.centerYAnchor.constraint(equalTo: index2.centerYAnchor).isActive = true
        round2.widthAnchor.constraint(equalToConstant: 10).isActive = true
        round2.heightAnchor.constraint(equalToConstant: 10).isActive = true
        round2.layer.cornerRadius = 5
        
        
        let index3 = UIView()
        index3.translatesAutoresizingMaskIntoConstraints = false
        indexViewContainer.addSubview(index3)
        index3.widthAnchor.constraint(equalTo: indexViewContainer.widthAnchor, multiplier: 0.25).isActive = true
        index3.heightAnchor.constraint(equalTo: indexViewContainer.heightAnchor).isActive = true
        index3.leadingAnchor.constraint(equalTo: index2.trailingAnchor).isActive = true
        
        let round3 = UIView()
        round3.backgroundColor = .gray
        round3.translatesAutoresizingMaskIntoConstraints = false
        index3.addSubview(round3)
        round3.centerXAnchor.constraint(equalTo: index3.centerXAnchor).isActive = true
        round3.centerYAnchor.constraint(equalTo: index3.centerYAnchor).isActive = true
        round3.widthAnchor.constraint(equalToConstant: 10).isActive = true
        round3.heightAnchor.constraint(equalToConstant: 10).isActive = true
        round3.layer.cornerRadius = 5
        
        
        let index4 = UIView()
        index4.translatesAutoresizingMaskIntoConstraints = false
        indexViewContainer.addSubview(index4)
        index4.widthAnchor.constraint(equalTo: indexViewContainer.widthAnchor, multiplier: 0.25).isActive = true
        index4.heightAnchor.constraint(equalTo: indexViewContainer.heightAnchor).isActive = true
        index4.leadingAnchor.constraint(equalTo: index3.trailingAnchor).isActive = true
        
        
        let round4 = UIView()
        round4.backgroundColor = .gray
        round4.translatesAutoresizingMaskIntoConstraints = false
        index4.addSubview(round4)
        round4.centerXAnchor.constraint(equalTo: index4.centerXAnchor).isActive = true
        round4.centerYAnchor.constraint(equalTo: index4.centerYAnchor).isActive = true
        round4.widthAnchor.constraint(equalToConstant: 10).isActive = true
        round4.heightAnchor.constraint(equalToConstant: 10).isActive = true
        round4.layer.cornerRadius = 5
        
        
    }
    
    
}

