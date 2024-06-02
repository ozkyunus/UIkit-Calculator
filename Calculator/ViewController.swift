import UIKit

class ViewController: UIViewController {
    
    var firstNum : String = "";
    var operation: String = "";
    var secondNum: String = "";
    var haveResult: Bool = false;
    var resultnumber: String = "";
    var numAfterresult: String = "";
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
        if operation == "" {
            firstNum += String(sender.tag);
            resultScreen.text = firstNum
        } else if operation != "" && !haveResult {
            secondNum += String(sender.tag);
            resultScreen.text = secondNum;
        }
        else if operation != "" && haveResult {
            numAfterresult += String(sender.tag)
            resultScreen.text = numAfterresult
        }
    }
    
    @IBOutlet weak var resultScreen: UILabel!
    
    @IBAction func operateButtons(_ sender: UIButton) {
        if sender.tag == 10 {
            clearAll()
        }
        else if sender.tag == 17 {
            resultnumber = String(doOperation())
            let numArray = resultnumber.components(separatedBy: ".")
            if numArray.count > 1 && numArray[1] == "0" {
                resultScreen.text = numArray[0]
            } else {
                resultScreen.text = resultnumber
            }
            numAfterresult = ""
        }
        else if sender.tag == 16 {
            operation = "+"
        }
        else if sender.tag == 15 {
            operation = "-"
        }
        else if sender.tag == 14 {
            operation = "x"
        }
        else if sender.tag == 13 {
            operation = "/"
        }
        else if sender.tag == 11 {
            multipMinus()
        }
        else if sender.tag == 12 {
            percent()
        }
        else if sender.tag == 18 {
            comma()
        }
        
    }
    
    func clearAll() {
        firstNum = ""
        secondNum = ""
        operation = ""
        haveResult = false
        resultnumber = ""
        numAfterresult = ""
        resultScreen.text = "0"
    }
    
    func multipMinus() {
        if operation == "" {
            if let firstNumber = Double(firstNum) {
                firstNum = String(firstNumber * -1)
                resultScreen.text = firstNum
            }
        } else if operation != "" && !haveResult {
            if let secondNumber = Double(secondNum) {
                secondNum = String(secondNumber * -1)
                resultScreen.text = secondNum
            }
        } else if operation != "" && haveResult {
            if let numberAfterResult = Double(numAfterresult) {
                numAfterresult = String(numberAfterResult * -1)
                resultScreen.text = numAfterresult
            } else if let resultNumber = Double(resultnumber) {
                resultnumber = String(resultNumber * -1)
                resultScreen.text = resultnumber
            }
        }
    }
    func percent() {
        if operation == "" {
            if let firstNumber = Double(firstNum) {
                firstNum = String(firstNumber * 0.01)
                resultScreen.text = firstNum
            }
        } else if operation != "" && !haveResult {
            if let secondNumber = Double(secondNum) {
                secondNum = String(secondNumber * 0.01)
                resultScreen.text = secondNum
            }
        } else if operation != "" && haveResult {
            if let numberAfterResult = Double(numAfterresult) {
                numAfterresult = String(numberAfterResult * 0.01)
                resultScreen.text = numAfterresult
            } else if let resultNumber = Double(resultnumber) {
                resultnumber = String(resultNumber * 0.01)
                resultScreen.text = resultnumber
            }
        }
    }
   
    func comma() {
        if operation == "" {
            if !firstNum.contains(".") {
                firstNum += "."
                resultScreen.text = firstNum
            }
        } else if operation != "" && !haveResult {
            if !secondNum.contains(".") {
                secondNum += "."
                resultScreen.text = secondNum
            }
        } else if operation != "" && haveResult {
            if !numAfterresult.contains(".") {
                numAfterresult += "."
                resultScreen.text = numAfterresult
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func doOperation() -> Double {
           if operation == "+" {
               if !haveResult {
                   haveResult = true;
                   let result = Double(firstNum)! + Double(secondNum)!
                   firstNum = String(result)
                   resultScreen.text = firstNum
                   return result
               }
               else {
                   let result = Double(resultnumber)! + Double(numAfterresult)!
                   resultnumber = String(result)
                   resultScreen.text = resultnumber
                   return result                }
           }
           else if operation == "-" {
               if !haveResult {
                   haveResult = true;
                   let result = Double(firstNum)! - Double(secondNum)!
                   firstNum = String(result)
                   resultScreen.text = firstNum
                   return result
               }
               else {
                   let result = Double(resultnumber)! - Double(numAfterresult)!
                   resultnumber = String(result)
                   resultScreen.text = resultnumber
                   return result                }
           }
           else if operation == "x" {
               if !haveResult {
                   haveResult = true;
                   let result = Double(firstNum)! * Double(secondNum)!
                   firstNum = String(result)
                   resultScreen.text = firstNum
                   return result
               }
               else {
                   let result = Double(resultnumber)! * Double(numAfterresult)!
                   resultnumber = String(result)
                   resultScreen.text = resultnumber
                   return result                }
           }
           else if operation == "/" {
               if !haveResult {
                   haveResult = true;
                   let result = Double(firstNum)! / Double(secondNum)!
                   firstNum = String(result)
                   resultScreen.text = firstNum
                   return result
               }
               else {
                   let result = Double(resultnumber)! / Double(numAfterresult)!
                   resultnumber = String(result)
                   resultScreen.text = resultnumber
                   return result                }
           }
           
           return 0;
       }
       
       
   }
