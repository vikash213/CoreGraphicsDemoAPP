//
//  ViewController.swift
//  CoreGraphicsDemoAPP
//
//  Created by Appinventiv on 28/12/18.
//  Copyright © 2018 Vikash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var roundedButton: CustomButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    
    // MARK: - Variables
    var isGraphViewShowing = false
    
    // MARK: - View's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        counterLabel.text = String(counterView.counter)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.8, delay: 0.1, options: .curveEaseInOut, animations: {
            self.bottomConstraint.constant = 50
            self.roundedButton.alpha = 0.2
            // self.roundedButton.setBackground(color: UIColor(red: 203/255, green: 203/255, blue: 255/255, alpha: 0.2))
            //self.roundedButton.backgroundColor = UIColor(red: 203/255, green: 203/255, blue: 255/255, alpha: 0.2)
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.setNeedsLayout()
        UIView.animate(withDuration: 2.0, delay: 0.2, options: .transitionFlipFromBottom, animations: {
            self.bottomConstraint.constant = 150
            self.roundedButton.alpha = 0.8
            //self.roundedButton.setBackground(color: UIColor(red: 127/255, green: 127/255, blue: 255/255, alpha: 1.0))
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    //MARK: - IBActions
    @IBAction func clickButton(_ sender: CustomButton) {
        UIView.animate(withDuration: 3.0, delay: 0.4, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
            self.bottomConstraint.constant = 200
            self.roundedButton.alpha = 0.6
            self.roundedButton.layer.shadowColor = UIColor.lightGray.cgColor
            self.roundedButton.layer.shadowOffset = CGSize(width: 3, height: 3)
            self.roundedButton.layer.shadowRadius = 5
            self.roundedButton.layer.shadowOpacity = 1.0
            self.view.layoutIfNeeded()
            
        }, completion: { (success) in
            // self.roundedButton.alpha = 0.8
        })
        
        if sender.isAddButton && counterView.counter < 8{
            counterView.counter += 1
        } else if !sender.isAddButton {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
        if isGraphViewShowing {
            counterViewTap(nil)
        }
    }
    
    // Tap gesture actions
    @IBAction func counterViewTap(_ gesture: UITapGestureRecognizer?) {
        if (isGraphViewShowing) {
            //hide Graph
            UIView.transition(from: graphView,
                              to: counterView,
                              duration: 1.0,
                              options: [.transitionFlipFromLeft, .showHideTransitionViews],
                              completion:nil)
        } else {
            //show Graph
            UIView.transition(from: counterView,
                              to: graphView,
                              duration: 1.0,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
        
    }
  
}

