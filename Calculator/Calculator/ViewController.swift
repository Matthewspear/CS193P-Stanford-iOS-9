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
  @IBOutlet private var display: UILabel!
  
  private var userIsInTheMiddleOfTyping = false
  
  @IBAction private func touchDigit(sender: UIButton)
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
  
  private var displayValue: Double
    {
    get {
      return Double(display.text!)!
    }
    set {
      display.text = String(newValue)
    }
  }
  
  private var brain: CalculatorBrain = CalculatorBrain()
  
  @IBAction private func performOperation(sender: UIButton)
  {
    if userIsInTheMiddleOfTyping
    {
      brain.setOperand(displayValue)
      userIsInTheMiddleOfTyping = false
    }
    
    if let mathematicalSymbol = sender.currentTitle
    {
      brain.performOperation(mathematicalSymbol)
    }
    displayValue = brain.result
    
    //     // Old copy...
    //      if mathematicalSymbol == "π"
    //      {
    //        display.text = String(M_PI)
    //        displayValue = M_PI
    //      }
    //      else if mathematicalSymbol == "√"
    //      {
    //        displayValue = sqrt(displayValue)
    //      }
  }
}


