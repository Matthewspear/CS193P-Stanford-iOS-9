//
//  ViewController.swift
//  Calculator
//
//  Created by Matthew Spear on 22/04/2016.
//  Copyright © 2016 Matthew Spear. All rights reserved.
//

// This is called a module
import UIKit

// class called 'ViewController', inheriting from UIViewController
class ViewController: UIViewController
{
  @IBOutlet var display: UILabel!
  
  var userIsInTheMiddleOfTyping = false
  
  @IBAction func touchDigit(sender: UIButton)
  {
    let digit = sender.currentTitle!
    
    if userIsInTheMiddleOfTyping
    {
      let textCurrentlyInDisplay = display.text!
      display.text = textCurrentlyInDisplay + digit
    }
    else
    {
      display.text = digit
    }
    userIsInTheMiddleOfTyping = true
  }
  
  @IBAction func performOperation(sender: UIButton)
  {
    userIsInTheMiddleOfTyping = false
    if let mathematicalSymbol = sender.currentTitle
    {
      if mathematicalSymbol == "π"
      {
        display.text = String(M_PI)
      }
    }
    
  }
}

