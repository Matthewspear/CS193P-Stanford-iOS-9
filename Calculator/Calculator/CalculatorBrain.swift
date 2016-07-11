//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Matthew Spear on 05/07/2016.
//  Copyright © 2016 Matthew Spear. All rights reserved.
//

import Foundation
// Never import UIKit into model, shouldn't need it!!

// Global functions as opposed to a method
func multiply(op1: Double, op2: Double) -> Double
{
  return op1 * op2
}

class CalculatorBrain
{
  private var accumulator = 0.0
  private var pending: PendingBinaryOperationInfo?
  
  private var operations: Dictionary<String, Operation>
    = [
      "π": Operation.Constant(M_PI), //M_PI,
      "e": Operation.Constant(M_E),
      "±": Operation.UnaryOperation({ -$0 }),
      "√": Operation.UnaryOperation(sqrt),
      "cos": Operation.UnaryOperation(cos),
      "×": Operation.BinaryOperation({ $0 * $1 }),
      "÷": Operation.BinaryOperation({ $0 / $1 }),
      "+": Operation.BinaryOperation({ $0 + $1 }),
      "-": Operation.BinaryOperation({ $0 - $1 }),
      "=": Operation.Equals
  ]
  
  var result: Double
  {
    get
    {
      return accumulator
    }
  }
  
  private enum Operation
  {
    case Constant(Double)
    case UnaryOperation((Double) -> Double)
    case BinaryOperation((Double,Double) -> Double)
    case Equals
  }
  
  private struct PendingBinaryOperationInfo
  {
    var binaryFunction: (Double, Double) -> Double
    var firstOperand: Double
  }
  
  func setOperand(operand: Double)
  {
    accumulator = operand
  }
  
  func performOperation(symbol: String)
  {
    if let operation = operations[symbol]
    {
      switch operation
      {
      case .Constant(let value):
        accumulator = value
      case .UnaryOperation(let function):
        accumulator = function(accumulator)
      case .BinaryOperation(let function):
        executingPendingBinaryOperation()
        pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
      case .Equals:
            executingPendingBinaryOperation()
      }
    }
  }
  
  private func executingPendingBinaryOperation()
  {
    if pending != nil
    {
      accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
      pending = nil
    }
  }
}
